event_inherited()

minDepth = 999

if (instance_exists(contPlayer))
	contPlayer.onDialogue = false

with (parWindow) {
    if (depth < other.depth)
        depth += 2
        
    if (id != other.id and depth < other.minDepth)
        other.minDepth = depth
		
	if (id != other.id and object_index == objMessageBox and dialogueID != -1 and instance_exists(contPlayer))
		contPlayer.onDialogue = true
}

with (parWindow) {
    if (depth == other.minDepth)
        front = true
}

with (parWindow) {
	if (object_index == objMessageBox and dialogueID != -1 and id != other.id)
		event_perform(ev_other, ev_user0)
}

if (specialDesign) {
	contGUi.findQuestion = false
}

if (dialogueID != -1 and pressedButtonClipped != "Cancel" and pressedButtonClipped != "İptal") {
	var dialogueBox = dialogue_progress(dialogueID, dialogueNo+1, owner, answer)
	if (dialogueBox == pointer_null)
		dialogueBox = dialogue_progress_quest(dialogueID, dialogueNo+1, owner, answer)
	
	if (dialogueBox != pointer_null) {
		dialogueBox.alignBottom = false
		dialogueBox.x = x
		dialogueBox.y = y
		contPlayer.onDialogue = true
	}
}