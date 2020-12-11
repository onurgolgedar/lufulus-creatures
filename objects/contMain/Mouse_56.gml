if (global.pause)
	global.itemSelected = -1

if (global.itemSelected != -1) {
    toWhere = pointer_null
    mouseOnBox_i = -1
    mouseOnBox_j = -1
	mouseOnSkillBox = -1
    
	#region Clicked toWhere
    with (objItemBag) {
        event_perform(ev_other, ev_user1)
        event_perform(ev_other, ev_user2)
        if (mouseOnBody and (other.toWhere == pointer_null or front)) {
            other.toWhere = window_items
            if (mouseOnBox) {
                other.mouseOnBox_i = mouseOnBox_i
                other.mouseOnBox_j = mouseOnBox_j
            }
        }
    }
		
    with (objBankWindow) {
        event_perform(ev_other, ev_user1)
        event_perform(ev_other, ev_user2)
        if (mouseOnBody and (other.toWhere == pointer_null or front)) {
            other.toWhere = window_bank
            if (mouseOnBox) {
                other.mouseOnBox_i = mouseOnBox_i
                other.mouseOnBox_j = mouseOnBox_j
            }
        }
    }
        
    with (objTradeWindow) {
        event_perform(ev_other, ev_user1)
        event_perform(ev_other, ev_user2)
        if (mouseOnBody and (other.toWhere == pointer_null or front)) {
            other.toWhere = loot ? "Loot" : window_trade
            if (mouseOnBox) {
                other.mouseOnBox_i = mouseOnBox_i
                other.mouseOnBox_j = mouseOnBox_j
            }
        }
    }
		
    with (objEquipmentBag) {
        event_perform(ev_other, ev_user1)
        event_perform(ev_other, ev_user2)
        if (mouseOnBody and (other.toWhere == pointer_null or front)) {
            other.toWhere = window_actives
            if (mouseOnBox) {
                other.mouseOnBox_i = mouseOnBox_i
                other.mouseOnBox_j = mouseOnBox_j
            }
        }
    }
		
	if (toWhere == pointer_null) {
		with (parNPC) {
			if (!test_upperclick_window() and
			!collision_line(x, y, objPlayer.x, objPlayer.y, parSolid, 1, 1) and
			point_distance(mouse_x, mouse_y, x, y) < 37) {
				if (point_distance(x, y, objPlayer.x, objPlayer.y) < NPC_CLICKDISTANCE)
					other.toWhere = id
				else {
					instance_create_layer(x, y, "lyBelowGUI", objNPCDistanceCircle)
					show_messagebox(250, 250, eng() ? "You must be near and there\nmust be no obstacles between you." : "Yakınında olmalısın.\nAranızda engel olmamalı.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", 1.5*sec)
				}
			}
		}
	}
	
	if (toWhere == pointer_null) {
		with (objPlayer) {
			if (!test_upperclick_window() and point_distance(mouse_x, mouse_y, x, y) < 37)
				other.toWhere = id
		}
	}
		
	for (var i = 0; i < 4; i ++) {
		if (contGUI.mouseOnSkillBox[i]) {
			mouseOnSkillBox = i
			toWhere = "Skill Boxes"
			break
		}
		else if (i == 3 and contGUI.mouseOnSkillBar)
			toWhere = "Skill Bar"
	}
	#endregion

    if (global.itemSelected.from == window_items) {
        if (toWhere == window_items) {
			if (instance_exists(objItemBag) and (objItemBag.mouseOnPageButton1 or objItemBag.mouseOnPageButton2 or objItemBag.mouseOnPageButton3)) {
				var added = false
				if (!objItemBag.mouseOnPageButton3) {
					var wantedPage = objItemBag.mouseOnPageButton1 ? 1 : 2
					
					for (var j = 0; j < global.bagBoxCount_vertical; j++) {
						for (var i = global.bagBoxCount_horizontal*(wantedPage-1); i < global.bagBoxCount_horizontal*wantedPage; i++) {
							if (global.item[i, j] == -1) {
								item_move(global.itemSelected.i, global.itemSelected.j, i, j)
								added = true
								break
							}
						}
					
						if (added)
							break
					}
				
					if (!added)
						show_messagebox(230, 230, eng() ? "This page is full." : "Bu sayfa tamamen dolu.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec*1.5)
				}
				else
					show_messagebox(230, 230, eng() ? "You cannot move items to \"Loot\" page." : "Eşyalarınızı \"Ganimet\" sayfasına taşıyamazsınız.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec*1.5)
			
				with (objItemBag) {
					if (page != beforePage) {
						audio_play_sound(sndWindowTick, 10, false)
						page = beforePage
					}
				}
			}
			else if (mouseOnBox_i != -1) {
	            with (objItemBag) {
					if (mouseOnBox_i < (global.bagMaxPage-1)*global.bagBoxCount_horizontal or global.itemSelected.i >= (global.bagMaxPage-1)*global.bagBoxCount_horizontal) {
						if ((mouseOnBox_i div global.bagBoxCount_horizontal) == (global.itemSelected.i div global.bagBoxCount_horizontal)
						or item[mouseOnBox_i, mouseOnBox_j] == -1
						or (mouseOnBox_i < (global.bagMaxPage-1)*global.bagBoxCount_horizontal and global.itemSelected.i < (global.bagMaxPage-1)*global.bagBoxCount_horizontal))
							item_move(global.itemSelected.i, global.itemSelected.j, mouseOnBox_i, mouseOnBox_j)
						else
							show_messagebox(230, 230, eng() ? "These items cannot switch their positions\nbecause one of them is from \"Loot\" page." : "Bu eşyalar yerlerini birbirleriyle değiştiremezler\nçünkü eşyalardan biri \"Ganimet\" sayfasında.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec*1.5)
					}
					else
						show_messagebox(230, 230, eng() ? "You cannot move items to \"Loot\" page." : "Eşyalarınızı \"Ganimet\" sayfasına taşıyamazsınız.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec*1.5)
						
					beforePage = page
	            }
				
				with (objTradeWindow)
					localbag_refresh()
				bankwindow_refresh()
			}
			
			global.anticheat_ownings = recalculate_sha_ownings()
        }
        else if (toWhere == window_trade) {
            if (!is_active(global.itemSelected.i, global.itemSelected.j) and global.itemSelected.isDeletable) {
                change_money(calculate_selling(global.itemSelected.cWorth), true)
                
                if (global.itemSelected.isCollectable)
                    decrease_collectable_item(global.itemSelected.object_index, 1, global.itemSelected.upgrade)
                else
                    delete_item(global.itemSelected.i, global.itemSelected.j)
					
				with (objTradeWindow)
					localbag_refresh()
				bankwindow_refresh()
            }
			else {
				if (!global.itemSelected.isDeletable)
					show_messagebox(700, 90, eng() ? "This item is permanent." : "Bu eşya kalıcıdır.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
				else
					show_messagebox(700, 90, eng() ? "You are using this." : "Bu eşyayı kullanıyorsun.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
			}
        }
	    else if (toWhere == "Skill Boxes") {
			show_messagebox(contGUI.sLogoX-450, display_get_gui_height()-220,
							eng() ? "These boxes can only be used for skills." : "Bu bölge sadece yetenek kullanımı içindir.",
							eng() ? "Not Appropriate" : "Uygun Değil", sec*3)
		}
		else if (toWhere == window_bank) {
			var emptyBoxExists_bank = empty_box_exists_bank()
            if (emptyBoxExists_bank and global.debt == 0 and !is_active(global.itemSelected.i, global.itemSelected.j) and global.itemSelected.isDeletable) {
				var success = false
				
				if (instance_exists(objBankWindow) and (objBankWindow.mouseOnPageButton1 or objBankWindow.mouseOnPageButton2 or objBankWindow.mouseOnPageButton3)) {
					var wantedPage = objBankWindow.mouseOnPageButton1 ? 1 : (objBankWindow.mouseOnPageButton2 ? 2 : 3)
					
					for (var j = 0; j < global.bagBoxCount_vertical; j++) {
						for (var i = global.bagBoxCount_horizontal*(wantedPage-1); i < global.bagBoxCount_horizontal*wantedPage; i++) {
							if (global.item_bank[i, j] == -1) {
								success = add_item_bank(global.itemSelected.object_index, global.itemSelected.upgrade,
						        global.itemSelected.owner.item[global.itemSelected.i, global.itemSelected.j].extension[0],
						        global.itemSelected.owner.item[global.itemSelected.i, global.itemSelected.j].extension[1],
						        i,
						        j)
								
								break
							}
						}
					
						if (success)
							break
					}
				
					if (!success)
						show_messagebox(230, 230, eng() ? "This page is full." : "Bu sayfa tamamen dolu.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec*1.5)
				}
				else {
					if (mouseOnBox_i != -1 and global.item_bank[mouseOnBox_i, mouseOnBox_j] == -1)
			            success = add_item_bank(global.itemSelected.object_index, global.itemSelected.upgrade,
			            global.itemSelected.owner.item[global.itemSelected.i, global.itemSelected.j].extension[0],
			            global.itemSelected.owner.item[global.itemSelected.i, global.itemSelected.j].extension[1],
			            mouseOnBox_i,
			            mouseOnBox_j)
			        else
			            success = add_item_bank(global.itemSelected.object_index, global.itemSelected.upgrade,
			            global.itemSelected.owner.item[global.itemSelected.i, global.itemSelected.j].extension[0],
			            global.itemSelected.owner.item[global.itemSelected.i, global.itemSelected.j].extension[1])
				}
			
				if (success) {
					audio_play_sound(sndItemAdded, false, false)
					
	                if (global.itemSelected.isCollectable)
						decrease_collectable_item(global.itemSelected.object_index, 1, global.itemSelected.upgrade)
					else
						delete_item(global.itemSelected.i, global.itemSelected.j)
				}
            }
			else if (!emptyBoxExists_bank)
				show_messagebox(200, 200, eng() ? "At least, one empty slot is needed." : "Bankada boş alan yok.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
			else {
				if (!global.itemSelected.isDeletable)
					show_messagebox(700, 90, eng() ? "This item is permanent." : "Bu eşya kalıcıdır.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
				else if (global.debt != 0)
					show_messagebox(400, 400, eng() ? "You need to pay your debt." : "Borcunu ödemelisin.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec*2)
				else
					show_messagebox(700, 90, eng() ? "You are using this." : "Bu eşyayı kullanıyorsun.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
			}
		}
		else if (toWhere == window_actives)
			event_user(5)
		else if (toWhere != pointer_null and !is_string(toWhere) and instance_exists(toWhere)) {
			if (toWhere.object_index == objAdam_npc) {
	            if (!is_active(global.itemSelected.i, global.itemSelected.j) and global.itemSelected.isDeletable) {
	                change_money(calculate_selling(global.itemSelected.cWorth), true)
                
	                if (global.itemSelected.isCollectable)
	                    decrease_collectable_item(global.itemSelected.object_index, 1, global.itemSelected.upgrade)
	                else
	                    delete_item(global.itemSelected.i, global.itemSelected.j)
					
					with (objTradeWindow)
						localbag_refresh()
					bankwindow_refresh()
	            }
				else {
					if (!global.itemSelected.isDeletable)
						show_messagebox(700, 90, eng() ? "This item is permanent." : "Bu eşya kalıcıdır.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
					else
						show_messagebox(700, 90, eng() ? "You are using this." : "Bu eşyayı kullanıyorsun.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
				}
			}
			else if (toWhere.object_index == objPlayer)
				event_user(5)
			else if (toWhere.object_index == objUpgrader_npc) {
					if (is_item_upgradabletype(global.itemSelected)) {
					with (toWhere)
						event_perform(ev_other, ev_user1)
				
					with (objTradeWindow)
						localbag_refresh()
					bankwindow_refresh()
				}
			}
		}
	}
	else if (global.itemSelected.from == window_actives) {
		if (toWhere == window_items) {
			if (instance_exists(objItemBag) and (objItemBag.mouseOnPageButton1 or objItemBag.mouseOnPageButton2 or objItemBag.mouseOnPageButton3)) {
				if (!objItemBag.mouseOnPageButton3) {
					var itemI = get_active_item_ij(global.itemSelected.type, 0)
					var itemJ = get_active_item_ij(global.itemSelected.type, 1)
					var itemType = global.itemSelected.type
					var done = false
					var wantedPage = objItemBag.mouseOnPageButton1 ? 1 : 2
				
					var added = false
					for (var j = 0; j < global.bagBoxCount_vertical; j++) {
						for (var i = global.bagBoxCount_horizontal*(wantedPage-1); i < global.bagBoxCount_horizontal*wantedPage; i++) {
							if (global.item[i, j] == -1) {
								item_move(itemI, itemJ, i, j)
								added = true
								break
							}
						}
					
						if (added)
							break
					}
				
					if (!added)
						show_messagebox(230, 230, eng() ? "This page is full." : "Bu sayfa tamamen dolu.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec*1.5)
					else {
						deactive_item(itemType)
			
						with (objTradeWindow)
							localbag_refresh()
						bankwindow_refresh()

						itembag_refresh()
					}
				}
				else
					show_messagebox(230, 230, eng() ? "You cannot move items to \"Loot\" page." : "Eşyalarınızı \"Ganimet\" sayfasına taşıyamazsınız.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec*1.5)
			}
			else if (empty_box_exists()) {
				var itemI = get_active_item_ij(global.itemSelected.type, 0)
				var itemJ = get_active_item_ij(global.itemSelected.type, 1)
				var itemType = global.itemSelected.type
				var done = false
				
				if (mouseOnBox_i != -1 and global.item[mouseOnBox_i, mouseOnBox_j] == -1) {
					if (mouseOnBox_i < (global.bagMaxPage-1)*global.bagBoxCount_horizontal or global.itemSelected.i >= (global.bagMaxPage-1)*global.bagBoxCount_horizontal) {
						global.itemSelected = objItemBag.item[itemI, itemJ]
						global.itemSelected.from = window_items
			
						event_perform(ev_mouse, ev_global_left_release)
						
						done = true
					}
					else
						show_messagebox(230, 230, eng() ? "You cannot move items to \"Loot\" page." : "Eşyalarınızı \"Ganimet\" sayfasına taşıyamazsınız.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec*1.5)
				}
				else if (mouseOnBox_i == -1) {
					var currentPage = 1
				    for (var j = 0; j < global.bagBoxCount_vertical; j++) {
				        for (var i = global.bagBoxCount_horizontal*(currentPage-1); i < global.bagBoxCount_horizontal*currentPage; i++) {
							if (global.item[i, j] == -1) {
								item_move(itemI, itemJ, i, j)
								i = 999
								j = 999
								done = true
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
				}
			
				if (done) {
					deactive_item(itemType)
			
					with (objTradeWindow)
						localbag_refresh()
					bankwindow_refresh()

					itembag_refresh()
					
					with (objItemBag)
						beforePage = page
				}
			}
			else
				show_messagebox(200, 200, eng() ? "At least, one empty slot is needed." : "Çantada boş alan yok.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
		}
		else if (toWhere != pointer_null and !is_string(toWhere) and instance_exists(toWhere) and toWhere.object_index == objUpgrader_npc) {
			if (is_item_upgradabletype(global.itemSelected)) {
				with (toWhere)
					event_perform(ev_other, ev_user1)
				
				with (objTradeWindow)
					localbag_refresh()
				bankwindow_refresh()
			}
		}
		else if (toWhere != pointer_null and !is_string(toWhere) and instance_exists(toWhere) and toWhere.object_index == objAdam_npc) {
			show_messagebox(700, 90, eng() ? "You are using this." : "Bu eşyayı kullanıyorsun.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
		}
	}
    else if (global.itemSelected.from == window_trade) {
        if (toWhere == window_items) {
			with (objTradeWindow) {
				if (!loot) {
					directRun = true
					event_perform(ev_mouse, ev_global_right_press)
					directRun = false
				}
			}
        }
    }
    else if (global.itemSelected.from == "Loot") {
        if (toWhere == window_items) {
			with (objTradeWindow) {
				if (loot) {
					directRun = true
					event_perform(ev_mouse, ev_global_right_press)
					directRun = false
				}
			}
        }
    }
	else if (global.itemSelected.from == window_bank) {
		if (toWhere == window_bank) {
			if (instance_exists(objBankWindow) and (objBankWindow.mouseOnPageButton1 or objBankWindow.mouseOnPageButton2 or objBankWindow.mouseOnPageButton3)) {
				var wantedPage = objBankWindow.mouseOnPageButton1 ? 1 : (objBankWindow.mouseOnPageButton2 ? 2 : 3)
				var success = false
					
				for (var j = 0; j < global.bagBoxCount_vertical; j++) {
					for (var i = global.bagBoxCount_horizontal*(wantedPage-1); i < global.bagBoxCount_horizontal*wantedPage; i++) {
						if (global.item_bank[i, j] == -1) {
							item_move_bank(global.itemSelected.i, global.itemSelected.j, i, j)
							success = true
							break
						}
					}
					
					if (success)
						break
				}
				
				if (!success)
					show_messagebox(230, 230, eng() ? "This page is full." : "Bu sayfa tamamen dolu.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec*1.5)
						
				with (objBankWindow) {
					if (page != beforePage) {
						audio_play_sound(sndWindowTick, 10, false)
						page = beforePage
					}
				}
			}
			else if (mouseOnBox_i != -1) {
				item_move_bank(global.itemSelected.i, global.itemSelected.j, mouseOnBox_i, mouseOnBox_j)
				
				with (objBankWindow)
					beforePage = page

				itembag_refresh()
				with (objTradeWindow)
					localbag_refresh()
			}
		}
		else if (toWhere == window_items) {
			if (global.debt == 0) {
				var success = false
				if (instance_exists(objItemBag) and (objItemBag.mouseOnPageButton1 or objItemBag.mouseOnPageButton2 or objItemBag.mouseOnPageButton3)) {
					if (!objItemBag.mouseOnPageButton3) {
						var wantedPage = objItemBag.mouseOnPageButton1 ? 1 : 2
					
						for (var j = 0; j < global.bagBoxCount_vertical; j++) {
							for (var i = global.bagBoxCount_horizontal*(wantedPage-1); i < global.bagBoxCount_horizontal*wantedPage; i++) {
								if (global.item[i, j] == -1) {
									success = add_item(global.itemSelected.object_index, global.itemSelected.upgrade,
								    global.itemSelected.owner.item[global.itemSelected.i, global.itemSelected.j].extension[0],
								    global.itemSelected.owner.item[global.itemSelected.i, global.itemSelected.j].extension[1],
								    i,
								    j, true)
								
									break
								}
							}
					
							if (success)
								break
						}
				
						if (!success)
							show_messagebox(230, 230, eng() ? "This page is full." : "Bu sayfa tamamen dolu.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec*1.5)
					}
					else
						show_messagebox(230, 230, eng() ? "You cannot move items to \"Loot\" page." : "Eşyalarınızı \"Ganimet\" sayfasına taşıyamazsınız.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec*1.5)
				}
				else {
					if (mouseOnBox_i != -1 and global.item[mouseOnBox_i, mouseOnBox_j] == -1)
					    success = add_item(global.itemSelected.object_index, global.itemSelected.upgrade,
					    global.itemSelected.owner.item[global.itemSelected.i, global.itemSelected.j].extension[0],
					    global.itemSelected.owner.item[global.itemSelected.i, global.itemSelected.j].extension[1],
					    mouseOnBox_i,
					    mouseOnBox_j, true)
					else
					    success = add_item(global.itemSelected.object_index, global.itemSelected.upgrade,
					    global.itemSelected.owner.item[global.itemSelected.i, global.itemSelected.j].extension[0],
					    global.itemSelected.owner.item[global.itemSelected.i, global.itemSelected.j].extension[1],
						-1,
						-1, true)
				}
			
				if (success) {
					audio_play_sound(sndItemAdded, false, false)
				
			        if (global.itemSelected.isCollectable)
			            increase_collectable_item(global.itemSelected.object_index, global.itemSelected.count-1, global.itemSelected.upgrade)
				
			        delete_item_bank(global.itemSelected.i, global.itemSelected.j)
				}
			}
			else
				show_messagebox(400, 400, eng() ? "You need to pay your debt." : "Borcunu ödemelisin.", eng() ? "Cannot be taken." : "Alınamaz.", sec*2)
		}
	}
	else if (global.itemSelected.from == window_skills) {
	    if (toWhere == "Skill Boxes") {
			with (contGUI) {
				for (var i = 0; i < 4; i++) {
					if (global.selectedSkill[i] == global.itemSelected.object_index) {
						skillSprite[i] = -1
						global.selectedSkillMaxRem[i] = -1
						global.selectedSkillRem[i] = -1
						global.selectedSkillMana[i] = -1
						global.selectedSkill[i] = -1
						tbT[i] = pointer_null
						tbW[i] = -1
						tbH[i] = -1
					}
				}
			}
			
			global.selectedSkill[mouseOnSkillBox] = global.itemSelected.object_index
			with (contGUI) event_perform(ev_other, ev_user0)
			save_skills(global.saveNo)
		}
	}
	else if (global.itemSelected.from == "Skill Boxes") {
	    if (toWhere == "Skill Boxes") {
			var tempSkill = -1
			var tempPos = global.itemSelected.i
			var tempRem = global.selectedSkillRem[global.itemSelected.i]
			var tempRem2 = -1
			
			
			if (global.selectedSkill[mouseOnSkillBox] != -1) {
				tempSkill = global.selectedSkill[mouseOnSkillBox]
				tempRem2 = global.selectedSkillRem[mouseOnSkillBox]
			}
			
			global.selectedSkill[mouseOnSkillBox] = global.itemSelected.object_index
			
			with (contGUI) {
				skillSprite[global.itemSelected.i] = -1
				global.selectedSkillMaxRem[global.itemSelected.i] = -1
				global.selectedSkillRem[global.itemSelected.i] = -1
				global.selectedSkillMana[global.itemSelected.i] = -1
				global.selectedSkill[global.itemSelected.i] = -1
				tbT[global.itemSelected.i] = pointer_null
				tbW[global.itemSelected.i] = -1
				tbH[global.itemSelected.i] = -1
				
				event_perform(ev_other, ev_user0)
			}
			
			if (tempSkill != -1) {
				global.selectedSkill[tempPos] = tempSkill
				with (contGUI) event_perform(ev_other, ev_user0)
			}
			
			global.selectedSkillRem[mouseOnSkillBox] = tempRem
			global.selectedSkillRem[tempPos] = tempRem2
			
			save_skills(global.saveNo)
		}
		else if (toWhere == pointer_null) {
			if (!IS_MOBILE or device_mouse_y_to_gui(0) < display_get_gui_height()-80) {
				with (contGUI) {
					skillSprite[global.itemSelected.i] = -1
					global.selectedSkillMaxRem[global.itemSelected.i] = -1
					global.selectedSkillRem[global.itemSelected.i] = -1
					global.selectedSkillMana[global.itemSelected.i] = -1
					global.selectedSkill[global.itemSelected.i] = -1
					tbT[global.itemSelected.i] = pointer_null
					tbW[global.itemSelected.i] = -1
					tbH[global.itemSelected.i] = -1
				
					event_perform(ev_other, ev_user0)
				}
			
				save_skills(global.saveNo)
			}
		}
	}
	
	if (global.itemSelected != -1 and instance_exists(global.itemSelected)) {
		if (global.itemSelected.from == window_items) {
			with (objItemBag)
				page = beforePage
		}
		else if (global.itemSelected.from == window_bank) {
			with (objBankWindow)
				page = beforePage
		}
	
		if (global.itemSelected.from == "Skill Boxes")
			instance_destroy(global.itemSelected)
	}
}

global.itemSelected = -1

with (objMainMenuDraw) {
	if (mouseHoldOn_triangle != -1) {
		mouseHoldOn_triangle = -1
		save_options()
	}
}
if (mouseHoldOn_triangle != -1) {
	mouseHoldOn_triangle = -1
	save_options()
}