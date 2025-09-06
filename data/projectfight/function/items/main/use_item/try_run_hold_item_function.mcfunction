$execute if score @s projectfight.player.item.using_time < .hold_duration projectfight.items.config.$(item_name) run return fail
$function projectfight:items/definitions/$(item_name)/use with storage projectfight:items temp.player
clear @s *[custom_data~{projectfight: {is_item: true}}] 1
