from beet import Context
from rich.progress import track


def beet_default(ctx: Context):
    THIRD_PARTY = ctx.directory / "third_party"
    
    for pack in track(THIRD_PARTY.iterdir(), description="Loading third-party packs..."):
        if not pack.is_dir():
            continue

        if (pack / "assets").exists():
            ctx.assets.load(pack)
        if (pack / "data").exists():
            ctx.data.load(pack)
