import json

from beet import DataPack
from pydantic import BaseModel, Field

from projectfight_sdk import entities
from projectfight_sdk.data.models.generic import CoordinateMode, Vector3
from projectfight_sdk.data.projectile import PFProjectile
from projectfight_sdk.util.parsers import vector3_to_decomposed_form


class InitialVelocityModel(BaseModel):
    coordinate_mode: CoordinateMode = "local"
    velocity: Vector3 = (0, 0, 0)

class WeaponComponentModel(BaseModel):
    """Component to turn the item into a weapon which summons a projectile on use."""
    
    spawn_position: Vector3
    """Position to spawn the projectile local to the player's facing direction."""

    initial_velocity: InitialVelocityModel = Field(default_factory=lambda: InitialVelocityModel(coordinate_mode="relative"))
    """Initial velocity of the projectile local to the player's facing direction. Uses local coordinate mode when set as a Vector3."""

    projectile: str
    """Resource location pointing to a ProjectFight projectile."""


def get_function_code(pack: DataPack, weapon: WeaponComponentModel) -> list[str]:
    projectile_file = pack[PFProjectile].get(weapon.projectile)
    if projectile_file is None:
        raise LookupError(f"Projectile '{weapon.projectile}' does not exist.")
    
    spawn_position_string = f"^{weapon.spawn_position[0]} ^{weapon.spawn_position[1]} ^{weapon.spawn_position[2]}"
     
    function_code: list[str]
    
    if weapon.initial_velocity.coordinate_mode == "relative":
        function_code = [
            f"data modify storage pf:projectile in.initial_velocity set value {json.dumps(vector3_to_decomposed_form(weapon.initial_velocity.velocity))}",
            f"execute anchored eyes positioned {spawn_position_string} run function {projectile_file.SUMMON_FUNCTION_PATH}"
        ]
        
    if weapon.initial_velocity.coordinate_mode == "local":
        function_code = [
            f"execute positioned 0.0 0.0 0.0 run tp {entities.PERMA_MARKER} ^ ^ ^1",
            f"data modify storage pf:sdk api.math.vector_local_to_world.in.direction.x set from entity {entities.PERMA_MARKER} Pos[0]",
            f"data modify storage pf:sdk api.math.vector_local_to_world.in.direction.y set from entity {entities.PERMA_MARKER} Pos[1]",
            f"data modify storage pf:sdk api.math.vector_local_to_world.in.direction.z set from entity {entities.PERMA_MARKER} Pos[2]",
            f"data modify storage pf:sdk api.math.vector_local_to_world.in.position set value {json.dumps(vector3_to_decomposed_form(weapon.initial_velocity.velocity))}",
            "function pf:sdk/api/math/vector_local_to_world",
            "data modify storage pf:projectile in.initial_velocity set from storage pf:sdk api.math.vector_local_to_world.out",
            f"execute anchored eyes positioned {spawn_position_string} run function {projectile_file.SUMMON_FUNCTION_PATH}"
        ]
    
    return function_code
