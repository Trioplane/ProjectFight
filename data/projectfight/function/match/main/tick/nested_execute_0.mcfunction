execute at @e[type=marker, tag=projectfight.dice.spawner, sort=random, limit=3] positioned ~ ~1.25 ~ unless entity @n[type=block_display, tag=projectfight.dice, distance=..1] run function projectfight:match/dice/spawn
scoreboard players set .dice_timer projectfight.match 20
