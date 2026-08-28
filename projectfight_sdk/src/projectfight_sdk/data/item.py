import json
import logging
from typing import ClassVar

from beet import (
    Advancement,
    Context,
    DataPack,
    Function,
    JsonFileBase,
    LootTable,
    NamespaceFileScope,
    configurable,
)

from projectfight_sdk.data import components
from projectfight_sdk.data.models.item_model import ItemModel
from projectfight_sdk.options import PFOptions
from projectfight_sdk.util.parsers import parse_identifier

logger = logging.getLogger("projectfight_sdk")

DUMMY_ITEM = "minecraft:popped_chorus_fruit"


class PFItem(JsonFileBase):
    """Class representing ProjectFight items."""

    scope: ClassVar[NamespaceFileScope] = ("pf_item",)
    extension: ClassVar[str] = ".json"
    model = ItemModel
    
    def bind(self, pack, path):
        super().bind(pack, path)
        
        namespace, path = parse_identifier(path)
        
        self.ADVANCEMENT_PATH       = f"{namespace}:used_pf_item/{path}"
        self.LOOT_TABLE_PATH        = f"{namespace}:pf_item/{path}"
        self.ON_USE_FUNCTION_PATH   = f"{namespace}:pf_item/{path}/on_use"
        self.REGISTRY_FUNCTION_PATH = f"{namespace}:pf_item/register"

    @staticmethod
    def build_file(
        file: PFItem, ctx: Context, opts: PFOptions, pack: DataPack, identifier: str
    ):
        logger.debug("Building %s %s", file.__class__.__name__, identifier)

        namespace, path = parse_identifier(identifier)
        definition: ItemModel = file.data

        # Register item into the PF item registry
        pack.functions.setdefault(file.REGISTRY_FUNCTION_PATH)
        pack.functions[file.REGISTRY_FUNCTION_PATH].append(
            Function(
                [
                    f'data modify storage pf:registry root.item append value "{identifier}"'
                ]
            )
        )
        pack.function_tags["pf:registry/item"].add(file.REGISTRY_FUNCTION_PATH)

        # on consume advancement
        pack.advancements[file.ADVANCEMENT_PATH] = Advancement(
            {
                "criteria": {
                    "used_item": {
                        "trigger": "minecraft:consume_item",
                        "conditions": {
                            "item": {
                                "items": DUMMY_ITEM,
                                "predicates": {
                                    "minecraft:custom_data": {
                                        "pf": {"item": identifier}
                                    }
                                },
                            }
                        },
                    }
                },
                "rewards": {"function": file.ON_USE_FUNCTION_PATH},
            }
        )

        # loot table giver
        pack.loot_tables[file.LOOT_TABLE_PATH] = LootTable(
            {
                "pools": [
                    {
                        "rolls": 1,
                        "entries": [
                            {
                                "type": "minecraft:item",
                                "name": DUMMY_ITEM,
                                "functions": [
                                    {
                                        "function": "minecraft:set_components",
                                        "components": {
                                            "item_name": {"translate": f"pf:item.{parse_identifier(identifier, as_string=True)}"},
                                            **(components.ItemName.get_item_components(definition.item_name) if definition.item_name is not None else {}),
                                            "custom_data": {"pf": {"item": identifier}},
                                            "item_model": definition.item_model,
                                            **(components.Useable.get_item_components(definition.useable) if definition.useable is not None else {})
                                        },
                                    }
                                ],
                            }
                        ],
                    }
                ]
            }
        )

        # on use function
        pack.functions[file.ON_USE_FUNCTION_PATH] = Function(
            [
                f"advancement revoke @s only {file.ADVANCEMENT_PATH}",
                f"tellraw @a {json.dumps({'text': f'Used item: {identifier}'})}",
                *(components.Weapon.get_function_code(pack, definition.weapon) if definition.weapon is not None else {}),
                *(components.Useable.get_function_code(definition.useable) if definition.useable is not None else {})
            ]
        )


@configurable("projectfight", validator=PFOptions)
def pf_item(ctx: Context, opts: PFOptions):
    ctx.data.extend_namespace += [PFItem]

    yield

    for identifier, file in ctx.data[PFItem].items():
        PFItem.build_file(file, ctx, opts, ctx.data, identifier)

    ctx.data[PFItem].clear()
