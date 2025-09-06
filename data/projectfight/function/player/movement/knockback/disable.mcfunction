attribute @s minecraft:movement_speed modifier remove projectfight:knockback_stun
attribute @s minecraft:movement_efficiency modifier remove projectfight:knockback_stun
attribute @s minecraft:jump_strength modifier remove projectfight:knockback_stun
scoreboard players set @s projectfight.player.movement.knockback.has_touched_ground 0
effect clear @s invisibility
execute as @n[type=item_display, tag=projectfight.player.display, predicate=projectfight:util/compare_score/player.display.owner] run function animated_java:player_display/remove/this
tag @s remove projectfight.player.knockback_stunned
