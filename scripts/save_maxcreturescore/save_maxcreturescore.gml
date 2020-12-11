/// @param saveKey*
function save_maxcreturescore() {

	if (can_save()) {
		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")
			ini_write_real("52a5hs2x", "h23x3ht7", encyrpt(global.maxCreatureScore))
		if (argument_count == 1) ini_close()
	}


}
