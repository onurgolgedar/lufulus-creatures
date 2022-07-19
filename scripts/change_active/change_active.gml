/// @param type
/// @param i
/// @param j
/// @param willItemBeChanged*
/// @param noSound*
function change_active() {

	var itemChanges = true
	if (argument_count > 3 and argument[3] == 0)
	    itemChanges = false
	
	var activeItem_i = get_active_item_ij(argument[0], 0)
	var activeItem_j = get_active_item_ij(argument[0], 1)
	var isDeactivation = argument[1] == -1 or argument[2] == -1

	if (activeItem_i != -1 and global.itemType[activeItem_i, activeItem_j] == argument[0])
		global.itemActive[activeItem_i, activeItem_j] = false

	if (!isDeactivation)
		global.itemActive[argument[1], argument[2]] = true
	else if (itemChanges and argument[0] == type_sweapon)
			global.secondaryActive = false

	if (argument[0] == type_mweapon) {
	    global.weaponI = argument[1]
	    global.weaponJ = argument[2]
    
	    if (itemChanges) {
			if (instance_exists(objPlayer)) {
		        destroy_of_owner(objMWeaponControl, objPlayer.id)
		        destroy_of_owner(objCrossbowControl, objPlayer.id)
				destroy_of_owner(objBowControl, objPlayer.id)
				destroy_of_owner(objShieldControl, objPlayer.id)
			}
    
	        if (isDeactivation) {        
	            global.weaponSprite = sprNothingness
	            global.weaponType = pointer_null
				global.weaponSlow = 0
	        }
	        else {
				var weapon = instance_create(0, 0, global.item[global.weaponI, global.weaponJ])
			
	            global.weaponSprite = weapon.sprite_index
	            global.weaponType = weapon.weaponType
				if (weapon.weaponType == wtype_shield)
					global.weaponSlow = weapon.slow
				else
					global.weaponSlow = 0
			
			#region AUTO WEAR
				if (global.weaponType != wtype_shield or !has_active_sweapon())
					with (contPlayer) {
						changeWeaponChoiceTo = 1
						event_perform(ev_keyrelease, ord("Q"))
					}
				else
					with (contPlayer) {
						changeWeaponChoiceTo = 2
						event_perform(ev_keyrelease, ord("Q"))
					}
			#endregion
				
				instance_destroy(weapon)
	        }
	    }
	}
	else if (argument[0] == type_necklace) {
	    global.necklaceI = argument[1]
	    global.necklaceJ = argument[2]
	}
	else if (argument[0] == type_medallion) {
	    global.medallionI = argument[1]
	    global.medallionJ = argument[2]
	
		if (global.medallionI != -1)
			quest_progress(objQuest_runes_prep, 1)
	}
	else if (argument[0] == type_clothes) {	
	    global.clothesI = argument[1]
	    global.clothesJ = argument[2]
	
		if (isDeactivation) {
			global.clothesArm = sprArm
			global.clothesFrontArm = sprFrontArm
			global.clothesSlow = 0
		
			with (objPlayer) {
				leftArm[0].sprite_index = global.clothesArm
				rightArm[0].sprite_index = global.clothesArm
			
				leftArm[1].sprite_index = global.clothesFrontArm
				rightArm[1].sprite_index = global.clothesFrontArm
			}
		}
	
		if (global.clothesI != -1) {
			var clothes = instance_create(0, 0, global.item[global.clothesI, global.clothesJ])
			global.clothesArm = clothes.clothesArm
			global.clothesFrontArm = clothes.clothesFrontArm
			global.clothesSlow = clothes.slow
		
			if (clothes.object_index != objClot_001)
				quest_progress(objQuest_item, 1)
	
		#region AUTO-WEAR
			with (objPlayer) {
				shoulders.sprite_index = clothes.sprite_index
			
				leftArm[0].sprite_index = global.clothesArm
				rightArm[0].sprite_index = global.clothesArm
			
				leftArm[1].sprite_index = global.clothesFrontArm
				rightArm[1].sprite_index = global.clothesFrontArm
			}
		
			instance_destroy(clothes)
		#endregion
		}
		else {
			with (objPlayer) {
				shoulders.sprite_index = sprShoulders
			}
		}
	}
	else if (argument[0] == type_sweapon) {
	    global.sWeaponI = argument[1]
	    global.sWeaponJ = argument[2]
    
	    if (itemChanges) {
			if (instance_exists(objPlayer))
				destroy_of_owner(objSWeaponControl, objPlayer.id)
	
	        if (isDeactivation) {		
	            global.sWeaponSprite = sprNothingness
	            global.sWeaponType = pointer_null
	        }
	        else {
	            var sWeapon = instance_create(0, 0, global.item[global.sWeaponI, global.sWeaponJ])
				global.sWeaponType = sWeapon.weaponType
	            global.sWeaponSprite = sWeapon.sprite_index
	            instance_destroy(sWeapon)
            
			#region AUTO-WEAR
				if (global.sWeaponType == wtype_ohsword) {
			        if (true/*!has_player_weaponcontrol(objMWeaponControl) and !has_player_weaponcontrol(objCrossbowControl) and !has_player_weaponcontrol(objBowControl)*/) {
						with (contPlayer) {
							changeWeaponChoiceTo = 2
							event_perform(ev_keyrelease, ord("Q"))
						}
			        }
		        }
			#endregion
	        }
	    }
	}

	var itemJ_offset = global.bagBoxCount_vertical
	
	var oldActive_j = -1
	if (argument[0] == type_sweapon)
		oldActive_j = itemJ_offset+0
	else if (argument[0] == type_mweapon)
		oldActive_j = itemJ_offset+1
	else if (argument[0] == type_necklace)
		oldActive_j = itemJ_offset+2
	else if (argument[0] == type_medallion)
		oldActive_j = itemJ_offset+3
	else if (argument[0] == type_clothes)
		oldActive_j = itemJ_offset+4

	if (!isDeactivation and itemChanges) {                
		if (oldActive_j != -1) {
			if (argument[1] < (global.bagMaxPage-1)*global.bagBoxCount_horizontal)
				item_move(0, oldActive_j, argument[1], argument[2])
			else {
				var currentPage = 1
				for (var j = 0; j < global.bagBoxCount_vertical; j++) {
					for (var i = global.bagBoxCount_horizontal*(currentPage-1); i < global.bagBoxCount_horizontal*currentPage; i++) {
				        if (global.item[i, j] == -1) {
							item_move(0, oldActive_j, i, j)
						
							/*with (objitemBag) {
								page = currentPage
								beforePage = currentPage
							}*/
						
							i = 999
							j = 999
						}
					}
				
					if (j+1 == global.bagBoxCount_vertical) {
						if (currentPage < global.bagMaxPage) {
							currentPage++
							j = -1
						}
						else
							break
					}
				}
					
				if (i != 999)
					item_move(0, oldActive_j, argument[1], argument[2])
			}
		
			with (objTradeWindow)
				localbag_refresh()
			
			bankwindow_refresh()

			itembag_refresh()
		}
	}

	if (itemChanges) {
	#region FMs
		if (room == roomRoad)
			fm_update_activation(0)
	#endregion
	
	    update_character()
	
		if (argument[0] == type_clothes)
			global.clothesStyle = 0.0
		
		if (argument_count != 5 or argument[4] == false)
			audio_play_sound(sndWindowTick, 1, false)
		
		with (objTradeWindow)
			compareitems_refresh()
		
		with (objitemBag)
			compareitems_refresh()
		
		with (objBankWindow)
			compareitems_refresh()
		
		with (objEquipmentBag)
			localbag_refresh()
	
		with (objPlayer)
			attacktimer_set_max()
		
		with (paritem)
			isTextUpdated = false
		
		global.classicItem_count = 0
		for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
		    for (var j = 0; j < global.bagBoxCount_vertical; j++) {
				if (global.itemUpgrade[i, j] == unique_number)
					global.classicItem_count++
		    }
		}
	}

	item_shining_refresh()

	save_bag(global.saveNo)


}
