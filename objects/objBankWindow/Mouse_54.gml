if (test_upperclick_window())
	exit

if (global.itemSelected == -1 and !destroy) {
    var itemClicked = -1
    
    if (mouseOnBox)
        if (item[mouseOnBox_i, mouseOnBox_j] != -1)
            itemClicked = item[mouseOnBox_i, mouseOnBox_j]
            
    if (itemClicked != -1 and itemClicked.type != type_noitem) {
		if (global.debt == 0) {
			var success = add_item(itemClicked.object_index, itemClicked.upgrade,
		    itemClicked.extension[0],
		    itemClicked.extension[1], -1, -1, true)
		
			if (success) {
				audio_play_sound(snditemAdded, false, false)
			
				if (instance_exists(itemClicked) and itemClicked.isCollectable)
					increase_collectable_item(itemClicked.object_index, itemClicked.count-1, itemClicked.upgrade)
		
				delete_item_bank(itemClicked.i, itemClicked.j)
			}
		}
		else
			show_messagebox(400, 400, eng() ? "You need to pay your debt." : "Borcunu ödemelisin.", eng() ? "Cannot be taken." : "Alınamaz.", sec*2)
    }
}