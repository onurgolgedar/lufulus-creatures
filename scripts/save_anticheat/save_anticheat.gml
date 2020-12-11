/// @param saveKey*
function save_anticheat() {

	if (can_save()) {
		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")	
			ini_write_real("5b287sdx", "35b8ks", encyrpt(global.isCheated))
		if (argument_count == 1) ini_close()
	}


}
