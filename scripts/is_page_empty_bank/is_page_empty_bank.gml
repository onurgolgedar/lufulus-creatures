/// @param page
function is_page_empty_bank() {

	for (var i = global.bagBoxCount_horizontal*(argument[0]-1); i < global.bagBoxCount_horizontal*argument[0]; i++)
		for (var j = 0; j < global.bagBoxCount_vertical; j++)
	        if (global.item_bank[i, j] != -1)
				return false
                
	return true


}
