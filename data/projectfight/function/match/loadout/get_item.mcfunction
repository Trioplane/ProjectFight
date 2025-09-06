execute store result score .length projectfight.match.loadout run data get storage projectfight:match loadout.items
execute store result storage projectfight:match loadout.length int 1 run scoreboard players remove .length projectfight.match.loadout 1
function projectfight:match/loadout/get_item/get_random_number with storage projectfight:match loadout
function projectfight:match/loadout/get_item/select_item with storage projectfight:match temp
function projectfight:items/main/give_item with storage projectfight:match loadout
