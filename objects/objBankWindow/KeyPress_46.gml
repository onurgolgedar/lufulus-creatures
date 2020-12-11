if (global.itemSelected != -1) {
	if (global.itemSelected.isDeletable) {
	    if (global.itemSelected.isCollectable)
	        decrease_collectable_item_bank(global.itemSelected.object_index, 1, global.itemSelected.upgrade)
	    else
	        delete_item_bank(global.itemSelected.i, global.itemSelected.j)
	}
	else
		show_messagebox(300, 300, eng() ? "This item is permanent." : "Bu eşya kalıcıdır.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
}