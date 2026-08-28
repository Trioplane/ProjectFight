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

from projectfight_sdk.data.components import (
    die_on_random_chance_component,
    on_tick_function_component,
)
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

        # Paths
        DIR_PATH = f"{namespace}:pf_projectile/{path}"
        SUMMON_FUNCTION_PATH = f"{DIR_PATH}/summon"
        PROJECTILE_TICK_FUNCTION_PATH = f"{DIR_PATH}/projectile_tick"
        AS_PROJECTILE_ENTITY_TICK_FUNCTION_PATH = (
            f"{DIR_PATH}/projectile_tick/as_projectile"
        )
        REGISTRY_FUNCTION_PATH = f"{namespace}:pf_projectile/register"

        # Register projectile into the PF projectile registry
        pack.functions.setdefault(REGISTRY_FUNCTION_PATH)
        pack.functions[REGISTRY_FUNCTION_PATH].append(
            Function(
                [
                    f'data modify storage pf:registry root.projectile append value "{identifier}"'
                ]
            )
        )
        pack.function_tags["pf:registry/projectile"].add(REGISTRY_FUNCTION_PATH)

        # entity definition
        projectile_entity_tag = f"{namespace}.projectile.{path_to_dot_notation(path)}"
        projectile_entity_data = {
            "item": {"id": "egg", "components": {"item_model": definition.item_model}},
            "Tags": ["pf.projectile", projectile_entity_tag],
        }

        # Tick schedule loop for this projectile
        pack.functions[PROJECTILE_TICK_FUNCTION_PATH] = Function(
            [
                f"schedule function {PROJECTILE_TICK_FUNCTION_PATH} 1t replace",
                f"execute as @e[type=item_display,tag={projectile_entity_tag}] at @s run function {AS_PROJECTILE_ENTITY_TICK_FUNCTION_PATH}",
                f"execute unless entity @e[type=item_display,tag={projectile_entity_tag}] run schedule clear {PROJECTILE_TICK_FUNCTION_PATH}",
            ]
        )

        # MAIN PROJECTILE LOGIC
        pack.functions[AS_PROJECTILE_ENTITY_TICK_FUNCTION_PATH] = Function(
            [
                *(PFMovementType.resolve(pack, definition.movement_type) if definition.movement_type is not None else []),
                *(on_tick_function_component.get_function_code(definition.on_tick_function) if definition.on_tick_function is not None else []),
                *(die_on_random_chance_component.get_function_code(definition.die_on_random_chance) if definition.die_on_random_chance is not None else []),
            ]
        )

        # Summon function
        pack.functions[SUMMON_FUNCTION_PATH] = Function(
            [
                f"summon item_display ~ ~ ~ {json.dumps(projectile_entity_data)}",
                f"schedule function {PROJECTILE_TICK_FUNCTION_PATH} 1t replace",
            ]
        )


@configurable("projectfight", validator=PFOptions)
def pf_projectile(ctx: Context, opts: PFOptions):
    ctx.data.extend_namespace += [PFProjectile]

    yield

    for identifier, file in ctx.data[PFProjectile].items():
        PFProjectile.build_file(file, ctx, opts, ctx.data, identifier)

    ctx.data[PFProjectile].clear()
