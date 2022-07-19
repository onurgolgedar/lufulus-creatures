if (global.itemSelected != -1 and global.itemSelected.from == window_trade)
	global.itemSelected = -1

for (var i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (var j = 0; j < verticalBoxCount; j++) {
        if (item[i, j] != -1)
            instance_destroy(item[i, j])
	}
}

for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
    for (var j = 0; j < global.bagBoxCount_vertical; j++) {
        if (im_item[i, j] != -1)
            instance_destroy(im_item[i, j])
	}
}

with (objMessageBox) {
	if (owner != -1 and instance_exists(owner) and object_get_parent(owner.object_index) == paritem and owner.from == window_items)
		close_window()
}

event_perform(ev_other, ev_user7)

with (paritem)
    if (owner == other.id)
        instance_destroy()