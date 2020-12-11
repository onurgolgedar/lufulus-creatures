function update_extensions() {
	ds_list_clear(global.activeExtensions)

	if (global.weaponI != -1) {
		if (is_extension_active(global.itemExtension0[global.weaponI, global.weaponJ]))
			ds_list_add(global.activeExtensions, global.itemExtension0[global.weaponI, global.weaponJ])
	
		if (is_extension_active(global.itemExtension1[global.weaponI, global.weaponJ]))
			ds_list_add(global.activeExtensions, global.itemExtension1[global.weaponI, global.weaponJ])
	}

	if (global.sWeaponI != -1) {
		if (is_extension_active(global.itemExtension0[global.sWeaponI, global.sWeaponJ]))
			ds_list_add(global.activeExtensions, global.itemExtension0[global.sWeaponI, global.sWeaponJ])
	
		if (is_extension_active(global.itemExtension1[global.sWeaponI, global.sWeaponJ]))
			ds_list_add(global.activeExtensions, global.itemExtension1[global.sWeaponI, global.sWeaponJ])
	}

	if (global.necklaceI != -1) {
		if (is_extension_active(global.itemExtension0[global.necklaceI, global.necklaceJ]))
			ds_list_add(global.activeExtensions, global.itemExtension0[global.necklaceI, global.necklaceJ])
	
		if (is_extension_active(global.itemExtension1[global.necklaceI, global.necklaceJ]))
			ds_list_add(global.activeExtensions, global.itemExtension1[global.necklaceI, global.necklaceJ])
	}

	if (global.medallionI != -1) {
		if (is_extension_active(global.itemExtension0[global.medallionI, global.medallionJ]))
			ds_list_add(global.activeExtensions, global.itemExtension0[global.medallionI, global.medallionJ])
	
		if (is_extension_active(global.itemExtension1[global.medallionI, global.medallionJ]))
			ds_list_add(global.activeExtensions, global.itemExtension1[global.medallionI, global.medallionJ])
	}

	if (global.clothesI != -1) {
		if (is_extension_active(global.itemExtension0[global.clothesI, global.clothesJ]))
			ds_list_add(global.activeExtensions, global.itemExtension0[global.clothesI, global.clothesJ])
	
		if (is_extension_active(global.itemExtension1[global.clothesI, global.clothesJ]))
			ds_list_add(global.activeExtensions, global.itemExtension1[global.clothesI, global.clothesJ])
	}

	// Additional Extension Work
	with (contPlayer) {
		masterMage_extension = extension_exists(ext_med_masterMage)
		shiftNoSlow_extension = extension_exists(ext_shift_noslow)
		shiftCooldown_extension = extension_exists(ext_shift_cooldown)
		shiftHeal_extension = extension_exists(ext_med_torach)
		galaxy_extension = extension_exists(ext_med_galaxy)
	}


}
