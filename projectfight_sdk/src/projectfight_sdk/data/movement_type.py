import logging
from typing import ClassVar

from beet import (
    Context,
    DataPack,
    JsonFileBase,
    NamespaceFileScope,
    configurable,
)

from projectfight_sdk.data.models.generic import (
    InlineOrReference,
    OneOrMultipleInlineOrReference,
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
    def resolve(pack: DataPack, reference: OneOrMultipleInlineOrReference[MovementTypeModel]) -> list[str]:
        references = [*(reference if isinstance(reference, list) else [reference])]
            
        function_code = []
        
        for _reference in references:
            movement_type = PFMovementType.__get_movement_type_definition(pack, _reference)
            function_code += PFMovementType.__function_code(pack=pack, definition=movement_type)

        return function_code
    
    @staticmethod
    def __get_movement_type_definition(pack: DataPack, reference: InlineOrReference[MovementTypeModel]) -> MovementTypes:
        if isinstance(reference, str):
            movement_type_file = pack[PFMovementType].get(reference)
            if movement_type_file is None:
                raise LookupError(f"Movement type file '{reference}' does not exist.")

            return movement_type_file.data.root
        elif isinstance(reference, MovementTypeModel):
            return reference.root

    @staticmethod
    def __function_code(pack, definition: MovementTypes) -> list[str]:
        function_code: list[str] = [f"# {definition.type}"]
        
        match definition.type:
            case "pf:uniform_velocity":
                function_code += uniform_velocity.get_function_code(
                    coordinate_mode=definition.coordinate_mode, 
                    x=definition.x, 
                    y=definition.y, 
                    z=definition.z
                )
                function_code += ["function pf:sdk/api/projectile/apply_velocity"]
            case "pf:uniform_acceleration":
                function_code += uniform_acceleration.get_function_code(
                    coordinate_mode=definition.coordinate_mode, 
                    x=definition.x, 
                    y=definition.y, 
                    z=definition.z
                )
                function_code += ["function pf:sdk/api/projectile/apply_velocity"]
            case _:
                raise TypeError(
                    f"{definition.type} movement type function is not recognized as a valid movement type. This should not have ran due to Pydantic handling validation. Are you doing cursed stuff?"
                )
                
        return function_code

@configurable("projectfight", validator=PFOptions)
def pf_movement_type(ctx: Context, opts: PFOptions):
    ctx.data.extend_namespace += [PFMovementType]

    yield

    ctx.data[PFMovementType].clear()
