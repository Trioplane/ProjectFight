from typing import Literal

from pydantic import BaseModel


class RelativeOrLocalAxis(BaseModel):
    value: float
    type: Literal["relative", "local"]

type Vector3 = tuple[float, float, float]