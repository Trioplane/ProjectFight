from typing import ClassVar

from beet import Context, JsonFile, NamespaceFileScope, TagFile


class UnjankItemSource(JsonFile):
    """Class representing an item source file"""

    scope: ClassVar[NamespaceFileScope] = ("unjank", "item_source")
    extension: ClassVar[str] = ".json"


class UnjankCreativeTab(JsonFile):
    """Class representing a creative tab file"""

    scope: ClassVar[NamespaceFileScope] = ("unjank", "creative_tab")
    extension: ClassVar[str] = ".json"


class UnjankItemSourceTag(TagFile):
    """Class Representing an item source tag"""

    scope: ClassVar[NamespaceFileScope] = ("tags", "unjank", "item_source")

def unjank(ctx: Context):
    ctx.data.extend_namespace.append(UnjankItemSource)
    ctx.data.extend_namespace.append(UnjankCreativeTab)
    ctx.data.extend_namespace.append(UnjankItemSourceTag)