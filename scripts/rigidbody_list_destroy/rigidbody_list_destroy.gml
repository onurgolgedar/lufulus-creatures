function rigidbody_list_destroy() {
	if (rigidbodyParts != pointer_null) {
		if (ds_exists(rigidbodyParts, ds_type_list))
			ds_list_destroy(rigidbodyParts)
		
		rigidbodyParts = pointer_null
	}


}
