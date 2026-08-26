import logging
from typing import ClassVar

from beet import (
    Context,
    DataPack,
    JsonFileBase,
    NamespaceFileScope,
    configurable,
)

from projectfight_sdk.data.models.movement_type_model import MovementTypeModel
from projectfight_sdk.options import PFOptions

logger = logging.getLogger("projectfight_sdk")

class PFMovementType(JsonFileBase):
    """Class representing ProjectFight movement types."""
    
    scope: ClassVar[NamespaceFileScope] = ("pf_movement_type",)
    extension: ClassVar[str] = ".json"
    model = MovementTypeModel
    
    @staticmethod
    def build_file(
        file: PFMovementType, 
        ctx: Context, 
        opts: PFOptions, 
        pack: DataPack, 
        identifier: str
    ):
        logger.debug("Building %s %s", file.__class__.__name__, identifier)
        
@configurable("projectfight", validator=PFOptions)
def pf_movement_type(ctx: Context, opts: PFOptions):
    ctx.data.extend_namespace += [PFMovementType]
    
    yield
    
    for identifier, file in ctx.data[PFMovementType].items():
        PFMovementType.build_file(
            file,
            ctx,
            opts,
            ctx.data,
            identifier
        )
        
    ctx.data[PFMovementType].clear()
    