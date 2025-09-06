execute rotated ~ 0 run tp @n[type=item_display, tag=projectfight.player.display, predicate=projectfight:util/compare_score/player.display.owner] ~ ~ ~
execute if score @s projectfight.player.movement.knockback.stun_time matches ..0 run return run function projectfight:player/movement/knockback/disable
scoreboard players remove @s projectfight.player.movement.knockback.stun_time 1
execute unless predicate projectfight:player/movement/is_on_ground run return run function projectfight:player/movement/tick/nested_return_0
execute unless score @s projectfight.player.movement.knockback.has_touched_ground matches 1 as @n[type=item_display, tag=projectfight.player.display, predicate=projectfight:util/compare_score/player.display.owner] run function projectfight:player/movement/tick/nested_execute_3
scoreboard players set @s projectfight.player.movement.knockback.has_touched_ground 1
scoreboard players remove @s projectfight.player.movement.knockback.stun_time 3
