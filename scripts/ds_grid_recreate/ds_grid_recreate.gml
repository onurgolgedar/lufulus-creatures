/// @param grid
/// @param w
/// @param h
/// @param defaultValue*
function ds_grid_recreate() {

	if (ds_exists(argument[0], ds_type_grid))
		ds_grid_destroy(argument[0])
	
	var result = ds_grid_create(argument[1], argument[2])

	if (argument_count > 3)
		ds_grid_set_region(result, 0, 0, argument[1]-1, argument[2]-1, argument[3])
	
	return result


}
