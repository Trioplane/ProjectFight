import logging

from beet import Context, PluginOptions, configurable

from projectfight_sdk import data
from projectfight_sdk.options import PFOptions

logger = logging.getLogger("projectfight_sdk")

def beet_default(ctx: Context):
    ctx.require(projectfight_sdk)
    
@configurable("projectfight", validator=PFOptions)
def projectfight_sdk(ctx: Context, opts: PluginOptions):
    ctx.require(data.pf_item)
    ctx.require(data.pf_movement_type)
    ctx.require(data.pf_projectile)