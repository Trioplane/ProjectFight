from pydantic import BaseModel, Field

from projectfight_sdk.data.components.useable_component import UseableComponentModel
from projectfight_sdk.data.components.weapon_component import WeaponComponentModel


class ItemModel(BaseModel):
    item_name: str | None = None
    item_model: str = Field(default="missingno")
    useable: UseableComponentModel | None = None
    weapon: WeaponComponentModel | None = None
