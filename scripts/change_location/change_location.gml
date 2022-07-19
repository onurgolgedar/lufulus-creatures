/// @param room
/// @param roomName
/// @param delay*
function change_location() {

	free_all_surfaces()

	var delay = sec/10
	if (argument_count > 2)
		delay = argument[2]

	contMain.targetRoom = argument[0]
	contMain.targetRoomName = argument[1]
	delta_alarm(4, delay, contMain)

	with (contGUi)
		colorScreenAlpha = 1.3

	with (parEffectBox)
		image_alpha = 0

	with (objTutorialBox)
		visible = false

	with (parWindow)
		depth += 500


}
