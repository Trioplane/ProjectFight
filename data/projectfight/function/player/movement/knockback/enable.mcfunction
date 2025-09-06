attribute @s minecraft:movement_speed modifier add projectfight:knockback_stun -1 add_multiplied_total
attribute @s minecraft:movement_efficiency modifier add projectfight:knockback_stun -1 add_multiplied_total
attribute @s minecraft:jump_strength modifier add projectfight:knockback_stun -1 add_multiplied_total
execute as @n[type=item_display, tag=projectfight.player.display, predicate=projectfight:util/compare_score/player.display.owner] run function animated_java:player_display/remove/this
scoreboard players set @s projectfight.player.movement.knockback.has_touched_ground 0
effect give @s invisibility infinite 0 true
execute rotated ~ 0 run function animated_java:player_display/summon {args: {animation: "knockback_on_air", start_animation: true}}
function projectfight:player/main/apply_skin_to_player_display
tag @s add projectfight.player.temp.display.owner
execute as @n[type=item_display, tag=projectfight.player.display.root.new, tag=aj.player_display.root] run function projectfight:player/movement/knockback/enable/nested_execute_0
tag @s remove projectfight.player.temp.display.owner
scoreboard players set @s projectfight.player.movement.knockback.stun_time 120
tag @s add projectfight.player.knockback_stunned
