import json
import logging
from typing import ClassVar

from beet import (
    Context,
    DataPack,
    JsonFileBase,
    NamespaceFileScope,
    configurable,
)

from projectfight_sdk.data.models.projectile_model import ProjectileModel
from projectfight_sdk.options import PFOptions

logger = logging.getLogger("projectfight_sdk")

class PFProjectile(JsonFileBase):
    """Class representing ProjectFight projectiles."""
    
    scope: ClassVar[NamespaceFileScope] = ("pf_projectile",)
    extension: ClassVar[str] = ".json"
    model = ProjectileModel
    
    @staticmethod
    def build_file(
        file: PFProjectile, 
        ctx: Context, 
        opts: PFOptions, 
        pack: DataPack, 
        identifier: str
    ):
        logger.debug("Building %s %s", file.__class__.__name__, identifier)
        logger.debug(json.dumps(json.loads(file.data.model_dump_json()), indent=2))
        
@configurable("projectfight", validator=PFOptions)
def pf_projectile(ctx: Context, opts: PFOptions):
    ctx.data.extend_namespace += [PFProjectile]
    
    yield
    
    for identifier, file in ctx.data[PFProjectile].items():
        PFProjectile.build_file(
            file,
            ctx,
            opts,
            ctx.data,
            identifier
        )
        
    ctx.data[PFProjectile].clear()
    