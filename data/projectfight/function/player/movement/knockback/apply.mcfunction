scoreboard players operation #compare_value projectfight.predicate.compare_score = @s projectfight.player.id
execute as @n[type=item_display, tag=projectfight.player.display, predicate=projectfight:util/compare_score/player.display.owner] run function animated_java:player_display/remove/this
execute store result score $x player_motion.api.launch run data get entity 000003a2-0000-0000-0000-000000000000 Pos[0] 1000
execute store result score $y player_motion.api.launch run data get entity 000003a2-0000-0000-0000-000000000000 Pos[1] 1000
execute store result score $z player_motion.api.launch run data get entity 000003a2-0000-0000-0000-000000000000 Pos[2] 1000
function player_motion:api/launch_xyz
function projectfight:player/movement/knockback/enable
