from typing import Any

from pydantic import BaseModel, Field


class UseableComponentModel(BaseModel):
    """Properties when using an item."""

    duration: float = Field(default=0, ge=0)
    """How long it takes to use the item in seconds."""

    animation: str = "block"
    """Using animation."""

    sound: str = "minecraft:intentionally_empty"
    """Sound to play while using."""

    show_particles: bool = False
    """Whether to show the item particles while using or not."""

    can_sprint: bool = True
    """Whether the player is allowed to sprint or not."""

    speed_multiplier: float = Field(default=1, ge=0, le=1)
    """Speed to multiply the player's movement speed whilst using the item."""

    on_use_effects: list[dict[str, Any]] | None = None
    """See on_consume_effects in https://minecraft.wiki/w/Data_component_format#consumable"""

    on_use_function: str | None = None
    """Function to run when the item has been used."""


def get_function_code(useable: UseableComponentModel) -> list[str]:
    return [
        *([f"function {useable.on_use_function}"] if useable.on_use_function else [])
    ]

def get_item_components(useable: UseableComponentModel) -> dict[str, Any]:
    return {
        "consumable": {
            "consume_seconds": useable.duration,
            "animation": useable.animation,
            "sound": useable.sound,
            "has_consume_particles": useable.show_particles,
            "on_consume_effects": useable.on_use_effects,
        },
        "use_effects": {
            "can_sprint": useable.can_sprint,
            "speed_multiplier": useable.speed_multiplier,
        }
    }