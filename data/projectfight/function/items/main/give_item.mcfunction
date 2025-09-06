execute store result storage projectfight:items temp.player.id int 1 run scoreboard players get @s projectfight.player.id
$data modify storage projectfight:items temp.player.item_to_give set value "$(item)"
function projectfight:items/main/give_item/set_item with storage projectfight:items temp.player
$give @s amethyst_shard[custom_data={projectfight:{is_item:true}},consumable={consume_seconds:99999999},item_name={translate:"projectfight.items.$(item)"},item_model="projectfight:items/$(item)"]
$tellraw @s [{text:"You got "},{translate:"projectfight.items.$(item)"}]
