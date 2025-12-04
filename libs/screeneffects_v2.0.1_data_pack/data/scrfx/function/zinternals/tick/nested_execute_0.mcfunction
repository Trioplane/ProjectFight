execute store result storage scrfx:zinternals temp.to_clear.player_id int 1 run scoreboard players get @s scrfx.zinternals.player_id
function scrfx:zinternals/clear_running_screen_effect with storage scrfx:zinternals temp.to_clear
scoreboard players reset @s scrfx.zinternals.player.left_game
