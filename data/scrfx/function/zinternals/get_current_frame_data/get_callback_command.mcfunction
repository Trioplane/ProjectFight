data remove storage scrfx:zinternals temp.current_screen_effect_frame.callback
$data modify storage scrfx:zinternals temp.current_screen_effect_frame.callback set from storage scrfx:running_screen_effects running."$(player_id)".callbacks."$(frame)"
