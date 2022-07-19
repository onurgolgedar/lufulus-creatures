/*if (keyboard_check(vk_add))
	exit*/
	
if (is_outfight()) {
	if (anim_end(objPlayer)) {
		if (objPlayer.stance == stBasicAttackBase_ohsword and !instance_exists(efboxSkill2))
			player_set_stance(stBasicAttackBase_ohsword_calm, sec/8)
		else
			delta_alarm(4, sec/2)
	}
	else
		delta_alarm(4, sec/2)
	
	if (!global.gamepad_active and (!mouse_check_button(mb_left) and !mouse_check_button(mb_right) and !IS_MOBILE or !contGUi.joystick2_hold and IS_MOBILE)
		or global.gamepad_active and !gamepad_button_check(global.gamepad, gp_shoulderr) and !gamepad_button_check(global.gamepad, gp_shoulderrb))
		doingAttack = false
	
	if (global.performanceMode == 0 and global.collectedExperience > 0)
		change_exp(global.collectedExperience)
	
	global.collectedExperience = 0
	
	if (irandom(5) == 0 or saveLevel_needed) {
		save_level(global.saveNo)
		save_stats(global.saveNo)
		save_skills(global.saveNo)
		saveLevel_needed = false
	}
}