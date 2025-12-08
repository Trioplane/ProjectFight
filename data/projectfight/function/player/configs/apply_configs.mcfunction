scoreboard players set @s projectfight.player.health 100
scoreboard players set @s projectfight.player.max_health 100
scoreboard players set @s projectfight.player.strength_modifier 100
scoreboard players set @s projectfight.player.weakness_modifier 100
scoreboard players set @s projectfight.player.damage_to_deal 0
scoreboard players set @s projectfight.player.hit_combo 0
scoreboard players set @s projectfight.player.death_timer 0
scoreboard players set @s projectfight.player.movement.ledge_grab.cooldown 0
scoreboard players set @s projectfight.player.movement.slide.cooldown 0
scoreboard players set @s projectfight.player.movement.time.cooldown 0
scoreboard players set @s projectfight.player.movement.air_dash.cooldown 0
attribute @s minecraft:gravity base set 0.045
attribute @s minecraft:attack_damage base set 0
attribute @s minecraft:attack_knockback base set 0
attribute @s minecraft:step_height base set 1
attribute @s minecraft:sneaking_speed base set 0.7
$data modify storage projectfight:players temp.hud.var set from storage projectfight:players "$(id)".hud.var
execute unless data storage projectfight:players temp.hud.var.kill_message run data modify storage projectfight:players temp.hud.var.kill_message set value {text: ""}
$data modify storage projectfight:players "$(id)".hud.var set from storage projectfight:players temp.hud.var
tag @s remove projectfight.player.playing
effect give @s resistance infinite 5 true
effect give @s saturation infinite 5 true
