from projectfight_sdk.data.models.generic import (
    CoordinateMode,
    DecomposedVector3,
    Vector3,
)


def parse_coordinate_mode(mode: CoordinateMode) -> str:
    if mode == "relative":
        return "~"
    elif mode == "local":
        return "^"

def parse_identifier(identifier: str, as_string: bool = False) -> tuple[str, str] | str:
    left_part, colon, right_part = identifier.partition(":")
    decomposed_form: tuple[str, str]
    if colon == ":":
        decomposed_form = (left_part, right_part)
    else:
        decomposed_form = ("minecraft", left_part)
        
    if as_string:
        return f"{decomposed_form[0]}:{decomposed_form[1]}"
    
    return decomposed_form

def vector3_to_decomposed_form(vector3: Vector3) -> DecomposedVector3:
    return {"x": vector3[0], "y": vector3[1], "z": vector3[2]}

def path_to_dot_notation(path: str) -> str:
    return path.replace("/", ".")
