$execute unless data storage projectfight:players "$(id)".current_item run return run tellraw @s "[ProjectFight] error: no current item."
$function projectfight:items/main/use_item/run_item_function with storage projectfight:players "$(id)".current_item
