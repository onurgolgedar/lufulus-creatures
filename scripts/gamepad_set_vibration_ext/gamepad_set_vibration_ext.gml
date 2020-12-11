/// @param leftMotor
/// @param rightMotor
/// @param duration
function gamepad_set_vibration_ext() {

	gamepad_set_vibration(global.gamepad, argument[0], argument[1])
	with (contPlayer)
		delta_alarm(9, argument[2])


}
