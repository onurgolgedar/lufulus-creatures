function empty_box_exists_bank() {
	for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
		for (var j = 0; j < global.bagBoxCount_vertical; j++) {
	        if (global.item_bank[i, j] == -1)
				return true
		}
	}
                
	return false


}
