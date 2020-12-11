/// @param obj
function is_in_shieldmode() {

	with (argument[0])
		return  (stance == stShieldMode and (mouse_check_button(mb_right) or gamepad_button_check(global.gamepad, gp_shoulderrb) or contPlayer.fixedShieldMode) and anim_end()) or (test_effectbox(efboxSkill2) and !efboxSkill2.finished)


}
