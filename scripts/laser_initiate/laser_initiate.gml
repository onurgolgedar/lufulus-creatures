/// @param laserDamage
/// @param laserDuration
function laser_initiate() {

	abilityLaser = true
	laserPoints = 0
	laserDamage = argument[0]
	laserDuration = argument[1]

	if (ds_list_find_index(bars, sk_laser) == -1)
		ds_list_add(bars, sk_laser)


}
