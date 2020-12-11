function recalculate_sha_stats() {
	return sha1_string_utf8(string(global.givenStr)+" "+
							string(global.givenDex)+" "+
							string(global.givenVit)+" "+
							string(global.givenMp)+" "+
							string(global.givenSta)+" "+
							string(global.virtual_str)+" "+
							string(global.virtual_dex)+" "+
							string(global.virtual_vit)+" "+
							string(global.virtual_mp)+" "+
							string(global.virtual_sta)+" "+
							string(global.virtual_stat_points)+" "+
							string(global.statPoints))


}
