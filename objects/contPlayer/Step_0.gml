if (changeWeaponChoiceTo != -1 and anim_end(objPlayer))
	event_perform(ev_keyrelease, ord("Q"))
	
if (!contMain.isRoomOut and !objPlayer.death
and !global.consoleMode and global.skillBar == 0
and !objPlayer.stunned and !contPlayer.onDialogue
and !objPlayer.noArms) {
	var sk1 = keyboard_check_pressed(ord("1")) or (global.gamepad_active and gamepad_button_check_pressed(global.gamepad, gp_face3))
	var sk2 = keyboard_check_pressed(ord("2"))
	var sk3 = keyboard_check_pressed(ord("3"))
	var sk4 = keyboard_check_pressed(ord("4"))
	
	if (sk1 or sk2 or sk3 or sk4 or global_tab) {
		if (sk1)
			skill_use(global.selectedSkill[0], 0)
		else if (sk2)
			skill_use(global.selectedSkill[1], 1)
		else if (sk3)
			skill_use(global.selectedSkill[2], 2)
		else if (sk4)
			skill_use(global.selectedSkill[3], 3)
		/*else {
			if (contGUi.mouseOnSkillBox[0])
				skill_use(global.selectedSkill[0], 0)
			else if (contGUi.mouseOnSkillBox[1])
				skill_use(global.selectedSkill[1], 1)
			else if (contGUi.mouseOnSkillBox[2])
				skill_use(global.selectedSkill[2], 2)
			else if (contGUi.mouseOnSkillBox[3])
				skill_use(global.selectedSkill[3], 3)
			global_tab = false
		}*/
	}
}