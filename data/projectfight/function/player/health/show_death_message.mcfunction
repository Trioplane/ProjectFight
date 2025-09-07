execute if score @s projectfight.player.id = @p[tag=projectfight.player.temp.attacker] projectfight.player.id run return run title @s actionbar {translate: "projectfight.death.generic.self", color: "red", italic: true}
$title @s actionbar {translate:"$(translation_key).victim",with:[{"selector":"@p[tag=projectfight.player.temp.attacker]",color:"red"}],color:"gray"}
$title @p[tag=projectfight.player.temp.attacker] actionbar {translate:"$(translation_key).attacker",with:[{"selector":"@s",color:"gold"}],color:"gray"}
