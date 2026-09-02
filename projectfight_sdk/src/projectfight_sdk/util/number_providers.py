"""Wrapper for number providers."""
import json
from typing import Any


class NumberProvider:
    
    @staticmethod
    def add(*inputs: Any) -> str:
        return json.dumps({
            "type": "minecraft:add",
            "inputs": [NumberProvider.__load_one(_input) for _input in inputs]
        })
    
    @staticmethod
    def storage(storage: str, path: str) -> str:
        return json.dumps({
            "type": "minecraft:storage",
            "storage": storage,
            "path": path
        })

    @staticmethod
    def __load_one(_input) -> Any:
        return json.loads(_input) if isinstance(_input, str) else _input