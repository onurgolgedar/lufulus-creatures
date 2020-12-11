// ?
if (global.itemSelected != -1 and global.itemSelected.from == window_items)
	global.itemSelected = -1
	
with (objMessageBox) {
	var txt = draw_text_colortags(x, y, title)
	if (txt == "New Item" or txt == "Yeni Eşya" or
	(owner != -1 and instance_exists(owner) and object_get_parent(owner.object_index) == parItem and owner.from == window_items))
		close_window()
}

for (var i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (var j = 0; j < verticalBoxCount+5*(i == 0); j++) {
        if (item[i, j] != -1)
            instance_destroy(item[i, j])
	}
}

event_perform(ev_other, ev_user7)
		  
with (parItem) {
    if (owner == other.id)
        instance_destroy()
}