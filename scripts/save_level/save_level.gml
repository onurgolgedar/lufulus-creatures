/// @param saveKey*
function save_level() {

	if (can_save()) {
		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")
			ini_write_real("j32a52a", "6a2ayj3vc", encyrpt(global.level))
			ini_write_real("j32a52a", "2a7754xd", encyrpt(global.experience))
			ini_write_real("j32a52a", "52tx32ab1", encyrpt(global.targetExperience))
			ini_write_real("j32a52a", "2at36jdx2", encyrpt(global.previousExperience))
		if (argument_count == 1) ini_close()
	}


}
