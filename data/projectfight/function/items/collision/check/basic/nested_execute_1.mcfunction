execute unless block ~ ~ ~ #air run tag @s add projectfight.items.marked_for_collision
execute as @a[tag=!projectifight.player.dead, dx=0, distance=..3] positioned ~-1 ~ ~-1 if entity @s[dx=0] run tag @n[type=item_display, tag=projectfight.items.temp.ahead_collision_check] add projectfight.items.marked_for_collision
