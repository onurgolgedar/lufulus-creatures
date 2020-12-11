/// @param x
/// @param y
/// @param text
/// @param title
/// @param time*
function show_messagebox() {

	var messageBox = instance_create_layer(argument[0], argument[1], "lyWindows", objMessageBox)
	messageBox.text = argument[2]
	messageBox.title = argument[3]
	messageBox.owner = -1
	messageBox.buttonCount = 1
	messageBox.button[0] = eng() ? "Okay" : "Tamam"
	messageBox.buttonClipped[0] = messageBox.button[0]
	messageBox.time = -1
	messageBox.maxTime = -1

	if (argument_count == 5) {
	    messageBox.time = argument[4]+sec
	    messageBox.maxTime = argument[4]
	    messageBox.alarm[3] = 1
	}
	else
		audio_play_sound(sndWindowTick, 1, 0)

	return messageBox


}
