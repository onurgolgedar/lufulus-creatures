function earthmove_initiate() {
	if (type == type_kador) {
		abilityEarthMove = true
		earthMovePoints = -irandom_range(15, 35)

		if (ds_list_find_index(bars, sk_earthmove) == -1)
			ds_list_add(bars, sk_earthmove)
	}


}
