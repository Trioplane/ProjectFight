tag @s remove projectfight.player.dead
scoreboard players operation @s projectfight.player.health = @s projectfight.player.max_health
gamemode adventure @s
tp @s 0 63 0
data modify storage projectfight:gui actionbar.health.slot_negative set value [{text: "\ue004\ue003\ue004\ue003\ue004\ue000\ue003\ue001\ue003\ue002", font: "projectfight:hud/background", shadow_color: 0}, {text: "\u2665 ", color: "red", font: "default_neg", shadow_color: 0}, {score: {name: "@s", objective: "projectfight.player.health"}, color: "green", font: "default_neg", shadow_color: 0}, {text: " ", font: "default_neg", shadow_color: 0}]
data modify storage projectfight:gui actionbar.health.slot set value [{text: "\u2665 ", color: "red", font: "projectfight:hud/default_right", shadow_color: 0}, {score: {name: "@s", objective: "projectfight.player.health"}, color: "green", font: "projectfight:hud/default_right", shadow_color: 0}, {text: " ", font: "projectfight:hud/default_right", shadow_color: 0}]
