"""Moves with constant acceleration."""
from typing import Literal

from pydantic import BaseModel

from projectfight_sdk.data.models.generic import CoordinateMode
from projectfight_sdk.util.number_providers import NumberProvider


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
    """x/y/z represents acceleration."""
    
    function_code: list[str] = []
    
    if coordinate_mode == "relative":
        compute_x = f"data modify storage pf:projectile temp.velocity.x set compute default float {NumberProvider.add(NumberProvider.storage("pf:projectile","temp.velocity.x"), x)}"
        compute_y = f"data modify storage pf:projectile temp.velocity.y set compute default float {NumberProvider.add(NumberProvider.storage("pf:projectile","temp.velocity.y"), y)}"
        compute_z = f"data modify storage pf:projectile temp.velocity.z set compute default float {NumberProvider.add(NumberProvider.storage("pf:projectile","temp.velocity.z"), z)}"
        
        function_code += [
            "data modify storage pf:projectile temp.velocity set from entity @s data.pf.projectile.velocity",
            compute_x if x != 0 else "",
            compute_y if y != 0 else "",
            compute_z if z != 0 else "",
            "data modify entity @s data.pf.projectile.velocity set from storage pf:projectile temp.velocity"
        ]
    elif coordinate_mode == "local":
        compute_x = f"data modify storage pf:projectile temp.velocity.x set compute default float {NumberProvider.add(NumberProvider.storage("pf:projectile","temp.velocity.x"), NumberProvider.storage("pf:sdk", "api.math.vector_local_to_world.out.x"))}"
        compute_y = f"data modify storage pf:projectile temp.velocity.y set compute default float {NumberProvider.add(NumberProvider.storage("pf:projectile","temp.velocity.y"), NumberProvider.storage("pf:sdk", "api.math.vector_local_to_world.out.y"))}"
        compute_z = f"data modify storage pf:projectile temp.velocity.z set compute default float {NumberProvider.add(NumberProvider.storage("pf:projectile","temp.velocity.z"), NumberProvider.storage("pf:sdk", "api.math.vector_local_to_world.out.z"))}"
        
        function_code += [
            "data modify storage pf:projectile temp.velocity set from entity @s data.pf.projectile.velocity",
            "data modify storage pf:sdk api.math.vector_local_to_world.in.direction set from entity @s data.pf.projectile.direction",
            f"data modify storage pf:sdk api.math.vector_local_to_world.in.position set value {{x: {x}, y: {y}, z: {z}}}",
            "function pf:sdk/api/math/vector_local_to_world",
            compute_x if x != 0 else "",
            compute_y if y != 0 else "",
            compute_z if z != 0 else "",
            "data modify entity @s data.pf.projectile.velocity set from storage pf:projectile temp.velocity"
        ]
    
    return function_code