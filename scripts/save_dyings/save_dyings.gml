/// @param saveKey*
function save_dyings() {

	if (can_save()) {
		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")
			ini_write_real("52a5hs2x", "131sz5ds", encyrpt(global.levels_withoutDying))
			ini_write_real("52a5hs2x", "125fw62ax", encyrpt(global.levels_withoutDying_rewardCount))
		if (argument_count == 1) ini_close()
	}


}
