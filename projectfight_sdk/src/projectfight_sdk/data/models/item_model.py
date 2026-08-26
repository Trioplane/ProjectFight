from typing import Any

from pydantic import BaseModel, Field

from projectfight_sdk.data.models.generic import Vector3


class WeaponModel(BaseModel):
    spawn_position: Vector3
    """Position to spawn the projectile local to the player's facing direction."""
    
    initial_velocity: Vector3
    """Initial velocity of the projectile local to the player's facing direction."""
    
    projectile: str
    """Resource location pointing to a ProjectFight projectile."""
    
class UseModel(BaseModel):
    """Properties when using an item."""
    
    duration: float = Field(default=0,ge=0)
    """How long it takes to use the item in seconds."""
    
    animation: str = "block"
    """Using animation."""
    
    sound: str = "minecraft:intentionally_empty"
    """Sound to play while using."""
    
    show_particles: bool = False
    """Whether to show the item particles while using or not."""
    
    can_sprint: bool = True
    """Whether the player is allowed to sprint or not."""
    
    speed_multiplier: float = Field(default=1,ge=0,le=1)
    """Speed to multiply the player's movement speed whilst using the item."""
    
    on_use_effects: list[dict[str, Any]] | None = None
    """See on_consume_effects in https://minecraft.wiki/w/Data_component_format#consumable"""
    
    on_use_function: str | None = None
    """Function to run when the item has been used."""

class ItemModel(BaseModel):
    item_model: str = Field(default="missingno")
    use_properties: UseModel
    weapon: WeaponModel