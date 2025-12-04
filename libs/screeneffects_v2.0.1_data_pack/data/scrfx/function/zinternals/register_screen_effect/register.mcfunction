$data modify storage scrfx:registry screen_effects."$(name)" set from storage scrfx:zinternals temp.register_screen_effect.screen_effect
$data remove storage scrfx:registry screen_effects."$(name)".name
$execute unless score .disable_reload_message scrfx.zinternals.globals matches 1 run function scrfx:zinternals/messages/finished_registering_screen_effect_definition {name: "$(name)"}
