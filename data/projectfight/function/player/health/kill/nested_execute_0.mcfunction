tellraw @s [{selector: "@p[tag=projectfight.player.temp.attacker]"}, {text: " killed you"}]
tellraw @p[tag=projectfight.player.temp.attacker] [{text: "You killed "}, {selector: "@s"}]
