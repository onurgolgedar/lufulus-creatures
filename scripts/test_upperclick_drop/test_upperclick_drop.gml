function test_upperclick_drop() {
	with (parTarget) {
	    if (hasDropList and ds_list_size(droppedList) > 0 and position_meeting(mouse_x, mouse_y, id) and death)
	        return true
	}

	with (objLootbox) {
	    if (hasDropList and ds_list_size(droppedList) > 0 and position_meeting(mouse_x, mouse_y, id))
	        return true
	}

	return false


}
