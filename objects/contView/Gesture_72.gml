if (!IS_MOBILE or contMain.isRoomOut)
	exit

if (!contGUi.joystick_hold and !contGUi.joystick2_hold and (!contPlayer.onDialogue or !IS_MOBILE))
	event_perform(ev_mouse, ev_mouse_wheel_up)