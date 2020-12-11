function define_normal_drop() {
	ds_list_add(global.normalDrops, argument[0])
	var normalDrop = instance_create(0, 0, argument[0])
	ds_list_add(global.normalDrops_levels, normalDrop.dropLevel)
	instance_destroy(normalDrop)


}
