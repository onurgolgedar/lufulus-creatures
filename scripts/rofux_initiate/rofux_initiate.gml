/// @param damage
function rofux_initiate() {

	abilityRofux = true
	rofuxPoints = -irandom_range(15, 35)
	rofuxDamage = argument[0]

	if (ds_list_find_index(bars, sk_rofux) == -1)
		ds_list_add(bars, sk_rofux)


}
