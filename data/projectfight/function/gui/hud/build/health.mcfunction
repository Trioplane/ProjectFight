data modify storage projectfight:gui hud.display append value {score: {name: "@s", objective: "projectfight.player.health"}, font: "projectfight:hud/number_half_neg"}
data modify storage projectfight:gui hud.display append value {score: {name: "@s", objective: "projectfight.player.health"}, color: "white", font: "projectfight:hud/number_right"}
execute if score @s projectfight.player.health matches 69..100 run return run data modify storage projectfight:gui hud.display[-1].color set value "white"
execute if score @s projectfight.player.health matches 34..68 run return run data modify storage projectfight:gui hud.display[-1].color set value "yellow"
execute if score @s projectfight.player.health matches 0..33 run return run data modify storage projectfight:gui hud.display[-1].color set value "red"
data modify storage projectfight:gui hud.display append value {score: {name: "@s", objective: "projectfight.player.health"}, font: "projectfight:hud/number_half_neg"}
