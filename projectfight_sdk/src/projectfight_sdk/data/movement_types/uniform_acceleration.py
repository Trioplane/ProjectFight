"""Moves with constant acceleration."""
from typing import Literal

from beet import DataPack, Function
from pydantic import BaseModel

from projectfight_sdk.data.models.generic import CoordinateMode
from projectfight_sdk.util.number_providers import NumberProvider


class UniformAccelerationMovementType(BaseModel):
    type: Literal["pf:uniform_acceleration"]
    coordinate_mode: Literal["relative", "local"]
    x: float = 0
    y: float = 0
    z: float = 0

RELATIVE_TP_FUNCTION_PATH = "pf_sdk:api/movement_type/uniform_acceleration/relative_tp"
LOCAL_TP_FUNCTION_PATH = "pf_sdk:api/movement_type/uniform_acceleration/local_tp"
TP_FUNCTION_PATH = "pf_sdk:api/movement_type/uniform_acceleration/tp_here"

def get_function_code(
    coordinate_mode: CoordinateMode,
    x: float,
    y: float,
    z: float,
) -> list[str]:
    velocity_x = {"type": "minecraft:storage","storage": "pf:projectile","path": "temp.velocity.x"}
    velocity_y = {"type": "minecraft:storage","storage": "pf:projectile","path": "temp.velocity.y"}
    velocity_z = {"type": "minecraft:storage","storage": "pf:projectile","path": "temp.velocity.z"}
    
    x_string = f"data modify storage pf:projectile temp.velocity.x set compute default {NumberProvider.sum(velocity_x, x)}"
    y_string = f"data modify storage pf:projectile temp.velocity.y set compute default {NumberProvider.sum(velocity_y, y)}"
    z_string = f"data modify storage pf:projectile temp.velocity.z set compute default {NumberProvider.sum(velocity_z, z)}"
    
    tp_string: str
    
    if coordinate_mode == "relative":
        tp_string = f"function {LOCAL_TP_FUNCTION_PATH} with storage pf:projectile temp.velocity"
    elif coordinate_mode == "local":
        tp_string = f"function {RELATIVE_TP_FUNCTION_PATH} with storage pf:projectile temp.velocity"
    else:
        raise ValueError(f"Unknown '{coordinate_mode}' coordinate mode. Pydantic should've caught this first though. So like, are you doing anything suspicious?")
    
    return [
        "data modify storage pf:projectile temp.velocity set from entity @s data.pf.projectile.velocity",
        *([x_string] if x != 0 else []), # velocity.x += acceleration.x
        *([y_string] if y != 0 else []), # velocity.y += acceleration.y
        *([z_string] if z != 0 else []), # velocity.z += acceleration.z
        "data modify entity @s data.pf.projectile.velocity set from storage pf:projectile temp.velocity",
        tp_string,
    ]
    
def generate_sdk_functions(pack: DataPack):
    # TODO: put this inside main datapack
    pack.functions[RELATIVE_TP_FUNCTION_PATH] = Function([
        f"$execute rotated ~ 0 positioned ~$(x) ~$(y) ~$(z) run function {TP_FUNCTION_PATH}"
    ])

    
    pack.functions[LOCAL_TP_FUNCTION_PATH] = Function([
        f"$execute rotated ~ 0 positioned ^$(x) ^$(y) ^$(z) run function {TP_FUNCTION_PATH}"
    ])
    
    pack.functions[TP_FUNCTION_PATH] = Function([
        "tp @s ~ ~ ~"
    ])