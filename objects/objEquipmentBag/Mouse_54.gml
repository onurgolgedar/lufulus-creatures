if (test_upperclick_window())
	exit

if (global.itemSelected == -1 and !destroy) {
    var itemClicked = -1
    
    if (mouseOnBox)
        if (item[mouseOnBox_i, mouseOnBox_j] != -1)
            itemClicked = item[mouseOnBox_i, mouseOnBox_j]
            
    if (itemClicked != -1 and itemClicked.type != type_noitem) {
		if (empty_box_exists()) {
			var itemType = itemClicked.type

			var currentPage = 1
		    for (var j = 0; j < global.bagBoxCount_vertical; j++) {
		        for (var i = global.bagBoxCount_horizontal*(currentPage-1); i < global.bagBoxCount_horizontal*currentPage; i++) {
					if (global.item[i, j] == -1) {
						item_move(get_active_item_ij(itemType, 0), get_active_item_ij(itemType, 1), i, j)
						
						i = 999
						j = 999
						
						with (objitemBag) {
							page = currentPage
							beforePage = currentPage
						}
							
						break
					}
				}
				
				if (j+1 == global.bagBoxCount_vertical) {
					if (currentPage < global.bagMaxPage) {
					    currentPage += 1
					    j = -1
					}
				}
			}
		
			deactive_item(itemType)
			
			with (objTradeWindow)
				localbag_refresh()
			bankwindow_refresh()
			itembag_refresh()
		}
		else
			show_messagebox(200, 200, eng() ? "At least, one empty slot is needed." : "Çantada boş alan yok.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
    }
}