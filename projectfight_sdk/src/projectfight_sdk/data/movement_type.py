import logging
from typing import ClassVar

from beet import (
    Context,
    DataPack,
    JsonFileBase,
    NamespaceFileScope,
    configurable,
)

from projectfight_sdk.data.models.movement_type_model import (
    MovementTypeModel,
    MovementTypes,
)
from projectfight_sdk.options import PFOptions

from .movement_types import (
    uniform_acceleration,
    uniform_velocity,
)

logger = logging.getLogger("projectfight_sdk")


class PFMovementType(JsonFileBase):
    """Class representing ProjectFight movement types."""

    scope: ClassVar[NamespaceFileScope] = ("pf_movement_type",)
    extension: ClassVar[str] = ".json"
    model = MovementTypeModel

    @staticmethod
    def resolve(pack: DataPack, reference: str | MovementTypeModel) -> list[str]:
        movement_type: MovementTypes

        if isinstance(reference, str):
            movement_type_file = pack[PFMovementType].get(reference)
            if movement_type_file is None:
                raise LookupError(f"Movement type file '{reference}' does not exist.")

            movement_type = movement_type_file.data.root
        elif isinstance(reference, MovementTypeModel):
            movement_type = reference.root

        return PFMovementType.__function_code(pack=pack, definition=movement_type)

    @staticmethod
    def __function_code(pack, definition: MovementTypes) -> list[str]:
        match definition.type:
            case "pf:uniform_velocity":
                return uniform_velocity.get_function_code(
                    coordinate_mode=definition.coordinate_mode, 
                    x=definition.x, 
                    y=definition.y, 
                    z=definition.z
                )
            case "pf:uniform_acceleration":
                return uniform_acceleration.get_function_code(
                    coordinate_mode=definition.coordinate_mode, 
                    x=definition.x, 
                    y=definition.y, 
                    z=definition.z
                )
            case _:
                raise TypeError(
                    f"{definition.type} movement type function is not recognized as a valid movement type. This should not have ran due to Pydantic handling validation. Are you doing cursed stuff?"
                )

@configurable("projectfight", validator=PFOptions)
def pf_movement_type(ctx: Context, opts: PFOptions):
    ctx.data.extend_namespace += [PFMovementType]

    yield

    ctx.data[PFMovementType].clear()
