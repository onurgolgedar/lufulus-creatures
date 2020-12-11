/// @description Stop Vibration

if (global.gamepad_active)
	gamepad_set_vibration(global.gamepad, 0, 0)