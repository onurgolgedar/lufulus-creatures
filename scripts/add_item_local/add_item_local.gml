/// @param item
/// @param upgrade*
/// @param ext0*
/// @param ext1*
/// @param i*
/// @param j*
function add_item_local() {
	var currentPage = 1
	var ai_instanceOfItem = instance_create(0, 0, argument[0])
	var noSame = !item_exists_local(argument[0])

	if (argument_count != 6 or (ai_instanceOfItem.isCollectable and !noSame))
	    for (var j = 0; j < global.tradeBoxCount_vertical; j++) {
	        for (var i = global.tradeBoxCount_horizontal*(currentPage-1); i < global.tradeBoxCount_horizontal*currentPage; i++) {
	            if (!ai_instanceOfItem.isCollectable or noSame) {
	                if (item[i, j] == -1) {
	                    item[i, j] = argument[0]
                    
	                    if (argument_count >= 2 and ai_instanceOfItem.upgrade != unique_number)
	                        itemUpgrade[i, j] = argument[1]
	                    else
	                        itemUpgrade[i, j] = ai_instanceOfItem.upgrade
					
						itemExtension0[i, j] = ai_instanceOfItem.extension[0]
	                    itemExtension1[i, j] = ai_instanceOfItem.extension[1]
					
						// ?
					#region OVERWRITTEN EXTENSIONS
	                    if (argument_count > 3) {
							if (argument[2] != -1)
								itemExtension0[i, j] = argument[2] != 0 ? argument[2] : -1
							
							if (argument[3] != -1)
								itemExtension1[i, j] = argument[3] != 0 ? argument[3] : -1
	                    }
					#endregion
                    
	                    itemType[i, j] = ai_instanceOfItem.type
	                    itemCount[i, j] = 1
	                    j = global.tradeBoxCount_vertical
	                    currentPage = global.tradeMaxPage
                    
					#region END TRUE
	                    //localbag_refresh()
	                    instance_destroy(ai_instanceOfItem)
	                    return true
					#endregion
	                }
	            }
	            else if (item[i, j] == ai_instanceOfItem.object_index
				and (ai_instanceOfItem.object_index != objUpgradeMaterial or (argument_count != 1 and argument[1] == itemUpgrade[i, j]))) {
	                itemCount[i, j]++
                
				#region END TRUE
	                //localbag_refresh()
	                instance_destroy(ai_instanceOfItem)
	                return true
				#endregion
	            }
	        }
        
		#region END OF PAGE
	        if (j+1 == global.tradeBoxCount_vertical and currentPage < global.tradeMaxPage) {
	            currentPage += 1
	            j = -1
	        }
	        else if (j+1 == global.tradeBoxCount_vertical) {
	            show_messagebox(50, 50, eng() ? "Item could not be added." : "Eşya eklenemedi.", eng() ? "Error!" : "İşlem Gerçekleştirilemedi")
            
			#region END FALSE
	            //localbag_refresh()
	            instance_destroy(ai_instanceOfItem)
	            return false
			#endregion
	        }
		#endregion
	    }
	else
	{    
	    item[argument[4], argument[5]] = argument[0]
                
	    if (argument_count == 2)
	        itemUpgrade[argument[4], argument[5]] = argument[1]
	    else
	        itemUpgrade[argument[4], argument[5]] = 0
    
		itemExtension0[argument[4], argument[5]] = ai_instanceOfItem.extension[0]
	    itemExtension1[argument[4], argument[5]] = ai_instanceOfItem.extension[1]
		if (argument[2] != -1)
			itemExtension0[argument[4], argument[5]] = argument[2] != 0 ? argument[2] : -1
		if (argument[3] != -1)
			itemExtension1[argument[4], argument[5]] = argument[3] != 0 ? argument[3] : -1
	
	    itemType[argument[4], argument[5]] = ai_instanceOfItem.type
	    itemCount[argument[4], argument[5]] = 1

	#region END TRUE
	    //localbag_refresh()
	    instance_destroy(ai_instanceOfItem)
	    return true
	#endregion
	}



}
