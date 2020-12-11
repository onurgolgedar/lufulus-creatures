var my = device_mouse_y_to_gui(0)
var hPort = view_get_hport(0)

if (my > hPort-200) {
	for (var i = 0; i < 5; i++) {
		if (tbW[i] != -1 and mouseOnSkillBox[i] and i != 4) {
			skillSprite[i] = -1
			global.selectedSkillMaxRem[i] = -1
			global.selectedSkillRem[i] = -1
			global.selectedSkillMana[i] = -1
			global.selectedSkill[i] = -1
			tbT[i] = pointer_null
			tbW[i] = -1
			tbH[i] = -1
				
			event_user(0)
			save_skills(global.saveNo)
		}
	}
}