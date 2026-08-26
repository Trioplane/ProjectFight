from projectfight_sdk.data.models.generic import RelativeOrLocalAxis


def parse_relative_or_local_axis(tree: RelativeOrLocalAxis) -> str:
    value = str(tree.value) if tree.value != 0 else ""
    
    if tree.type == "relative":
        return f"~{value}"
    elif tree.type == "local":
        return f"^{value}"
    
def parse_identifier(identifier: str) -> tuple[str, str]:
    left_part, colon, right_part = identifier.partition(":")
    if colon == ":":
        return (left_part, right_part)
    else:
        return ("minecraft", left_part)