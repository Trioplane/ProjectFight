execute if entity @s[tag=!projectfight.player.dead, tag=!projectfight.player.knockback_stunned] at @s run function projectfight:player/movement/move
scoreboard players operation #compare_value projectfight.predicate.compare_score = @s projectfight.player.id
execute if score @s projectfight.player.movement.ledge_grab.cooldown matches 1.. run scoreboard players remove @s projectfight.player.movement.ledge_grab.cooldown 1
execute if score @s projectfight.player.movement.air_dash.cooldown matches 1.. run scoreboard players remove @s projectfight.player.movement.air_dash.cooldown 1
execute if score @s projectfight.player.movement.slide.cooldown matches 1.. run scoreboard players remove @s projectfight.player.movement.slide.cooldown 1
execute if score @s projectfight.player.movement.slide.time matches 1.. run function projectfight:player/movement/tick/nested_execute_0
execute if score @s projectfight.player.movement.slide.time matches 0 as @e[type=item_display, tag=projectfight.player.movement.slide.shulker_vehicle, predicate=projectfight:util/compare_score/player.movement.slide.shulker.owner] at @s run function projectfight:player/movement/tick/nested_execute_1
execute as @s[tag=projectfight.player.knockback_stunned] at @s run function projectfight:player/movement/tick/nested_execute_4
