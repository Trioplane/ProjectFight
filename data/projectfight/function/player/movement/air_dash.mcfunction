execute positioned 0.0 0.0 0.0 rotated ~ 0 run summon marker ^ ^ ^2 {Tags: ["projectfight.player.temp.movement.slide.vector"]}
execute store result score $x player_motion.api.launch run data get entity @n[type=marker, tag=projectfight.player.temp.movement.slide.vector] Pos[0] 4000
execute store result score $z player_motion.api.launch run data get entity @n[type=marker, tag=projectfight.player.temp.movement.slide.vector] Pos[2] 4000
scoreboard players set $y player_motion.api.launch -1000
function player_motion:api/launch_xyz
playsound minecraft:entity.breeze.shoot master @s ~ ~ ~ 0.5
playsound minecraft:entity.breeze.idle_air master @s ~ ~ ~ 0.5
kill @n[type=marker, tag=projectfight.player.temp.movement.slide.vector]
scoreboard players set @s projectfight.player.movement.air_dash.cooldown 30
scoreboard players set @s projectfight.player.movement.slide.cooldown 10
