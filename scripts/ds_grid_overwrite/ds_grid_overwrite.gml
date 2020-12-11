/// @param mainGrid
/// @param changerGrid
function ds_grid_overwrite() {

	var mainGrid = argument[0]

	var changerGrid = argument[1]
	var changerGrid_width = ds_grid_width(argument[1])
	var changerGrid_height = ds_grid_height(argument[1])

	for (var i = 0; i < changerGrid_width; i++) {
		for (var j = 0; j < changerGrid_height; j++) {
			ds_grid_set(mainGrid, i, j, ds_grid_get(changerGrid, i, j))
		}
	}


}
