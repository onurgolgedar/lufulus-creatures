if (hasDropList and ds_list_size(droppedList) > 0)
	image_index = type
else {
	image_index = 3
	
	if (light != pointer_null)
		instance_destroy(light)
}