/// @param saveKey
function save_location() {

	if (can_save()) {
		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")
			ini_write_string("n5n58e4s", "n8653kg", room_get_name(get_location(global.locationName)))
		if (argument_count == 1) ini_close()
	}


}
