tp @s @s
scoreboard players set $x player_motion.api.launch 0
scoreboard players set $y player_motion.api.launch 6000
scoreboard players set $z player_motion.api.launch 0
function player_motion:api/launch_xyz
scoreboard players set @s projectfight.player.movement.ledge_grab.cooldown 20
playsound minecraft:entity.breeze.jump master @s ~ ~ ~
