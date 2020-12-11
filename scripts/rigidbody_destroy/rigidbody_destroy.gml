function rigidbody_destroy() {
	if (rigidbodyParts != pointer_null) {
		var ds_size = ds_list_size(rigidbodyParts)
		for (var i = 0; i < ds_size; i++)
			instance_destroy(ds_list_find_value(rigidbodyParts, i))
	
		rigidbody_list_destroy()
	}


}
