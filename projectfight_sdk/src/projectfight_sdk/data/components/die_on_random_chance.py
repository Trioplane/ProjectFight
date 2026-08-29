from pydantic import BaseModel, Field


class DieOnRandomChanceComponentModel(BaseModel):
    chance: float = Field(ge=0,le=1)

def get_function_code(die_on_random_chance: DieOnRandomChanceComponentModel) -> list[str]:
    return [
        f'execute if predicate {{type: "random_chance", chance: {die_on_random_chance.chance}}} run kill @s'
    ]