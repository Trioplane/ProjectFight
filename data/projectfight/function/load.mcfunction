tellraw @a {text: "[ProjectFight] datapack reloaded"}
function projectfight:load/set_global_rules
function projectfight:player/main/init
function projectfight:items/main/init
function projectfight:util/main/init
function projectfight:match/main/init
function projectfight:gui/main/init
data modify storage projectfight:scrfx_data screen_effects set value [{name: "projectfight:intro", tps: 1, frame_count: 210, path: "projectfight:scrfx/intro", callbacks: {0: "execute at @s run playsound minecraft:block.fire.ambient", 59: "execute at @s run playsound minecraft:block.note_block.didgeridoo", 115: "execute at @s run playsound minecraft:block.note_block.didgeridoo", 178: "execute at @s run playsound minecraft:entity.player.attack.sweep master @s ~ ~ ~ 1 1.3", 193: "execute at @s run playsound minecraft:entity.breeze.land", 207: "execute at @s run playsound minecraft:entity.breeze.land master @s ~ ~ ~ 1 0.5"}}, {name: "projectfight:death", tps: 1, frame_count: 97, path: "projectfight:scrfx/death", callbacks: {0: "execute at @s run playsound minecraft:block.conduit.deactivate", 1: "execute at @s run playsound minecraft:block.conduit.deactivate master @s ~ ~ ~ 1 0.1", 75: "execute at @s run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 2", 88: "execute at @s run playsound minecraft:block.trial_spawner.ominous_activate"}}, {name: "projectfight:kill_indicator", tps: 1, frame_count: 19, path: "projectfight:scrfx/kill_indicator", callbacks: {0: "execute at @s run playsound minecraft:item.mace.smash_ground"}}]
function scrfx:api/register_screen_effect/register_group {storage: "projectfight:scrfx_data", path: "screen_effects"}
