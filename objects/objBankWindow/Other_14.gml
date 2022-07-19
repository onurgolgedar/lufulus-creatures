if (global.itemSelected != -1 and global.itemSelected.from == window_bank)
	global.itemSelected = -1

for (i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (j = 0; j < verticalBoxCount; j++) {
        if (item[i, j] != -1)
            instance_destroy(item[i, j])
	}
}

for (i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (j = 0; j < verticalBoxCount; j++) {
        if (im_item[i, j] != -1)
            instance_destroy(im_item[i, j])
	}
}

event_perform(ev_other, ev_user7)
		  
with (paritem) {
    if (owner == other.id)
        instance_destroy()
}