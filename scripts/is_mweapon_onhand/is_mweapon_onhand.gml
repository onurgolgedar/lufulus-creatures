function is_mweapon_onhand() {
	return has_player_weaponcontrol(objMWeaponControl)
		   or has_player_weaponcontrol(objCrossbowControl)
		   or has_player_weaponcontrol(objShieldControl)
		   or has_player_weaponcontrol(objBowControl)


}
