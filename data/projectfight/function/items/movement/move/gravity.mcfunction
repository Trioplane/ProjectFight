scoreboard players operation #compare_value projectfight.predicate.compare_score = @s projectfight.items.id
$execute rotated as @e[type=item_display,tag=projectfight.items.initial_rotation,predicate=projectfight:util/compare_score/items.owner,limit=1] positioned ~ ~$(vertical) ~ positioned ^$(sideward) ^ ^$(horizontal) positioned ~ ~$(vertical) ~ run summon marker ^$(sideward) ^ ^$(horizontal) {Tags:["projectfight.items.temp.rotation_point"]}
$execute rotated as @e[type=item_display,tag=projectfight.items.initial_rotation,predicate=projectfight:util/compare_score/items.owner,limit=1] positioned ~ ~$(vertical) ~ run tp @s ^$(sideward) ^ ^$(horizontal) facing entity @n[type=marker,tag=projectfight.items.temp.rotation_point]
kill @n[type=marker, tag=projectfight.items.temp.rotation_point]
