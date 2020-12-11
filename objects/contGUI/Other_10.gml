for (var i = 0; i < 5; i++) {
	if (global.selectedSkill[i] != -1) {
		var skill = instance_create(-50, -50, global.selectedSkill[i])
		skill.upgrade = skill_get_upgrade(global.selectedSkill[i])
		skill.from = "AV"
		skillSprite[i] = skill.sprite_index
		with (skill) {
			event_perform(ev_other, ev_user0)
			other.tbT[i] = tbT
			other.tbW[i] = tbW
			other.tbH[i] = tbH
			
			global.selectedSkillMaxRem[i] = cMaxRem
			if (global.selectedSkillRem[i] == -1)
				global.selectedSkillRem[i] = cMaxRem
			global.selectedSkillMana[i] = cMana
			instance_destroy()
		}
	}
	else {
		skillSprite[i] = -1
		tbT[i] = pointer_null
		tbW[i] = -1
		tbH[i] = -1
	}
}