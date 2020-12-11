/// @param power
function shock_initiate() {

	abilityShock = true
	shockPoints = -irandom_range(15, 35)
	shockPower = argument[0]
	shockLoad = -1

	if (ds_list_find_index(bars, sk_shock) == -1)
		ds_list_add(bars, sk_shock)


}
