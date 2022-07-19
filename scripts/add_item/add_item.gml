/// @param item
/// @param upgrade*
/// @param ext0*
/// @param ext1*
/// @param i*
/// @param j*
/// @param noBankTransfer*
/// @param reverseAdd*
/// @param startFromPage*
function add_item() {

	var ai_instanceOfItem = instance_create(0, 0, argument[0])
	var noSame = !item_exists(argument[0], (argument_count > 1) ? argument[1] : -1)
	var reverseAdd = argument_count > 7 ? argument[7] : false
	if (argument[0] == objUpgradeMaterial or ai_instanceOfItem.isForQuest)
		reverseAdd = false
	var currentPage = 1+reverseAdd*2
	var startFromPage = !reverseAdd and argument_count > 8 and argument[8] != false
	if (startFromPage)
		currentPage = argument[8]
	else if (!reverseAdd and argument_count <= 8 and instance_exists(objitemBag) and objitemBag.page != 3) {
		currentPage = objitemBag.page
		startFromPage = true
	}

	if (argument_count < 6 or (argument[4] == -1 and argument[5] == -1) or (ai_instanceOfItem.isCollectable and !noSame)) {
	    for (var j = 0; j < global.bagBoxCount_vertical; j++) {
	        for (var i = global.bagBoxCount_horizontal*(currentPage-1); i < global.bagBoxCount_horizontal*currentPage; i++) {
	            if (!ai_instanceOfItem.isCollectable or noSame) {
	                if (global.item[i, j] == -1) {
	                    global.item[i, j] = argument[0]
                    
	                    if (argument_count >= 2 and ai_instanceOfItem.upgrade != unique_number)
	                        global.itemUpgrade[i, j] = argument[1]
	                    else
	                        global.itemUpgrade[i, j] = ai_instanceOfItem.upgrade
						
						global.itemExtension0[i, j] = ai_instanceOfItem.extension[0]
	                    global.itemExtension1[i, j] = ai_instanceOfItem.extension[1]
                    
						// ?
					#region OVERWRITTEN EXTENSIONS
	                    if (argument_count > 3) {
							if (argument[2] != -1)
								global.itemExtension0[i, j] = argument[2] != 0 ? argument[2] : -1
							
							if (argument[3] != -1)
								global.itemExtension1[i, j] = argument[3] != 0 ? argument[3] : -1
	                    }
					#endregion
					
						if (currentPage == 3) {
							if (reverseAdd)
								global.newLoot = true
							else
								show_messagebox(200, 200, eng() ? "The item has been added to Item Bag's\nNew section because there other pages are full." : "Eklenen eşya çantanın yeni eklenenler sayfasına\neklendi. Çünkü diğer sayfalar doluydu.", eng() ? "Warning" : "Uyarı", sec*1.5)
						}
					
						with (objitemBag) {
							page = currentPage
							beforePage = currentPage
						}
                    
	                    global.itemType[i, j] = ai_instanceOfItem.type
	                    global.itemCount[i, j] = 1
	                    j = global.bagBoxCount_vertical
	                    currentPage = global.bagMaxPage
					
					#region END TRUE
						quest_item_check(ai_instanceOfItem)
					
	                    itembag_refresh()
	                    instance_destroy(ai_instanceOfItem)
						save_bag(global.saveNo)
						global.anticheat_ownings = recalculate_sha_ownings()
	                    return true
					#endregion
	                }
	            }
	            else if (global.item[i, j] == ai_instanceOfItem.object_index and
				(ai_instanceOfItem.object_index != objUpgradeMaterial or (argument_count != 1 and argument[1] == global.itemUpgrade[i, j]))) {
	                global.itemCount[i, j]++
                
				#region END TRUE
					quest_item_check(ai_instanceOfItem)
				
	                itembag_refresh()
	                instance_destroy(ai_instanceOfItem)
					save_bag(global.saveNo)
					global.anticheat_ownings = recalculate_sha_ownings()
	                return true
				#endregion
	            }
	        }
        
		#region END OF PAGE
			if (j+1 == global.bagBoxCount_vertical) {
				if (!startFromPage) {
				    if (!reverseAdd and currentPage < global.bagMaxPage or reverseAdd and currentPage != 2) {
						if (reverseAdd) {
							if (currentPage == 3)
								currentPage = 1
							else
								currentPage = 2
						}
						else
							currentPage += 1
				        j = -1
				    }
				    else {
						var bankTry = false
						if (argument_count < 7 or !argument[6]) {
							if (argument_count == 1)
								bankTry = add_item_bank(argument[0])
							else if (argument_count == 2)
								bankTry = add_item_bank(argument[0], argument[1])
							else if (argument_count == 3)
								bankTry = add_item_bank(argument[0], argument[1], argument[2])
							else if (argument_count == 4)
								bankTry = add_item_bank(argument[0], argument[1], argument[2], argument[3])
							else if (argument_count == 5)
								bankTry = add_item_bank(argument[0], argument[1], argument[2], argument[3], argument[4])
							else
								bankTry = add_item_bank(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5])
						}
				
						if (bankTry) {
							show_messagebox(50, 50, string(ai_instanceOfItem.name)+(eng() ? " is added to the bank." : " bankaya eklendi."), eng() ? "Addition to the Bank" : "Bankaya Eklendi")
					
						#region END TRUE (BANK)
							instance_destroy(ai_instanceOfItem)
							global.anticheat_ownings = recalculate_sha_ownings()
							return true
						#endregion
						}
						else {
							show_messagebox(50, 50, eng() ? "Item could not be added." : "Eşya eklenemedi.", eng() ? "Error!" : "İşlem Gerçekleştirilemedi")
            
						#region END FALSE
					        itembag_refresh()
					        instance_destroy(ai_instanceOfItem)
							save_bag(global.saveNo)
							global.anticheat_ownings = recalculate_sha_ownings()
					        return false
						#endregion
						}
				    }
				}
				else {
					startFromPage = false
					currentPage = 1
					j = -1
				}
			}

		#endregion
	    }
	}
	else {    
	    global.item[argument[4], argument[5]] = argument[0]
                
	    global.itemUpgrade[argument[4], argument[5]] = argument[1]
    
		global.itemExtension0[argument[4], argument[5]] = ai_instanceOfItem.extension[0]
	    global.itemExtension1[argument[4], argument[5]] = ai_instanceOfItem.extension[1]
	
		if (argument[2] != -1)
			global.itemExtension0[argument[4], argument[5]] = argument[2] != 0 ? argument[2] : -1			
		if (argument[3] != -1)
			global.itemExtension1[argument[4], argument[5]] = argument[3] != 0 ? argument[3] : -1
    
	    global.itemType[argument[4], argument[5]] = ai_instanceOfItem.type
	    global.itemCount[argument[4], argument[5]] = 1

	#region END TRUE
		quest_item_check(ai_instanceOfItem)
	
	    itembag_refresh()
	    instance_destroy(ai_instanceOfItem)
		save_bag(global.saveNo)
		global.anticheat_ownings = recalculate_sha_ownings()
	    return true
	#endregion
	}



}
