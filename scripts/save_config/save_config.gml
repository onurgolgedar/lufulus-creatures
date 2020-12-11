/// @param saveKey*
function save_config() {

	if (can_save()) {
		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")	
			ini_write_real("x2vxcx51", "2ba6dujk", encyrpt(global.impulseRatio))
		if (argument_count == 1) ini_close()
	}


}
