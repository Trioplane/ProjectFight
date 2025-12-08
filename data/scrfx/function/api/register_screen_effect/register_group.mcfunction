$execute unless data storage $(storage) $(path) run return run function scrfx:zinternals/messages/failed_to_register_screen_effect_group {storage: "$(storage)", path: "$(path)"}
$data modify storage scrfx:zinternals temp.register_screen_effect.screen_effect_group set from storage $(storage) $(path)
$data modify storage scrfx:zinternals temp.register_screen_effect.group set value {storage: "$(storage)", path: "$(path)"}
function scrfx:zinternals/register_screen_effect/iterate
tellraw @a {text: "Click me to disable ScreenEffects debug messages.", color: "gray", italic: true, click_event: {action: "run_command", command: "/scoreboard players set .disable_reload_message scrfx.zinternals.globals 1"}}
