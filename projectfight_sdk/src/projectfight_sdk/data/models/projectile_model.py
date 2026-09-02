from pydantic import BaseModel, Field

from projectfight_sdk.data.components.die_on_random_chance import (
    DieOnRandomChanceComponentModel,
)
from projectfight_sdk.data.components.on_tick_function import (
    OnTickFunctionComponentModel,
)
from projectfight_sdk.data.models.generic import OneOrMultipleInlineOrReference
from projectfight_sdk.data.models.movement_type_model import MovementTypeModel


class ProjectileModel(BaseModel):
    item_model: str = Field(default="missingno")
    movement_type: OneOrMultipleInlineOrReference[MovementTypeModel] | None = None
    on_tick_function: OnTickFunctionComponentModel | None = None
    die_on_random_chance: DieOnRandomChanceComponentModel | None = None