/// @description Last Alarm

if (!isShowed_ready_info and pwr == 1) {
	slide_text(owner.x, owner.y, "max", c_nicepurple, false, true)
	isShowed_ready_info = true
}

if (!((mouse_check_button(mb_left) and !mouse_check_button(mb_right) and !global.gamepad_active and !IS_MOBILE)
	or (contGUi.joystick2_hold and !global.gamepad_active and IS_MOBILE)
	or (gamepad_button_check(global.gamepad, gp_shoulderr) and !gamepad_button_check(global.gamepad, gp_shoulderrb) and global.gamepad_active))) {
	event_perform(ev_other, ev_user5)

	var arrowSound = audio_play_sound(choose(sndBow2, sndBow2/*sndBow*/, sndBow2, sndBow3), 1, false)
	audio_play_sound(sndArrow, 1, false)
	audio_sound_pitch(arrowSound, random_range(0.95, 1.25))
	
	with (owner)
		arrow_shoot(37+other.pwr*16, objBowControl, other.pwr)
	
	objBowControl.ropeFree = true
	objBowControl.arrowVisibility = 0
	delta_alarm(0, sec/6, objBowControl)

	instance_destroy()
}
else
	delta_alarm(1, 2)