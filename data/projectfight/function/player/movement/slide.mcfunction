tag @s add projectfight.player.temp.movement.slide
summon item_display ~ ~1 ~ {Tags: ["projectfight.player.movement.slide.shulker_vehicle", "projectfight.player.temp.movement.slide.shulker_vehicle"], Passengers: [{id: "minecraft:shulker", NoAI: true, Invulnerable: true, Color: 12b, attributes: [{id: "minecraft:scale", base: 1.75d}], active_effects: [{id: "invisibility", duration: -1, show_particles: false}]}]}
execute as @n[type=item_display, tag=projectfight.player.temp.movement.slide.shulker_vehicle] run scoreboard players operation @s projectfight.player.movement.slide.shulker.owner = @p[tag=projectfight.player.temp.movement.slide] projectfight.player.id
execute positioned 0.0 0.0 0.0 rotated ~ 0 run summon marker ^ ^ ^2 {Tags: ["projectfight.player.temp.movement.slide.vector"]}
execute store result score $x player_motion.api.launch run data get entity @n[type=marker, tag=projectfight.player.temp.movement.slide.vector] Pos[0] 10000
execute store result score $z player_motion.api.launch run data get entity @n[type=marker, tag=projectfight.player.temp.movement.slide.vector] Pos[2] 10000
scoreboard players set $y player_motion.api.launch -500
function player_motion:api/launch_xyz
kill @n[type=marker, tag=projectfight.player.temp.movement.slide.vector]
tag @s remove projectfight.player.temp.movement.slide
tag @n[type=item_display, tag=projectfight.player.temp.movement.slide.shulker_vehicle] remove projectfight.player.temp.movement.slide.shulker_vehicle
playsound minecraft:entity.breeze.slide master @s ~ ~ ~
scoreboard players set @s projectfight.player.movement.slide.cooldown 20
scoreboard players set @s projectfight.player.movement.slide.time 10
