$data modify storage scrfx:zinternals temp.current_screen_effect_frame.path set from storage scrfx:running_screen_effects running."$(player_id)".path
execute store result storage scrfx:zinternals temp.current_screen_effect_frame.frame int 1 run scoreboard players get @s scrfx.zinternals.player.current_frame
execute if score @s scrfx.zinternals.player.has_callbacks matches 1 run function scrfx:zinternals/get_current_frame_data/get_callback_command with storage scrfx:zinternals temp.current_screen_effect_frame
