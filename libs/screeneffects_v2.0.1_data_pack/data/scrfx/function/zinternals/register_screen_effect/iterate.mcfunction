execute unless data storage scrfx:zinternals temp.register_screen_effect.screen_effect_group[0] run return run execute unless score .disable_reload_message scrfx.zinternals.globals matches 1 run function scrfx:zinternals/messages/finished_registering_screen_effect_group with storage scrfx:zinternals temp.register_screen_effect.group
data modify storage scrfx:zinternals temp.register_screen_effect.screen_effect set from storage scrfx:zinternals temp.register_screen_effect.screen_effect_group[0]
function scrfx:zinternals/register_screen_effect/register with storage scrfx:zinternals temp.register_screen_effect.screen_effect_group[0]
data remove storage scrfx:zinternals temp.register_screen_effect.screen_effect_group[0]
function scrfx:zinternals/register_screen_effect/iterate
