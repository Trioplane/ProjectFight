tellraw @a {text: "[ProjectFight] datapack reloaded"}
function projectfight:load/set_global_rules
function projectfight:player/main/init
function projectfight:items/main/init
function projectfight:util/main/init
function projectfight:match/main/init
data modify storage projectfight:scrfx_data screen_effects set value {"projectfight:trplnr_opening": {tps: 1, frame_count: 98, path: "projectfight:scrfx/trplnr_opening", callbacks: {0: "execute at @s run playsound minecraft:block.fire.ambient", 65: "execute at @s run playsound minecraft:entity.player.attack.sweep master @s ~ ~ ~ 1 1.3", 79: "execute at @s run playsound minecraft:entity.breeze.land", 94: "execute at @s run playsound minecraft:entity.breeze.land master @s ~ ~ ~ 1 0.5"}}, "projectfight:death": {tps: 1, frame_count: 97, path: "projectfight:scrfx/death", callbacks: {0: "execute at @s run playsound minecraft:block.conduit.deactivate", 1: "execute at @s run playsound minecraft:block.conduit.deactivate master @s ~ ~ ~ 1 0.1", 75: "execute at @s run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 2", 88: "execute at @s run playsound minecraft:block.trial_spawner.ominous_activate"}}}
function scrfx:add_screen_effects {storage: "projectfight:scrfx_data", path: "screen_effects"}
