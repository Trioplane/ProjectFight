"""Wrapper for number providers."""
import json
from typing import Any


class NumberProvider:
    
    @staticmethod
    def sum(*operands: Any) -> str:
        provider = {
            "type": "minecraft:sum",
            "operands": []
        }

        provider["operands"] += operands

        return json.dumps(provider)
    