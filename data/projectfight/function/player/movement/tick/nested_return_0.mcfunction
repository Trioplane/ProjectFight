particle minecraft:poof
particle minecraft:campfire_cosy_smoke
execute unless score @s projectfight.player.movement.knockback.has_touched_ground matches 0 as @n[type=item_display, tag=projectfight.player.display, predicate=projectfight:util/compare_score/player.display.owner] run function projectfight:player/movement/tick/nested_execute_2
scoreboard players set @s projectfight.player.movement.knockback.has_touched_ground 0
