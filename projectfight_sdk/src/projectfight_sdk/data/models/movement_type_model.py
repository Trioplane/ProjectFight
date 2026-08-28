from typing import Annotated

from pydantic import Field, RootModel

from projectfight_sdk.data.movement_types.uniform_acceleration import (
    UniformAccelerationMovementType,
)
from projectfight_sdk.data.movement_types.uniform_velocity import (
    UniformVelocityMovementType,
)

type MovementTypes = UniformVelocityMovementType | UniformAccelerationMovementType


class MovementTypeModel(
    RootModel[Annotated[MovementTypes, Field(discriminator="type")]]
):
    pass
