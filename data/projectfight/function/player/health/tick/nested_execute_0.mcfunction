scoreboard players remove @s projectfight.player.death_timer 1
execute if score @s projectfight.player.death_timer matches 0 run function projectfight:player/health/respawn
