scoreboard players set @s projectfight.player.joining.start_intro.first_join 0
data modify storage scrfx:in id set value "projectfight:trplnr_opening"
function scrfx:play
effect clear @s blindness
tellraw @s {text: "[ProjectFight] new player"}
