tag @s add projectfight.player.dead
function projectfight:player/health/show_death_message with storage projectfight:health temp.damage
function projectfight:player/movement/knockback/disable
scoreboard players set @s projectfight.player.death_timer 86
data modify storage scrfx:in id set value "projectfight:death"
function scrfx:play
gamemode spectator @s
