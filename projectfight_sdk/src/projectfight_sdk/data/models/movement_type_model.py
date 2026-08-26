from typing import Annotated, Literal

from pydantic import BaseModel, Field, RootModel

from projectfight_sdk.data.models.generic import RelativeOrLocalAxis


class UniformVelocityMovementType(BaseModel):
    type: Literal["pf:uniform_velocity"]
    x: float | RelativeOrLocalAxis = 0
    y: float | RelativeOrLocalAxis = 0
    z: float | RelativeOrLocalAxis = 0

class UniformAccelerationMovementType(BaseModel):
    type: Literal["pf:uniform_acceleration"]
    x: float | RelativeOrLocalAxis = 0
    y: float | RelativeOrLocalAxis = 0
    z: float | RelativeOrLocalAxis = 0
    
type MovementTypes = UniformVelocityMovementType | UniformAccelerationMovementType

class MovementTypeModel(
    RootModel[
        Annotated[
            MovementTypes,
            Field(discriminator="type")
        ]
    ]
):
    pass
    