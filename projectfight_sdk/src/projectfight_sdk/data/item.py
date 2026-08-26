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

from projectfight_sdk.data.models.item_model import ItemModel
from projectfight_sdk.options import PFOptions
from projectfight_sdk.util.parsers import parse_identifier

logger = logging.getLogger("projectfight_sdk")

DUMMY_ITEM = "minecraft:poisonous_potato"

class PFItem(JsonFileBase):
    """Class representing ProjectFight items."""
    
    scope: ClassVar[NamespaceFileScope] = ("pf_item",)
    extension: ClassVar[str] = ".json"
    model = ItemModel
    
    @staticmethod
    def build_file(
        file: PFItem, 
        ctx: Context, 
        opts: PFOptions, 
        pack: DataPack, 
        identifier: str
    ):
        logger.debug("Building %s %s", file.__class__.__name__, identifier)
        
        namespace, path = parse_identifier(identifier)
        definition: ItemModel = file.data
        
        ADVANCEMENT_PATH = f"{namespace}:used_pf_item/{path}"
        LOOT_TABLE_PATH = f"{namespace}:pf_item/{path}"
        ON_USE_FUNCTION_PATH = f"{namespace}:pf_item/{path}/on_use"
        REGISTRY_FUNCTION_PATH = f"{namespace}:pf_item/register"
        
        # Register item into the PF item registry
        pack.functions.setdefault(REGISTRY_FUNCTION_PATH)
        pack.functions[REGISTRY_FUNCTION_PATH].append(Function([
          f"data modify storage pf:registry root.item append value {json.dumps([identifier])}"
        ]))
        pack.function_tags["pf:registry/item"].add(REGISTRY_FUNCTION_PATH)
        
        # on consume advancement
        pack.advancements[ADVANCEMENT_PATH] = Advancement({
          "criteria": {
            "used_item": {
              "trigger": "minecraft:consume_item",
              "conditions": {
                "item": {
                  "items": DUMMY_ITEM,
                  "predicates": {
                    "minecraft:custom_data": {"pf": {
                        "item": identifier
                    }}
                  }
                }
              }
            }
          }
        })
        
        # loot table giver
        pack.loot_tables[LOOT_TABLE_PATH] = LootTable({
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
                        "consumable": {
                            "consume_seconds": definition.use_properties.duration,
                            "animation": definition.use_properties.animation,
                            "sound": definition.use_properties.sound,
                            "has_consume_particles": definition.use_properties.show_particles,
                            "on_consume_effects": definition.use_properties.on_use_effects
                        },
                        "use_effects": {
                            "can_sprint": definition.use_properties.can_sprint,
                            "speed_multiplier": definition.use_properties.speed_multiplier,    
                        },
                        "custom_data": {"pf": {
                            "item": identifier
                        }},
                        "item_model": definition.item_model,
                        "!food": {}
                      }
                    }
                  ]
                }
              ]
            }
          ]
        })
        
        # on use function
        pack.functions[ON_USE_FUNCTION_PATH] = Function([
            f"advancement revoke @s only {ADVANCEMENT_PATH}",
            f"tellraw @a {json.dumps({"text": f"Used item: {identifier}"})}",
            f"function {definition.use_properties.on_use_function}" if definition.use_properties.on_use_function is not None else ""
        ])
        
@configurable("projectfight", validator=PFOptions)
def pf_item(ctx: Context, opts: PFOptions):
    ctx.data.extend_namespace += [PFItem]
    
    yield
    
    for identifier, file in ctx.data[PFItem].items():
        PFItem.build_file(
            file,
            ctx,
            opts,
            ctx.data,
            identifier
        )
        
    ctx.data[PFItem].clear()
    