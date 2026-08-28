from projectfight_sdk.data.models.generic import CoordinateMode


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


def path_to_dot_notation(path: str) -> str:
    return path.replace("/", ".")
