if (!IS_MOBILE)
	exit

if (!contGUI.joystick_hold and !contGUI.joystick2_hold and (!contPlayer.onDialogue or !IS_MOBILE))
	event_perform(ev_mouse, ev_mouse_wheel_down)