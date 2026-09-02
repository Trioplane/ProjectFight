__all__ = [
    "PERMA_MARKER"
]

PERMA_MARKER = "5fd2592f-f67c-4db5-97a3-d24d15bd1284"

def hex_to_int_uuid(uuid_hex: str) -> list[int]:

    unhyphenated_hex = uuid_hex.replace("-","")
    uuid_128_bits = int(unhyphenated_hex, 16)
    
    mask = (1 << 32) - 1
    
    unsigned_int_uuid = [(uuid_128_bits >> ((3-i) * 32)) & mask for i in range(4)]
    
    int_uuid = [x if x < (2**32/2) else x - 2**32 for x in unsigned_int_uuid]
    
    return int_uuid