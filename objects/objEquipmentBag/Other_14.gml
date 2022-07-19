if (global.itemSelected != -1 and global.itemSelected.from == window_actives)
	global.itemSelected = -1
		  
with (paritem) {
    if (owner == other.id)
        instance_destroy()
}