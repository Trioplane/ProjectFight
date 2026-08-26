from pydantic import BaseModel, Field

from projectfight_sdk.data.models.movement_type_model import MovementTypeModel


class ProjectileModel(BaseModel):
    item_model: str = Field(default="missingno")
    movement_type: str | MovementTypeModel