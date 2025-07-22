scoreboard players set @s scrfx.zinternals.player.is_running_screen_effect 0
execute store result storage scrfx:zinternals temp.clear_running_screen_effect.player_id int 1 run scoreboard players get @s scrfx.zinternals.player_id
function scrfx:zinternals/clear_running_screen_effect with storage scrfx:zinternals temp.clear_running_screen_effect
