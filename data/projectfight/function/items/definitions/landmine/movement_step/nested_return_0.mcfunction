tag @s add projectfight.items.landmine.placed
tag @s add projectfight.items.landmine.placed.temp
function projectfight:items/definitions/landmine/movement_step/nested_execute_0
summon item_display ~ ~ ~ {Tags: ["projectfight.items.landmine.trigger_area", "projectfight.items.landmine.trigger_area.temp"], brightness: {block: 15, sky: 15}, item: {id: "popped_chorus_fruit", components: {item_model: "projectfight:general/trigger_area"}}, transformation: {translation: [0.0f, 0.51f, 0.0f], scale: [2, 1.0f, 2], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}}
execute as @n[type=item_display, tag=projectfight.items.landmine.trigger_area.temp] run function projectfight:items/definitions/landmine/movement_step/nested_execute_1
particle minecraft:dust{color: [0.3f, 0.3f, 0.3f], scale: 1} ~ ~ ~ 0.2 0.2 0.2 1 5
particle minecraft:dust{color: [0.5f, 0.5f, 0.5f], scale: 1.5d} ~ ~ ~ 0.3 0.2 0.3 1 5
playsound minecraft:block.vault.insert_item master @a ~ ~ ~ 0.5
tag @s remove projectfight.items.landmine.placed.temp
