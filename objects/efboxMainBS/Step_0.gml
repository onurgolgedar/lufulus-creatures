event_inherited()

global.skillBar += 100/(1.45*sec)*fastLoad*delta()

if (global.skillBar >= 100) {
	global.skillBar = 100
	event_perform(ev_other, ev_user0)
}

if (!IS_MOBILE and (keyboard_check_released(vk_control) or keyboard_check_released(vk_space))) {
	event_perform(ev_other, ev_user0)
	instance_destroy()
}