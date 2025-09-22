tag @s add projectfight.items.banana_peel.placed
tag @s add projectfight.items.banana_peel.placed.temp
function projectfight:items/definitions/banana_peel/movement_step/nested_execute_0
summon item_display ~ ~ ~ {Tags: ["projectfight.items.banana_peel.trigger_area", "projectfight.items.banana_peel.trigger_area.temp"], brightness: {block: 15, sky: 15}, item: {id: "popped_chorus_fruit", components: {item_model: "projectfight:general/trigger_area"}}, transformation: {translation: [0.0f, 0.51f, 0.0f], scale: [1, 1.0f, 1], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}}
execute as @n[type=item_display, tag=projectfight.items.banana_peel.trigger_area.temp] run function projectfight:items/definitions/banana_peel/movement_step/nested_execute_1
particle minecraft:falling_honey ~ ~ ~ 0.3 0.5 0.3 1 5
playsound minecraft:block.honey_block.fall master @a ~ ~ ~ 1 2
tag @s remove projectfight.items.banana_peel.placed.temp
