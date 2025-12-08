tag @s remove projectfight.player.dead
scoreboard players operation @s projectfight.player.health = @s projectfight.player.max_health
gamemode adventure @s
execute unless entity @n[type=marker, tag=projectfight.match.spawn] run return run tp @s 0 63 0
tp @s @n[type=marker, tag=projectfight.match.spawn, sort=random]
