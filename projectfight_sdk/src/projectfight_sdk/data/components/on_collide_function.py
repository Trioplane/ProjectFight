from pydantic import BaseModel


class OnCollideFunctionComponentArgs(BaseModel):
    data_source: str
    path: str

class OnCollideFunctionComponentModel(BaseModel):
    function: str
    args: OnCollideFunctionComponentArgs | None = None

def get_function_code(on_collide_function: OnCollideFunctionComponentModel) -> list[str]:
    code_string = f"function {on_collide_function.function}"
    if on_collide_function.args is not None:
        code_string += f" with {on_collide_function.args.data_source} {on_collide_function.args.path}"
    
    return ["# OnCollideFunctionComponent", code_string]