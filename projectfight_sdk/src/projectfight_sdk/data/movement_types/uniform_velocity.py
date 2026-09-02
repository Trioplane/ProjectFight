"""Moves with a constant velocity. Initial velocity will have no effect on this movement type."""

from typing import Literal

from pydantic import BaseModel

from projectfight_sdk.data.models.generic import CoordinateMode


class UniformVelocityMovementType(BaseModel):
    type: Literal["pf:uniform_velocity"]
    coordinate_mode: Literal["relative", "local"]
    x: float = 0
    y: float = 0
    z: float = 0


def get_function_code(
    coordinate_mode: CoordinateMode,
    x: float,
    y: float,
    z: float,
) -> list[str]:
    # TODO: make this use shootfacing too
    function_code: list[str] = []
    
    if coordinate_mode == "relative":
        function_code += [f"data modify entity @s data.pf.projectile.velocity set value {{x: {x}, y: {y}, z: {z}}}"]
    elif coordinate_mode == "local":
        function_code += [
            "data modify storage pf:sdk api.math.vector_local_to_world.in.direction set from entity @s data.pf.projectile.direction",
            f"data modify storage pf:sdk api.math.vector_local_to_world.in.position set value {{x: {x}, y: {y}, z: {z}}}",
            "function pf:sdk/api/math/vector_local_to_world",
            "data modify entity @s data.pf.projectile.velocity set from storage pf:sdk api.math.vector_local_to_world.out"
        ]
    
    return function_code