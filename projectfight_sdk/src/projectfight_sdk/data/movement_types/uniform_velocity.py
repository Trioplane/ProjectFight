"""Moves with a constant velocity. Initial velocity will have no effect on this movement type."""

from typing import Literal

from pydantic import BaseModel

from projectfight_sdk.data.models.generic import CoordinateMode
from projectfight_sdk.util.parsers import parse_coordinate_mode


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
    return [(
        f"tp @s " 
        f"{parse_coordinate_mode(coordinate_mode)}{x} "
        f"{parse_coordinate_mode(coordinate_mode)}{y} "
        f"{parse_coordinate_mode(coordinate_mode)}{z}"
    )]