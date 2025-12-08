data modify storage projectfight:gui hud.display set value []
execute if score @s projectfight.player.hit_combo matches 1.. run function projectfight:gui/hud/build/hit_combo
$execute if score @s projectfight.gui.hud.kill_message.visible matches 1.. run function projectfight:gui/hud/build/kill_message {kill_message:$(kill_message)}
function projectfight:gui/hud/build/health
