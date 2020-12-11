/// @param saveKey*
function save_stats() {

	if (can_save()) {
		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")
			ini_write_real("3u56xgh", "3t21sjj3k", encyrpt(global.givenStr))
			ini_write_real("3u56xgh", "25ihgx3x", encyrpt(global.givenDex))
			ini_write_real("3u56xgh", "je43sbw3", encyrpt(global.givenVit))
			ini_write_real("3u56xgh", "25ucs6s", encyrpt(global.givenMp))
			ini_write_real("3u56xgh", "62asy3trc", encyrpt(global.givenSta))
			ini_write_real("3u56xgh", "25t2axvn3t", encyrpt(global.statPoints))
		if (argument_count == 1) ini_close()
	}


}
