from pydantic import BaseModel

from projectfight_sdk.data.models.generic import Vector3


class WeaponComponentModel(BaseModel):
    """Component to turn the item into a weapon which summons a projectile on use."""
    
    spawn_position: Vector3
    """Position to spawn the projectile local to the player's facing direction."""

    initial_velocity: Vector3
    """Initial velocity of the projectile local to the player's facing direction."""

    projectile: str
    """Resource location pointing to a ProjectFight projectile."""


def get_function_code(weapon: WeaponComponentModel) -> list[str]:
    raise NotImplementedError("Weapon component code-gen is not implemented yet.")
