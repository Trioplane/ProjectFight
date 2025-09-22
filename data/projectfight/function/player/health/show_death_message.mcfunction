execute if score @s projectfight.player.id = @p[tag=projectfight.player.temp.attacker] projectfight.player.id run return run tellraw @s {translate: "projectfight.death.generic.self", color: "red", italic: true}
$tellraw @s {translate:"$(translation_key).victim",with:[{"selector":"@p[tag=projectfight.player.temp.attacker]",color:"red"}],color:"gray"}
$tellraw @p[tag=projectfight.player.temp.attacker] {translate:"$(translation_key).attacker",with:[{"selector":"@s",color:"gold"}],color:"gray"}
