from typing import Annotated
from pydantic import BaseModel, Field

from projectfight_sdk.data.components.die_on_random_chance import (
    DieOnRandomChanceComponentModel,
)
from projectfight_sdk.data.components.on_tick_function import (
    OnTickFunctionComponentModel,
)
from projectfight_sdk.data.models.movement_type_model import MovementTypeModel

class ProjectileModel(BaseModel):
    item_model: str = Field(default="missingno", description="Lorem ipsum dolor smithie sit amet.")
    movement_type: str | MovementTypeModel | list[str | MovementTypeModel] | None = None
    on_tick_function: OnTickFunctionComponentModel | None = None
    die_on_random_chance: DieOnRandomChanceComponentModel | None = None