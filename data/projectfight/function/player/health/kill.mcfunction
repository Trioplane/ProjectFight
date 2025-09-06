tag @s add projectfight.player.dead
execute if entity @p[tag=projectfight.player.temp.attacker] run function projectfight:player/health/kill/nested_execute_0
execute unless entity @p[tag=projectfight.player.temp.attacker] run tellraw @s "An unknown force killed you."
tag @s remove projectfight.player.knockback_stunned
function projectfight:player/movement/knockback/disable
scoreboard players set @s projectfight.player.death_timer 86
data modify storage scrfx:in id set value "projectfight:death"
function scrfx:play
gamemode spectator @s
