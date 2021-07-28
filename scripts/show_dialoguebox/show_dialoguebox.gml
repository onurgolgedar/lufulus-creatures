/// @param x
/// @param y
/// @param text
/// @param title
/// @param owner
/// @param qKey
/// @param but0
/// @param but1
/// @param ...
function show_dialoguebox() {

	var dialogueBox = instance_create_layer(argument[0], argument[1], "lyWindows", objMessageBox)
	dialogueBox.text = argument[2]
	dialogueBox.title = argument[3]
	dialogueBox.owner = argument[4]
	dialogueBox.qKey = argument[5]
	dialogueBox.time = -1
	dialogueBox.maxTime = -1

	var but
	var but_colorful
	var butNo

	but[0] = -1
	but[1] = -1
	but[2] = -1
	but[3] = -1
	but[4] = -1
	but[5] = -1
	but[6] = -1
	but[7] = -1
	but[8] = -1

	but_colorful[0] = -1
	but_colorful[1] = -1
	but_colorful[2] = -1
	but_colorful[3] = -1
	but_colorful[4] = -1
	but_colorful[5] = -1
	but_colorful[6] = -1
	but_colorful[7] = -1
	but_colorful[8] = -1

	butNo[0] = -1
	butNo[1] = -1
	butNo[2] = -1
	butNo[3] = -1
	butNo[4] = -1
	butNo[5] = -1
	butNo[6] = -1
	butNo[7] = -1
	butNo[8] = -1

	var butCount = 0

	audio_play_sound(sndWindowTick, 1, 0)

	var _argument
	for (var i = 6; i < argument_count; i++) {
		_argument[i] = argument[i]
		if (_argument[i] != "") {
			if (!eng()) {
				if (_argument[i] == "Cancel")
					_argument[i] = "İptal"
				else if (_argument[i] == "Okay")
					_argument[i] = "Tamam"
				else if (_argument[i] == "Accept")
					_argument[i] = "Kabul Et"
			}
			
			for (var j = 0; j < 9; j++) {
				if (but[j] == -1) {
					but[j] = draw_text_colortags(0, 0, _argument[i], false)
					but_colorful[j] = _argument[i]
					butNo[j] = i-6
					butCount++
					break
				}
			}
		}
	}

	for (var i = 0; i < butCount; i++) {
	    dialogueBox.button[i] = but[i]
		dialogueBox.button_colorful[i] = but_colorful[i]
		dialogueBox.buttonNo[i] = butNo[i]
		dialogueBox.buttonClipped[i] = string(unique_number)
	}

	dialogueBox.buttonCount = butCount

	return dialogueBox


}
