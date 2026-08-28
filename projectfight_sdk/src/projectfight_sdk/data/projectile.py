import json
import logging
from typing import ClassVar

from beet import (
    Context,
    DataPack,
    Function,
    JsonFileBase,
    NamespaceFileScope,
    configurable,
)

from projectfight_sdk.data import components
from projectfight_sdk.data.models.projectile_model import ProjectileModel
from projectfight_sdk.data.movement_type import PFMovementType
from projectfight_sdk.options import PFOptions
from projectfight_sdk.util.parsers import parse_identifier, path_to_dot_notation

logger = logging.getLogger("projectfight_sdk")


class PFProjectile(JsonFileBase):
    """Class representing ProjectFight projectiles."""

    scope: ClassVar[NamespaceFileScope] = ("pf_projectile",)
    extension: ClassVar[str] = ".json"
    model = ProjectileModel
    
    def bind(self, pack, path):
        super().bind(pack, path)
        namespace, path = parse_identifier(path)
    
        self.DIR_PATH                                  = f"{namespace}:pf_projectile/{path}"
        self.SUMMON_FUNCTION_PATH                      = f"{self.DIR_PATH}/summon"
        self.AS_PROJECTILE_ENTITY_SUMMON_FUNCTION_PATH = f"{self.DIR_PATH}/summon/as_projectile"
        self.PROJECTILE_TICK_FUNCTION_PATH             = f"{self.DIR_PATH}/projectile_tick"
        self.AS_PROJECTILE_ENTITY_TICK_FUNCTION_PATH   = f"{self.DIR_PATH}/projectile_tick/as_projectile"
        self.REGISTRY_FUNCTION_PATH                    = f"{namespace}:pf_projectile/register"

    @staticmethod
    def build_file(
        file: PFProjectile,
        ctx: Context,
        opts: PFOptions,
        pack: DataPack,
        identifier: str,
    ):
        logger.debug("Building %s %s", file.__class__.__name__, identifier)

        namespace, path = parse_identifier(identifier)
        definition: ProjectileModel = file.data

        # Register projectile into the PF projectile registry
        pack.functions.setdefault(file.REGISTRY_FUNCTION_PATH)
        pack.functions[file.REGISTRY_FUNCTION_PATH].append(
            Function(
                [
                    f'data modify storage pf:registry root.projectile append value "{identifier}"'
                ]
            )
        )
        pack.function_tags["pf:registry/projectile"].add(file.REGISTRY_FUNCTION_PATH)

        # entity definition
        projectile_entity_tag = f"{namespace}.projectile.{path_to_dot_notation(path)}"
        projectile_entity_data = {
            "item": {"id": "egg", "components": {"item_model": definition.item_model}},
            "Tags": ["pf.projectile", projectile_entity_tag, "pf.projectile.new"],
            "data": {"pf": {"projectile": {"velocity": [0, 0, 0]}}}
        }

        # Tick schedule loop for this projectile
        pack.functions[file.PROJECTILE_TICK_FUNCTION_PATH] = Function(
            [
                f"schedule function {file.PROJECTILE_TICK_FUNCTION_PATH} 1t replace",
                f"execute as @e[type=item_display,tag={projectile_entity_tag}] at @s run function {file.AS_PROJECTILE_ENTITY_TICK_FUNCTION_PATH}",
                f"execute unless entity @e[type=item_display,tag={projectile_entity_tag}] run schedule clear {file.PROJECTILE_TICK_FUNCTION_PATH}",
            ]
        )

        # MAIN PROJECTILE LOGIC
        pack.functions[file.AS_PROJECTILE_ENTITY_TICK_FUNCTION_PATH] = Function(
            [
                *(components.OnTickFunction.get_function_code(definition.on_tick_function) if definition.on_tick_function is not None else []),
                *(PFMovementType.resolve(pack, definition.movement_type) if definition.movement_type is not None else []),
                *(components.DieOnRandomChance.get_function_code(definition.die_on_random_chance) if definition.die_on_random_chance is not None else []),
            ]
        )

        # Summon function
        pack.functions[file.SUMMON_FUNCTION_PATH] = Function(
            [
                f"summon item_display ~ ~ ~ {json.dumps(projectile_entity_data)}",
                f"execute as @e[type=item_display,tag=pf.projectile.new,limit=1] at @s run function {file.AS_PROJECTILE_ENTITY_SUMMON_FUNCTION_PATH}",
                f"schedule function {file.PROJECTILE_TICK_FUNCTION_PATH} 1t replace",
            ]
        )
        
        # As projectile summon function
        pack.functions[file.AS_PROJECTILE_ENTITY_SUMMON_FUNCTION_PATH] = Function(
            [
                "data modify entity @s data.pf.projectile.velocity set from storage pf:projectile in.initial_velocity"
            ]
        )


@configurable("projectfight", validator=PFOptions)
def pf_projectile(ctx: Context, opts: PFOptions):
    ctx.data.extend_namespace += [PFProjectile]

    yield

    for identifier, file in ctx.data[PFProjectile].items():
        PFProjectile.build_file(file, ctx, opts, ctx.data, identifier)

    ctx.data[PFProjectile].clear()
