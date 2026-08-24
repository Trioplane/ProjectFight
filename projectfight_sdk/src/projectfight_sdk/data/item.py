import logging
from typing import ClassVar

from beet import (
    Context,
    DataPack,
    JsonFileBase,
    NamespaceFileScope,
    configurable,
)

from projectfight_sdk.options import PFOptions

logger = logging.getLogger("projectfight_sdk")

class PFItem(JsonFileBase):
    """Class representing ProjectFight items."""
    
    scope: ClassVar[NamespaceFileScope] = ("pf_item",)
    extension: ClassVar[str] = ".json"
    
    @staticmethod
    def build_file(
        file: PFItem, 
        ctx: Context, 
        opts: PFOptions, 
        pack: DataPack, 
        identifier: str
    ):
        logger.debug("Building %s %s", file.__class__.__name__, identifier)
        
@configurable("projectfight", validator=PFOptions)
def pf_item(ctx: Context, opts: PFOptions):
    ctx.data.extend_namespace += [PFItem]
    
    yield
    
    for identifier, file in ctx.data[PFItem].items():
        PFItem.build_file(
            file,
            ctx,
            opts,
            ctx.data,
            identifier
        )
        
    ctx.data[PFItem].clear()
    