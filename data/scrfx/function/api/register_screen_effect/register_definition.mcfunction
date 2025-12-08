$execute unless data storage $(storage) $(path) run return run function scrfx:zinternals/messages/failed_to_register_screen_effect_definition {storage: "$(storage)", path: "$(path)"}
$data modify storage scrfx:zinternals temp.register_screen_effect.screen_effect set from storage $(storage) $(path)
$function scrfx:zinternals/register_screen_effect/register with storage $(storage) $(path)
