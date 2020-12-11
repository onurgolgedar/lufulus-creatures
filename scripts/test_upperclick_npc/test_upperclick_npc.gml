function test_upperclick_npc() {
	with (parNPC) {
	    if (position_meeting(mouse_x, mouse_y, id) and !death and mode != md_attack)
	        return true
	}

	return false


}
