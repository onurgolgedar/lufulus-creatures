/// @param item
/// @param upgrade*
/// @param ext0*
/// @param ext1*
/// @param i*
/// @param j*
/// @param startFromPage*
function add_item_bank() {

	var currentPage = 1
	var ai_instanceOfItem = instance_create(0, 0, argument[0])
	var startFromPage = argument_count > 6 and argument[6] != false
	if (startFromPage)
		currentPage = argument[6]
	else if (argument_count <= 6 and instance_exists(objBankWindow)) {
		currentPage = objBankWindow.page
		startFromPage = true
	}

	if (argument_count < 6 or (argument[4] == -1 and argument[5] == -1)) {
	    for (var j = 0; j < global.bagBoxCount_vertical; j++) {
	        for (var i = global.bagBoxCount_horizontal*(currentPage-1); i < global.bagBoxCount_horizontal*currentPage; i++) {
	            if (global.item_bank[i, j] == -1) {
	                global.item_bank[i, j] = argument[0]
                    
	                if (argument_count >= 2 and ai_instanceOfItem.upgrade != unique_number)
	                    global.itemUpgrade_bank[i, j] = argument[1]
	                else
	                    global.itemUpgrade_bank[i, j] = ai_instanceOfItem.upgrade
						
					global.itemExtension0_bank[i, j] = ai_instanceOfItem.extension[0]
	                global.itemExtension1_bank[i, j] = ai_instanceOfItem.extension[1]
					
					global.itemRentTime_bank[i, j] = get_day()
                    
					// ?
				#region OVERWRITTEN EXTENSIONS
	                if (argument_count > 3) {
						if (argument[2] != -1)
							global.itemExtension0_bank[i, j] = argument[2] != 0 ? argument[2] : -1
							
						if (argument[3] != -1)
							global.itemExtension1_bank[i, j] = argument[3] != 0 ? argument[3] : -1
	                }
				#endregion
				
					
					with (objBankWindow) {
						page = currentPage
						beforePage = currentPage
					}
                    
	                global.itemType_bank[i, j] = ai_instanceOfItem.type
	                global.itemCount_bank[i, j] = 1
	                j = global.bagBoxCount_vertical
	                currentPage = global.bagMaxPage
                    
				#region END TRUE
	                bankwindow_refresh()
	                instance_destroy(ai_instanceOfItem)
					save_bank(global.saveNo)
					global.anticheat_ownings = recalculate_sha_ownings()
	                return true
				#endregion
	            }
	        }
        
		#region END OF PAGE
			if (j+1 == global.bagBoxCount_vertical) {
				if (!startFromPage) {
				    if (currentPage < global.bagMaxPage) {
				        currentPage += 1
				        j = -1
				    }
				    else {
				        show_messagebox(50, 50, eng() ? "Item could not be added." : "Eşya eklenemedi.", eng() ? "Error!" : "İşlem Gerçekleştirilemedi")
            
					#region END FALSE
				        bankwindow_refresh()
				        instance_destroy(ai_instanceOfItem)
						save_bank(global.saveNo)
						global.anticheat_ownings = recalculate_sha_ownings()
				        return false
					#endregion
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
	    global.item_bank[argument[4], argument[5]] = argument[0]
                
	    global.itemUpgrade_bank[argument[4], argument[5]] = argument[1]
    
		global.itemExtension0_bank[argument[4], argument[5]] = ai_instanceOfItem.extension[0]
	    global.itemExtension1_bank[argument[4], argument[5]] = ai_instanceOfItem.extension[1]
	
		global.itemRentTime_bank[argument[4], argument[5]] = get_day()
	
		if (argument[2] != -1)
			global.itemExtension0_bank[argument[4], argument[5]] = argument[2] != 0 ? argument[2] : -1			
		if (argument[3] != -1)
			global.itemExtension1_bank[argument[4], argument[5]] = argument[3] != 0 ? argument[3] : -1
    
	    global.itemType_bank[argument[4], argument[5]] = ai_instanceOfItem.type
	    global.itemCount_bank[argument[4], argument[5]] = 1

	#region END TRUE
	    bankwindow_refresh()
	    instance_destroy(ai_instanceOfItem)
		save_bank(global.saveNo)
		global.anticheat_ownings = recalculate_sha_ownings()
	    return true
	#endregion
	}



}
