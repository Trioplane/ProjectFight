tag @s add projectfight.items.wet_floor_sign.placed
tag @s add projectfight.items.wet_floor_sign.placed.temp
function projectfight:items/definitions/wet_floor_sign/movement_step/nested_execute_0
summon item_display ~ ~ ~ {Tags: ["projectfight.items.wet_floor_sign.trigger_area", "projectfight.items.wet_floor_sign.trigger_area.temp"], brightness: {block: 15, sky: 15}, item: {id: "popped_chorus_fruit", components: {item_model: "projectfight:general/trigger_area"}}, transformation: {translation: [0.0f, 0.51f, 0.0f], scale: [10, 1.0f, 10], left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]}}
execute as @n[type=item_display, tag=projectfight.items.wet_floor_sign.trigger_area.temp] run function projectfight:items/definitions/wet_floor_sign/movement_step/nested_execute_1
particle minecraft:dust_pillar{block_state: {Name: "yellow_concrete_powder"}} ~ ~ ~ 1 1 1 0.5 40
particle minecraft:dust{scale: 1, color: [0.5f, 0.5f, 0.5f]} ~ ~0.5 ~ 1.2 0.4 1.2 1 20
particle minecraft:dust{scale: 2, color: [0.2f, 0.2f, 0.2f]} ~ ~0.5 ~ 2 0.2 2 0.5 20
playsound minecraft:entity.ravager.step
playsound minecraft:block.bamboo_wood.place master @a
tag @s remove projectfight.items.wet_floor_sign.placed.temp
