import logging

from beet import Context, PluginOptions, configurable

from .options import ProjectFightSdkOptions

logger = logging.getLogger("projectfight_sdk")

def beet_default(ctx: Context):
    ctx.require(projectfight_sdk)
    
@configurable(validator=ProjectFightSdkOptions)
def projectfight_sdk(ctx: Context, opts: PluginOptions):
    logger.debug("ae")
    