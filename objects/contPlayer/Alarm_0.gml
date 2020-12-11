if (instance_exists(objPlayer)) {	
	update_character()
	sync_localstats()
	
	if (is_castle(room) or (instance_exists(contWaveSpawn) and room != roomLufulus)) {
		with (objPlayer)
			rigidbody_noarms_type1()
	}
	else {
		if (global.lastWeaponChoice == 0) {
			if (global.weaponType != pointer_null)
				global.lastWeaponChoice = 1
			else if (global.sWeaponType != pointer_null)
				global.lastWeaponChoice = 2
			else
				global.lastWeaponChoice = 0
		}
	
		changeWeaponChoiceTo = global.lastWeaponChoice
		
		event_perform(ev_keyrelease, ord("Q"))
	}
	
	var ds_size = ds_list_size(global.permanentEfboxes)
	for (var i = 0; i < ds_size; i++) {
		with (objPlayer) {
			var efbox = asset_get_index(ds_list_find_value(global.permanentEfboxes, i))
			var efbox_time = ds_list_find_value(global.permanentEfboxes_time, i)
	
			var efbox_ins = add_effectbox(efbox) // ? will be written with all parameters
			efbox_ins.time = efbox_time
			efbox_ins.notNew = true
		}
	}
	
	delta_alarm(6, 2)
}