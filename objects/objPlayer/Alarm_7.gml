/// @desc Calm Weapon Alpha

if (sWeaponAlpha_inc) {
	if (sWeaponAlpha_calm < 1) {
		sWeaponAlpha_calm += 0.2
		delta_alarm(7, sec/20)
	}
}
else {
	if (sWeaponAlpha_calm > 0) {
		sWeaponAlpha_calm -= 0.2
		delta_alarm(7, sec/20)
	}
}