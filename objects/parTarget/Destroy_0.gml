with (parEffectBox) {
	if (owner == other.id)
		instance_destroy()
}

with (parTarget) {
	if (variable_instance_exists(id, "allies"))
		ai_protectors_remove(other.id)
}
		
ai_protectors_destroy()

ds_list_destroy(targetsPotential)
ds_list_destroy(targetsPotential_points)

if (hasDropList) {
	with (objTradeWindow)
		if (owner == other.id)
			close_table()

	drop_lists_destroy()
}

destroy_of_owner(parWeaponControl, id)