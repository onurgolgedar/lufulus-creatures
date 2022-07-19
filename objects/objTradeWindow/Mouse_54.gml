if (test_upperclick_window() and !directRun)
	exit

if (global.itemSelected == -1 and !destroy or directRun) {
    var itemClicked = -1
    
	if (directRun)
		itemClicked = global.itemSelected
    else if (mouseOnBox) {
		if (item[mouseOnBox_i, mouseOnBox_j] != -1)
			itemClicked = item[mouseOnBox_i, mouseOnBox_j]
	}
            
    if (itemClicked != -1 and itemClicked.type != type_noitem) {
        if (itemClicked.cWorth <= global.money or loot) {
			if (itemClicked.type != type_hair) {	
				if (object_get_parent(owner.object_index) == parNPC and owner.tag == (eng() ? "Challenger" : "Söz Muhafızı") and !owner.death) {
					if (global.level >= itemClicked.itemLevel) {
						if (itemClicked.conditionalQuest == pointer_null or quest_exists(itemClicked.conditionalQuest)) {
							change_money(-itemClicked.cWorth, true)
					
							itemClicked.autoUse = true
							with (itemClicked)
								give_answer(0, 1)
						
							show_messagebox(800, 90, eng() ? ("You've activated "+itemClicked.name+".\nYou can see it in your quest table.") : (itemClicked.name+" sözleşmesini kabul ettin.\nGörev tablosundan sözleşmeni inceleyebilirsin."), eng() ? "Activated" : "Sözleşme Kabul Edildi", 3*sec)
					
							localbag_refresh()
						}
						else
							show_messagebox(600, 90, eng() ? "This challenge requires existance\nof a spesific quest." : "Bu sözleşmeyi alabilmek için belirli bir\ngöreve sahip olmanız gerekmekte.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
					}
					else
						show_messagebox(600, 90, eng() ? ("Your level is not acceptable.\n\n[c="+string(c_aqua)+"]Required Level: "+string(itemClicked.itemLevel)+"[/c]") : ("Seviyen uygun değil.\n\n[c="+string(c_aqua)+"]Gerekli Seviye: "+string(itemClicked.itemLevel)+"[/c]"), eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
				}
				else {
					var _i = -1
					var _j = -1
					var continueAdding = true
					
					if (directRun and instance_exists(objitemBag) and (objitemBag.mouseOnPageButton1 or objitemBag.mouseOnPageButton2 or objitemBag.mouseOnPageButton3)) {
						if (!objitemBag.mouseOnPageButton3) {
							var wantedPage = objitemBag.mouseOnPageButton1 ? 1 : 2
				
							for (var j = 0; j < global.bagBoxCount_vertical; j++) {
								for (var i = global.bagBoxCount_horizontal*(wantedPage-1); i < global.bagBoxCount_horizontal*wantedPage; i++) {
									if (global.item[i, j] == -1) {
										_i = i
										_j = j
										break
									}
								}
					
								if (_i != -1)
									break
							}
				
							if (_i == -1) {
								continueAdding = false
								show_messagebox(230, 230, eng() ? "This page is full." : "Bu sayfa tamamen dolu.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec*1.5)
							}
						}
						else {
							continueAdding = false
							show_messagebox(230, 230, eng() ? "You cannot put items to \"Loot\" page." : "Eşyalarınızı \"Ganimet\" sayfasına yerleştiremezsiniz.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec*1.5)
						}
					}
					
					if (continueAdding) {
						if (empty_box_exists()) {
							if (itemClicked.itemLevel <= global.level or directRun or loot) {
								if (directRun and _i == -1) {
									with (objitemBag) {
										event_perform(ev_other, ev_user1)
										event_perform(ev_other, ev_user2)
							
										if (mouseOnBox_i != -1 and item[mouseOnBox_i, mouseOnBox_j] == -1) {
											_i = mouseOnBox_i
											_j = mouseOnBox_j
										}
									}
								}
								add_item(itemClicked.object_index, itemClicked.upgrade,
						        itemClicked.extension[0],
						        itemClicked.extension[1], _i, _j, false, loot)
								if (itemClicked.isCollectable)
									increase_collectable_item(itemClicked.object_index, itemClicked.count-1, itemClicked.upgrade)
		
								audio_play_sound(snditemAdded, 10, false)
					
								if (!loot) {
									if (ds_list_find_index(global.takenTutorials, 6) == -1)
										ds_list_add(global.takenTutorials, 6)
									
									change_money(-itemClicked.cWorth, true)
									show_messagebox(800, 90, eng() ? ("You've purchased "+itemClicked.name+".") : (itemClicked.name+" satın aldın."), eng() ? "Purchased" : "Satın Alındı", sec)
					
									localbag_refresh()
								}
								else {
									ds_list_delete(owner.droppedList, itemClicked.i+itemClicked.j*horizontalBoxCount)
									ds_list_delete(owner.droppedUpgradeList, itemClicked.i+itemClicked.j*horizontalBoxCount)
									ds_list_delete(owner.droppedExtension0List, itemClicked.i+itemClicked.j*horizontalBoxCount)
									ds_list_delete(owner.droppedExtension1List, itemClicked.i+itemClicked.j*horizontalBoxCount)
									ds_list_delete(owner.droppedCountList, itemClicked.i+itemClicked.j*horizontalBoxCount)
				
									if (ds_list_size(owner.droppedList) == 0) {
										close_table()
					
										owner.alarm[9] = sec
										alarm[3] = -1
							        }
									else
										localbag_refresh()
								}
							}
							else
								show_messagebox(200, 200, eng() ? ("Your level is not enough to use\nthat item. If you really want to buy it,\ndrag&drop the item to your item bag.\n\n[c="+string(c_aqua)+"]Required Level: "+string(itemClicked.itemLevel)+"[/c]") : ("Seviyen bu eşyayı kullanabilmek için yetersiz.\nEğer eşyayı gerçekten satın almak istiyorsan,\neşyanı çanta penceresine sürükle ve bırak.\n\n[c="+string(c_aqua)+"]Gerekli Seviye: "+string(itemClicked.itemLevel)+"[/c]"), eng() ? "Are you sure?" : "Emin misin?", 2*sec)
						}
						else
							show_messagebox(200, 200, eng() ? "At least, one empty slot is needed." : "Çantada boş alan yok.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
					}
				}
			}
			else {
				global.hair = itemClicked.sprite_index
				
				if (!global.isCheated and !steam_get_achievement("charisma"))
					steam_set_achievement("charisma")
				
				change_money(-itemClicked.cWorth, true)
				show_messagebox(800, 90, eng() ? ("You've purchased "+itemClicked.name+".") : (itemClicked.name+" satın aldın."), eng() ? "Purchased" : "Satın Alındı", sec)
				
				localbag_refresh()
			}
        }
		else
			show_messagebox(600, 90, eng() ? "You have not enough gold." : "Altının yetersiz.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
    }
}