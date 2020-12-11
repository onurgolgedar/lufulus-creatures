function save_all() {
	if (can_save()) {
		ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")
			ini_write_real("v5xu12xuds", "gqx3gs62x", true)
			global.antiCheat_forSaveFiles = true
			save_bag()
			save_bank()
			save_level()
			save_stats()
			save_skills()
			save_lastweaponchoice()
			save_quests()
			save_fms()
			save_location()
			save_permanentefboxes()
			save_general()
			save_config()
			save_dyings()
			save_maxcreturescore()
			save_anticheat()
		ini_close()
	}


}
