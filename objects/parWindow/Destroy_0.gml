if (owner != -1 and instance_exists(owner) and object_get_parent(owner.object_index) == parNPC) {
	with (owner)
		ds_list_delete(windows, ds_list_find_index(windows, other.id))
}