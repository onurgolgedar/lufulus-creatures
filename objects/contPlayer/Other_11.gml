/// @description Character&Passive&Skill Upgrades

upgSk3 = skill_get_upgrade(objSkill_3)
upgSk4 = skill_get_upgrade(objSkill_4)
upgSk5 = skill_get_upgrade(objSkill_5)
upgSk6 = skill_get_upgrade(objSkill_6)
upgSk7 = skill_get_upgrade(objSkill_7)
maxUpgSk567 = max(upgSk5, upgSk6, upgSk7)

var maxUpg = max(upgSk5, upgSk6, upgSk7)

if (maxUpg > 0) {
	if (maxUpg == upgSk5)
		mainBSindex = 1
	else if (maxUpg == upgSk6)
		mainBSindex = 2
	else if (maxUpg == upgSk7)
		mainBSindex = 3
}
else
	 mainBSindex = 0

// Additional extension variables are on update_extensions
update_character()