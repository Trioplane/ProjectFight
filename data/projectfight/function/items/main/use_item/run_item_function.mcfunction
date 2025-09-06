$execute if score .hold_duration projectfight.items.config.$(item_name) matches 1.. run return run function projectfight:items/main/use_item/try_run_hold_item_function {item_name: "$(item_name)"}
$function projectfight:items/definitions/$(item_name)/use with storage projectfight:items temp.player
clear @s *[custom_data~{projectfight: {is_item: true}}] 1
