function close_table() {
	if (!destroy) {
		destroy = true
		alarm[1] = 3
		alarm[0] = -1
	}

	if (object_index == objItemBag)
		with (objEquipmentBag) {
			alarm[1] = 1
			alarm[0] = -1
		}


}
