from typing import Any

from beet.core.utils import TextComponent

type ItemNameComponentModel = TextComponent

def get_item_components(item_name: ItemNameComponentModel) -> dict[str, Any]:
    return {
        "item_name": item_name
    }