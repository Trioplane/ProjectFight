execute store result storage scrfx:zinternals temp.current_screen_effect_frame.player_id int 1 run scoreboard players get @s scrfx.zinternals.player_id
function scrfx:zinternals/get_current_frame_data with storage scrfx:zinternals temp.current_screen_effect_frame
function scrfx:zinternals/run_frame/display_title with storage scrfx:zinternals temp.current_screen_effect_frame
execute if score @s scrfx.zinternals.player.has_callbacks matches 1 run function scrfx:zinternals/run_frame/run_callback with storage scrfx:zinternals temp.current_screen_effect_frame
