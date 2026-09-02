# trplnr debugging realm

import math
from dataclasses import dataclass


def main():
    for t in range(100):
        print(local_to_world(Vector(0.5,1,0), Vector(
            math.sin(t*3) / 3, 
            math.cos(t*3) / 3,
            t * 0.01
        )))

@dataclass
class Vector:
    x: float = 0
    y: float = 0
    z: float = 0
    
    def __str__(self):
        return f"({self.x}, {self.y}, {self.z})"

def cross(a: Vector, b: Vector) -> Vector:
    return Vector(
        x = (a.y * b.z) - (a.z * b.y),
        y = (a.z * b.x) - (a.x * b.z),
        z = (a.x * b.y) - (a.y * b.x)
    )
    
def length(v: Vector) -> float:
    return math.sqrt(v.x**2 + v.y**2 + v.z**2)

def local_to_world(direction: Vector, position: Vector) -> Vector:
    UP = Vector(0, 1, 0)
    FORWARD = Vector(0, 0, 1)
    
    # z axis
    # w = D / length(D)
    w = Vector(
        x = direction.x / length(direction),
        y = direction.y / length(direction),
        z = direction.z / length(direction)
    )
    
    # x axis
    # u = (UP x w) / length(UP x w)
    # if direction is straight up or down, we change reference axis so no division by 0
    
    reference_axis = UP
    if abs(w.y) >= 0.99:
        reference_axis = FORWARD
        
    u = Vector(
        x = cross(reference_axis, w).x / length(cross(reference_axis, w)),
        y = cross(reference_axis, w).y / length(cross(reference_axis, w)),
        z = cross(reference_axis, w).z / length(cross(reference_axis, w))
    )
    
    # y axis
    # v = w x u
    v = cross(w, u)
    
    # position.x * u
    world_position_x = Vector(
        x = position.x * u.x,
        y = position.x * u.y,
        z = position.x * u.z
    )
    
    # position.y * v
    world_position_y = Vector(
        x = position.y * v.x,
        y = position.y * v.y,
        z = position.y * v.z
    )
    
    # position.z * z
    world_position_z = Vector(
        x = position.z * w.x,
        y = position.z * w.y,
        z = position.z * w.z
    )
    
    # world_position_x + world_position_y + world_position_z
    out = Vector(
        x = world_position_x.x + world_position_y.x + world_position_z.x,
        y = world_position_x.y + world_position_y.y + world_position_z.y,
        z = world_position_x.z + world_position_y.z + world_position_z.z
    )
    
    return out
    
    
if __name__ == "__main__":
    
    main()