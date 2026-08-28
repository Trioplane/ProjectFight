from pydantic import BaseModel


class OnTickFunctionComponentArgs(BaseModel):
    data_source: str
    path: str

class OnTickFunctionComponentModel(BaseModel):
    function: str
    args: OnTickFunctionComponentArgs | None = None

def get_function_code(on_tick_function: OnTickFunctionComponentModel) -> list[str]:
    code_string = f"function {on_tick_function.function}"
    if on_tick_function.args is not None:
        code_string += f" with {on_tick_function.args.data_source} {on_tick_function.args.path}"
    
    return [code_string]