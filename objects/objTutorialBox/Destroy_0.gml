var ds_size = ds_list_size(windows)
for (var i= 0; i < ds_size; i++) {
	with (ds_list_find_value(windows, i))
		close_window()
}
	
ds_list_destroy(windows)