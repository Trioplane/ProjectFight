data modify storage projectfight:gui hud.display append value {score: {name: "@s", objective: "projectfight.player.hit_combo"}, font: "projectfight:hud/number_half_neg"}
data modify storage projectfight:gui hud.display append value {score: {name: "@s", objective: "projectfight.player.hit_combo"}, color: "white", font: "projectfight:hud/number_left"}
execute if score @s projectfight.player.hit_combo matches 1..9 run return run data modify storage projectfight:gui hud.display[-1].color set value "white"
execute if score @s projectfight.player.hit_combo matches 10..19 run return run data modify storage projectfight:gui hud.display[-1].color set value "#fff419"
execute if score @s projectfight.player.hit_combo matches 20..29 run return run data modify storage projectfight:gui hud.display[-1].color set value "#fc5203"
execute if score @s projectfight.player.hit_combo matches 30..39 run return run data modify storage projectfight:gui hud.display[-1].color set value "#fc1403"
execute if score @s projectfight.player.hit_combo matches 40..49 run return run data modify storage projectfight:gui hud.display[-1].color set value "#c7002e"
execute if score @s projectfight.player.hit_combo matches 50 run return run data modify storage projectfight:gui hud.display[-1].color set value "#ff0084"
data modify storage projectfight:gui hud.display append value {score: {name: "@s", objective: "projectfight.player.hit_combo"}, font: "projectfight:hud/number_half_neg"}
