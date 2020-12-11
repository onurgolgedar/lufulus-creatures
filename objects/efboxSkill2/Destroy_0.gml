event_inherited()

finished = true

with (owner) {
	if (stance == stShieldMode and !(mouse_check_button(mb_right) or gamepad_button_check(global.gamepad, gp_shoulderl)))
		rigidbody_set_definedstance_type1(stBasicAttackBase_ohsword, sec/5)
		
	efboxSkill2_exists = false
}