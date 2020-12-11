/// @param saveKey*
function save_skills() {

	if (can_save()) {
		ds_list_clear(global.list_selectedSkill)
		global.grid_skillUpgrade = ds_grid_recreate(global.grid_skillUpgrade, 20, 6)

		for (var i = 0; i < 5; i++)
			ds_list_add(global.list_selectedSkill, global.selectedSkill[i] == -1 ? -1 : object_get_name(global.selectedSkill[i]))
	
		for (var i = 0; i < 20; i++)
		    for (var j = 0; j < 6; j++)
				ds_grid_set(global.grid_skillUpgrade, i, j, global.skillUpgrade[i, j])
	
		if (argument_count == 1) ini_open(string(global.steamID)+"\\save_"+argument[0]+".lufsav")	
			ini_write_string("bf4b3sx5", "y3as6fa", ds_list_write(global.list_selectedSkill))
			ini_write_string("bf4b3sx5", "2x5a4hjk", ds_grid_write(global.grid_skillUpgrade))
	
			ini_write_real("bf4b3sx5", "8664f36ax", encyrpt(global.skillPoints))
			ini_write_real("bf4b3sx5", "25aa3atyx5", encyrpt(global.givenSkillPoints))
		if (argument_count == 1) ini_close()
	}


}
