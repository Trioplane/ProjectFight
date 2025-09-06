function projectfight:match/loadout/get_item
playsound minecraft:block.beacon.power_select block @s
playsound minecraft:entity.firework_rocket.twinkle block @s ~ ~ ~ 1 1.5
playsound minecraft:entity.arrow.hit_player block @s
execute as @n[type=block_display, tag=projectfight.dice, distance=..1.4, limit=1] at @s run function projectfight:match/dice/collect/nested_execute_0
