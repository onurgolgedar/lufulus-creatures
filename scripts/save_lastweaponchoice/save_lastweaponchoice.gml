/// @param saveKey*
function save_lastweaponchoice() {

	if (can_save()) {
		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")
			ini_write_real("2a5n5ax", "52a99785d", encyrpt(global.lastWeaponChoice))
		if (argument_count == 1) ini_close()
	}


}
