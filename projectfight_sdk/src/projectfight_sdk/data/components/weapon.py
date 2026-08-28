import json

from beet import DataPack
from pydantic import BaseModel

from projectfight_sdk.data.models.generic import Vector3
from projectfight_sdk.data.projectile import PFProjectile


class WeaponComponentModel(BaseModel):
    """Component to turn the item into a weapon which summons a projectile on use."""
    
    spawn_position: Vector3
    """Position to spawn the projectile local to the player's facing direction."""

    initial_velocity: Vector3
    """Initial velocity of the projectile local to the player's facing direction."""

    projectile: str
    """Resource location pointing to a ProjectFight projectile."""


def get_function_code(pack: DataPack, weapon: WeaponComponentModel) -> list[str]:
    projectile_file = pack[PFProjectile].get(weapon.projectile)
    if projectile_file is None:
        raise LookupError(f"Projectile '{weapon.projectile}' does not exist.")
    
    spawn_position_string = f"^{weapon.spawn_position[0]} ^{weapon.spawn_position[1]} ^{weapon.spawn_position[2]}"
     
    return [
        f"data modify storage pf:projectile in.initial_velocity set value {json.dumps(weapon.initial_velocity)}",
        f"execute positioned {spawn_position_string} run function {projectile_file.SUMMON_FUNCTION_PATH}"
    ]
