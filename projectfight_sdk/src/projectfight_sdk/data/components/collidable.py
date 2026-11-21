from pydantic import BaseModel

from projectfight_sdk import tags


class HitsBlocksModel(BaseModel):
  passable_blocks: str = "#minecraft:air"
  """A block tag."""
  
class HitsPlayersModel(BaseModel):
  distance: float

class CollidableComponentModel(BaseModel):
  hits_blocks: HitsBlocksModel | None = None
  hits_players: HitsPlayersModel | None = None

def get_function_code(collidable: CollidableComponentModel, on_collide_function: str) -> list[str]:
  function_code: list[str] = ["# CollidableComponent"]
  
  if (collidable.hits_blocks is not None):
    function_code += [
      f'execute unless block ~ ~ ~ {collidable.hits_blocks.passable_blocks} run return run function {on_collide_function}'
    ]
    
  if (collidable.hits_players is not None):
    function_code += [
      f'execute if entity @a[tag={tags.PLAYER_IMMUNE}, distance={collidable.hits_players.distance}] run return run function {on_collide_function}'
    ]
  
  return function_code