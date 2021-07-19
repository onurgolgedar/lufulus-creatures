/// @param id*
function test_upperclick_window(_id) {
	var __window = _id == undefined ? id : _id

	if (instance_exists(objMap) and objMap.depth < depth)
		return true
	
	if (instance_exists(contPlayer) and contPlayer.onDialogue) {
		if !(instance_exists(__window) and __window.object_index == objMessageBox and __window.dialogueID != -1)
			return true
	}

	with (__window) {
		with (parWindow) {
		    event_user(1)
		
		    if (mouseOnBody and depth < other.depth)
		        return true
		}

		return false
	}

	return false
}
