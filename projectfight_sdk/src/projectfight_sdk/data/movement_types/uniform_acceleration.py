from typing import Literal

from pydantic import BaseModel

from projectfight_sdk.data.models.generic import CoordinateMode
from projectfight_sdk.util.parsers import parse_coordinate_mode


class UniformAccelerationMovementType(BaseModel):
    type: Literal["pf:uniform_acceleration"]
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
    return [f"tp @s {parse_coordinate_mode(coordinate_mode)}{x} {parse_coordinate_mode(coordinate_mode)}{y} {parse_coordinate_mode(coordinate_mode)}{z}"]