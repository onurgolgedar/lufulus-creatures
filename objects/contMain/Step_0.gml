var gamepad = global.gamepad

if (!isRoomOut and !global.pause) {
	for (var i = 0; i < 5; i++) {
		if (global.selectedSkill[i] != -1) {
			var decrease = 1*(1+contPlayer.masterMage_extension*0.15+contPlayer.shiftCooldown_extension*objPlayer.shiftMode*2)*delta()
			
			if (global.selectedSkillRem[i]-decrease > 0)
				global.selectedSkillRem[i] -= decrease
			else if (global.selectedSkillRem[i]-decrease <= 0 and global.selectedSkillRem[i] != 0) {
				global.selectedSkillRem[i] = 0
				contGUI.selectedSkill_colortime[i] = sec/6
				audio_play_sound(sndReady_skill, 5, false)
			}
			
			if (contGUI.selectedSkill_colortime[i] > 0)
				contGUI.selectedSkill_colortime[i] -= 1
		}
	}

	if (((mouse_check_button_pressed(mb_left) or gamepad_leftpressed()) and !IS_MOBILE or global_tab_step and IS_MOBILE) and !test_upperclick_window()) {
		global_tab_step = false
		
		if (contGUI.mouseOnMLogo)
			event_perform(ev_keypress, ord("M"))
		else if (contGUI.mouseOnPauseLogo)
			event_perform(ev_keypress, ord("P"))
		else if (contGUI.mouseOnSLogo)
			event_perform(ev_keypress, ord("Y"))
		else if (contGUI.mouseOnQLogo)
			event_perform(ev_keypress, ord("J"))
		else if (contGUI.mouseOnBLogo)
			event_perform(ev_keypress, ord("I"))
		else if (contGUI.mouseOnCLogo)
			event_perform(ev_keypress, ord("C"))
		else if (contGUI.mouseOnSkillBox[4] and global.selectedSkill[4] == objMainBS) {
			if (is_room_out() or global.consoleMode)
				exit
	
			if (global.pause)
				exit

			if (instance_exists(objSkillTable_mbs)) {
				with (objSkillTable_mbs)
					if (temporaryWindow)
						temporaryWindow = false
					else
						close_table()
			}
			else {
				instance_create_layer(display_get_gui_width()/2+95, display_get_gui_height()-430, "lyWindows", objSkillTable_mbs)
				audio_play_sound(sndWindowTick, 1, 0)
			}
		}
		else if (contGUI.mouseOnFindButton) {
			with (contGUI) {
				var alreadyExists = -1
				with (objMessageBox) {
					if (owner == other.id) {
						alreadyExists = id
						break
					}
				}
				
				if (alreadyExists == -1) {
					var messageBox = show_dialoguebox(findButtonX-60, display_get_gui_height()-222, "", eng() ? "Looking for..." : "Ne arıyorsun?", contGUI.id, 1
					, eng() ? "Sellers" : "Satıcılar", eng() ? "Characters" : "Kişiler", eng() ? "Bank" : "Banka", eng() ? "Doctor" : "Doktor", "Cancel")
					messageBox.specialDesign = true
					findQuestion = true
				}
				else {
					with (alreadyExists)
						close_window()
				}
			}
		}
	}
}

if (!IS_MOBILE) {
	if (!global.gamepad_active) {
		for (var i = gp_face1; i < gp_axisrv; i++) {
		    if (gamepad_button_check(0, i)) {
				global.gamepad_active = true
			
				if (global.debugMode)
					show_messagebox(200, 200, "", eng() ? "Gamepad Connected" : "Oyun Kumandası Bağlandı", 2*sec)
				
				break
			}
		}
	
		if (gamepad_axis_value(gamepad, gp_axisrh) > 0.2 or gamepad_axis_value(gamepad, gp_axisrv) > 0.2
		or gamepad_axis_value(gamepad, gp_axislh) > 0.2 or gamepad_axis_value(gamepad, gp_axislv) > 0.2) {
			global.gamepad_active = true
		
			if (global.debugMode)
				show_messagebox(200, 200, "", eng() ? "Gamepad Connected" : "Oyun Kumandası Bağlandı", 2*sec)
		}
	}
	else {
		if (gamepad_button_check_pressed(global.gamepad, gp_face4)) {
			with (contPlayer)
				event_perform(ev_keypress, ord("Q"))
		}
	
		if (gamepad_button_check_released(global.gamepad, gp_face4)) {
			with (contPlayer)
				event_perform(ev_keyrelease, ord("Q"))
		}
	
		if (mouse_check_button(mb_left) or mouse_check_button(mb_right)) {
			global.gamepad_active = false
			global.mouseControl = true
		
			controlled_window_set_cursor_sprite(sprCursor, 0)
		
			if (global.debugMode)
				show_messagebox(200, 200, "", eng() ? "Gamepad Disconnected" : "Oyun Kumandası\nBağlantısı Koptu", 2*sec)
		}
	
		if (gamepad_button_check_pressed(gamepad, gp_shoulderr)) {
			with (objPlayer)
				event_perform(ev_mouse, ev_global_left_press)
		}
	
		if (gamepad_button_check_pressed(gamepad, gp_stickl)) {
			if (instance_exists(objPlayer)) {
				var result = -1
				var resultDistance = NPC_CLICKDISTANCE
		
				with (parTarget) {
					if (inView and death and hasDropList and ds_list_size(droppedList) > 0) {
						var distance = point_distance(x, y, objPlayer.x, objPlayer.y)
						if (distance < resultDistance and !collision_line(x, y, objPlayer.x, objPlayer.y, parSolid, 1, 1)) {
							result = id
							resultDistance = distance
						}
					}
				}
		
				with (parNPC) {
					if (inView) {
						var distance = point_distance(x, y, objPlayer.x, objPlayer.y)
						if (distance < resultDistance and !collision_line(x, y, objPlayer.x, objPlayer.y, parSolid, 1, 1)) {
							result = id
							resultDistance = distance
						}
					}
				}
			
				with (objLootbox) {
					if (inView and hasDropList and ds_list_size(droppedList) > 0) {
						var distance = point_distance(x, y, objPlayer.x, objPlayer.y)
						if (distance < resultDistance and !collision_line(x, y, objPlayer.x, objPlayer.y, parSolid, 1, 1)) {
							result = id
							resultDistance = distance
						}
					}
				}
		
				if (result != -1) {
					mouse_set_position(screen_point(result.x, 0), screen_point(result.y, 1))
					with (contCursor) {
						clickObject = result
						alarm[1] = 3
					}
				}
			}
		}
	
		if (gamepad_button_check(gamepad, gp_shoulderr)) {
			with (objPlayer)
				event_perform(ev_mouse, ev_global_left_button)
		}
	
		if (gamepad_button_check_released(gamepad, gp_shoulderr)) {
			with (objPlayer)
				event_perform(ev_mouse, ev_global_left_release)
		}
	
		if (gamepad_button_check_pressed(gamepad, gp_face1) or gamepad_button_check_pressed(gamepad, gp_stickr)) {
			with (all) {
				event_perform(ev_mouse, ev_global_left_press)
			
				if (position_meeting(mouse_x, mouse_y, id))
					event_perform(ev_mouse, ev_left_press)
			}
		}
	
		if (gamepad_button_check(gamepad, gp_stickr)) {
			with (all) {
				event_perform(ev_mouse, ev_global_left_button)
			
				if (position_meeting(mouse_x, mouse_y, id))
					event_perform(ev_mouse, ev_left_button)
			}
		}
	
		if (gamepad_button_check_released(gamepad, gp_face1) or gamepad_button_check_released(gamepad, gp_stickr)) {
			with (all) {
				event_perform(ev_mouse, ev_global_left_release)
			
				if (position_meeting(mouse_x, mouse_y, id))
					event_perform(ev_mouse, ev_left_release)
			}
		}
	
		if (gamepad_button_check_released(gamepad, gp_shoulderl)) {
			with (all)
				event_perform(ev_keyrelease, vk_control)
			
			var leftReleased = false
			with (parWindow) {
				if (mouseOnBody) {
					leftReleased = true
					break
				}
			}
		
			if (leftReleased)
				event_perform(ev_mouse, ev_global_left_release)
		}
	
		if (gamepad_button_check_pressed(gamepad, gp_shoulderl)) {
			var _break = false
		
			with (parWindow) {
				if (mouseOnBody) {
					_break = true
					break
				}
			}
		
			if (!_break) {
				with (all)
					event_perform(ev_keypress, vk_control)
			}
		}
	
		if (gamepad_button_check_pressed(gamepad, gp_start)) {
			var _skip = false
			with (parWindow) {
				event_perform(ev_keypress, vk_escape)
				if (destroy) {
					_skip = !menuBox
					break
				}
			}
				
			if (!_skip)
				event_perform(ev_keypress, vk_escape)
		}
	
		if (gamepad_button_check_pressed(gamepad, gp_select)) {		
			deepestWindow = -1
			deepness = -25000
			with (parWindow) {
				if (depth > other.deepness) {
					other.deepestWindow = id
					other.deepness = depth
				}
			}
		
			if (deepestWindow != -1)
				with (deepestWindow)
					event_perform(ev_other, ev_user0)
		}
	
		if (gamepad_button_check_pressed(gamepad, gp_face2)) {
			if (global.pause)
				event_perform(ev_keypress, vk_escape)
			else {
				with (parWindow)
					event_perform(ev_keypress, vk_escape)
		
				with (objMap)
					event_perform(ev_keypress, vk_escape)
			}
		}
	
		if (global.mouseControl) {
			var spd_x = gamepad_axis_value(gamepad, gp_axisrh)*display_get_width()/160
			var spd_y = gamepad_axis_value(gamepad, gp_axisrv)*display_get_height()/160
		
			if (abs(spd_x) > 0.4)
				spd_x *= 1.5
			else if (abs(spd_x) > 0.7)
				spd_x *= 11
			else if (abs(spd_x) > 0.85)
				spd_x *= 30
			else if (abs(spd_x) > 0.98)
				spd_x *= 36.5
			
			if (abs(spd_y) > 0.4)
				spd_y *= 1.5
			else if (abs(spd_y) > 0.7)
				spd_y *= 11
			else if (abs(spd_y) > 0.85)
				spd_y *= 30
			else if (abs(spd_y) > 0.98)
				spd_y *= 36.5

			if ((spd_x != 0 or spd_y != 0) and device_mouse_x_to_gui(0)+spd_x > 0 and device_mouse_x_to_gui(0)+spd_x < display_get_width()
			and device_mouse_y_to_gui(0)+spd_y > 0 and device_mouse_y_to_gui(0)+spd_y < display_get_height()) {
				mouse_set_position(device_mouse_x_to_gui(0)+spd_x,
								   device_mouse_y_to_gui(0)+spd_y)
			}
		}
	
		#region Gamepad Tabbing
		if (gamepad_down >= 0 and (gamepad_button_check_pressed(gamepad, gp_padl) or gamepad_button_check_pressed(gamepad, gp_padr)
		or gamepad_button_check_pressed(gamepad, gp_padu) or gamepad_button_check_pressed(gamepad, gp_padd) or gamepad_leftarrow_virtual)) {
			var isRight = gamepad_button_check_pressed(gamepad, gp_padr)
			var isLeft = gamepad_button_check_pressed(gamepad, gp_padl)
			var isUp = gamepad_button_check_pressed(gamepad, gp_padu)
			var isDown = gamepad_button_check_pressed(gamepad, gp_padd)
		
			var _break = false
			with (parWindow) {
				if (front and image_alpha > 0.4) {
					if (object_index == objMessageBox) {
						var tab_index_before = tab_index
					
						if (dialogueID == -1) {
							if (tab_index == 0 and isUp or tab_index == 1 and isUp)
								tab_index = (tab_index == 1)
							else if ((tab_index == buttonCount-2 and isDown and buttonCount mod 2 == 0) or tab_index == buttonCount-1 and isDown)
								tab_index = tab_index == buttonCount-1 ? (buttonCount mod 2 == 0) : 0
							else
								tab_index += (isRight-isLeft)+(isDown-isUp)*(1+(dialogueID == -1))
						}
						else
							tab_index += (isRight-isLeft)+(isDown-isUp)*(1+(dialogueID == -1))
					
						if (dialogueID == -1 and tab_index == buttonCount and isDown)
							tab_index = buttonCount-1
						
						while (tab_index < 0)
							tab_index += buttonCount
						tab_index = tab_index mod buttonCount
					
						if (tab_index_before == -1)
							tab_index = isRight
				
						mouse_set_position(x+buttonPosition_x[tab_index]+buttonWidth/2, y+buttonPosition_y[tab_index]+buttonHeight/2)
						_break = true
					}
					else if (object_index == objItemBag or object_index == objBankWindow or object_index == objTradeWindow
					or object_index == objQuestTable or object_index == objCharacterWindow or object_index == objEquipmentBag) {
						var maxPage = (object_index == objTradeWindow and loot) ? 0 : id.maxPage
						var page = id.page
						var hMax, vMax
						var add = 0
						if (object_index == objItemBag) { hMax = global.bagBoxCount_horizontal vMax = global.bagBoxCount_vertical add = !instance_exists(objEquipmentBag) }
						else if (object_index == objTradeWindow) { hMax = horizontalBoxCount vMax = verticalBoxCount }
						else if (object_index == objBankWindow) { hMax = global.bagBoxCount_horizontal vMax = global.bagBoxCount_vertical add = 1}
						else if (object_index == objQuestTable) { hMax = 1 vMax = 8 }
						else if (object_index == objCharacterWindow) { hMax = (page == 1) vMax = (page == 1)*7 }
						else if (object_index == objEquipmentBag) { hMax = 5 vMax = 1 maxPage = 0 }
					
						var tab_index_before = tab_index
						tab_index += isRight-isLeft+(isDown-isUp)*((object_index == objEquipmentBag or object_index == objCharacterWindow) ? 1 : hMax)
						while (tab_index < 0)
							tab_index += hMax*vMax+maxPage+1+add
						tab_index = tab_index mod (hMax*vMax+maxPage+1+add)
					
						if (tab_index_before >= maxPage+1 and object_index != objEquipmentBag) {
							if (tab_index_before-maxPage-1 < hMax and isUp)
								tab_index = 0
							else if (tab_index_before-maxPage-1 > hMax*(vMax-1) and isDown)
								tab_index = 0
							else if (tab_index_before == hMax*vMax+maxPage and isDown)
								tab_index = 0
						}
						else if (tab_index_before == -1)
							tab_index = 0
						
						if (object_index == objBankWindow) {
							if (tab_index_before < maxPage+1 and isUp)
								tab_index = hMax*vMax+maxPage+add
							else if (tab_index_before-maxPage-1 > hMax*(vMax-1) and isDown and tab_index_before != hMax*vMax+maxPage+add)
								tab_index = hMax*vMax+maxPage+add
						}
						else if (object_index == objQuestTable) {
							if (tab_index_before < maxPage+1) {
								if (isUp or (isLeft and tab_index_before == 0)) {
									for (var _k = vMax-1; _k >= 0; _k--) {
										if (item[(page-1)*hMax, _k] != -1) {
											tab_index = maxPage+1+_k
											break
										}
									}
								}
								else if (isDown)
									tab_index = maxPage+1
							}
						}
						else if (object_index == objCharacterWindow) {
							if (page == 1 and tab_index_before < maxPage+1 and isUp)
								tab_index = hMax*vMax+maxPage
							if (page == 1 and tab_index_before < maxPage+1 and isDown)
								tab_index = maxPage+1
							else if (page == 1 and tab_index_before > hMax*vMax+maxPage-2 and isDown)
								tab_index = 0
							else if (page == 1 and tab_index_before > hMax*vMax+maxPage-2 and isUp)
								tab_index = hMax*vMax+maxPage-2
						}
						else if (tab_index_before == hMax*vMax+maxPage+add and isDown)
							tab_index = 0
						else if (object_index == objItemBag and !instance_exists(objEquipmentBag)) {
							if (tab_index_before-maxPage-1 > hMax*(vMax-1) and isDown)
								tab_index = hMax*vMax+maxPage+add
							else if (tab_index_before < maxPage+1 and isUp)
								tab_index = hMax*vMax+maxPage+add
						}
						else if (hMax == 1 and tab_index_before < maxPage+1 and isDown) {
							tab_index = maxPage+1
						}
					
						var isItemBag = object_index == objItemBag
						if (tab_index < maxPage+1) {
							if (tab_index == maxPage)
								mouse_set_position(exitButton_x+exitButtonEdge/2, exitButton_y+exitButtonEdge/2)
							else {
								if (object_index != objEquipmentBag and !(object_index == objTradeWindow and loot)) {
									if (tab_index == 0 and object_index == objItemBag) // for New Items
										mouse_set_position(pageButton_x[tab_index+!isItemBag]+pageButtonWidth[tab_index+!isItemBag]/2, pageButton_y[tab_index+!isItemBag]+pageButtonHeight[tab_index+!isItemBag]/2)
									else
										mouse_set_position(pageButton_x[tab_index+!isItemBag]+pageButtonEdge[tab_index+!isItemBag]/2, pageButton_y[tab_index+!isItemBag]+pageButtonEdge[tab_index+!isItemBag]/2)
								}
								else {
									if (object_index == objTradeWindow and loot) {
										if (isDown or isRight) {
											tab_index = 1
											mouse_set_position(exitButton_x+exitButtonEdge/2, exitButton_y+exitButtonEdge/2)
										}
										else {
											tab_index = hMax*vMax+maxPage
											mouse_set_position(x+box_x[hMax-1, vMax-1]+7, y+box_y[hMax-1, vMax-1]+7)
										}
									}
									else {
										if (isDown or isRight) {
											tab_index = 5
											mouse_set_position(x+box_x[1, 2]+7, y+box_y[1, 2]+7)
										}
										else {
											tab_index = 1
											mouse_set_position(x+box_x[1, 0]+7, y+box_y[1, 0]+7)
										}
									}
								}
							}
						}
						else {
							var _tab_index = tab_index-maxPage-1
							var i = _tab_index mod hMax
							var j = _tab_index div hMax
						
							if (object_index == objEquipmentBag) {
								if (tab_index == 1) { i = 1 j = 0 }
								else if (tab_index == 2) { i = 0 j = 1 }
								else if (tab_index == 3) { i = 1 j = 1 }
								else if (tab_index == 4) { i = 2 j = 1 }
								else if (tab_index == 5) { i = 1 j = 2 }
							}
						
							if (object_index == objBankWindow and tab_index == hMax*vMax+maxPage+add)
								mouse_set_position(takeButton_x+takeButtonEdge/2, takeButton_y+10)
							else if (object_index == objQuestTable and item[page-1, j] == -1) {
								if (isDown or isLeft) {
									if (tab_index_before >= maxPage+1) {
										tab_index = 0
										mouse_set_position(pageButton_x[tab_index+1]+pageButtonEdge[tab_index+1]/2, pageButton_y[tab_index+1]+pageButtonEdge[tab_index+1]/2)
									}
								}
								else if (isUp or isRight) {
									tab_index = 0
									mouse_set_position(pageButton_x[tab_index+1]+pageButtonEdge[tab_index+1]/2, pageButton_y[tab_index+1]+pageButtonEdge[tab_index+1]/2)
								}
							}
							else if (object_index == objCharacterWindow and page == 1) {
								if (_tab_index < 5)
									mouse_set_position(statX-13, statY-((5-_tab_index)*statBetween)+9)
								else
									mouse_set_position(_tab_index == 5 ? saveButton_x+25 : undoButton_x+25, _tab_index == 5 ? saveButton_y+12 : undoButton_y+12)
							}
							else
								mouse_set_position(x+box_x[i/*+(page-1)*hMax*/, j]+7, y+box_y[i/*+(page-1)*hMax*/, j]+7)
							
							if (object_index == objItemBag and !instance_exists(objEquipmentBag) and tab_index == hMax*vMax+maxPage+add)
								mouse_set_position(equipmentButton_x+equipmentButtonEdge/2, equipmentButton_y+10)
						}

						_break = true
					} else if ((global.itemSelected == -1 or global.itemSelected.from != window_skills)
					and (object_index == objSkillTable and isActive or object_index == objSkillTable_mbs)) {
						if (tab_onSkill != -1 and isRight and id.page != 3) {
							mouse_set_position(tab_onSkill.x+70+(tab_onSkill.upgrade > 0)*80, tab_onSkill.y+10)
							tab_onSkill = -1
							_break = true
						}
						else {
							var hMax = 10
							var vMax = 3+(object_index == objSkillTable)*3
							var maxPage = object_index == objSkillTable ? id.maxPage : 0
							var page = object_index == objSkillTable ? id.page : 1
							var tab_index_before = tab_index
						
							tab_index += isRight - isLeft - isUp + isDown
							while (tab_index < 0)
								tab_index += hMax*vMax+maxPage+1
							tab_index = tab_index mod (hMax*vMax+maxPage+1)
						
							if (tab_index_before < maxPage+1 and isDown) {
								if (id.page != 3)
									tab_index = maxPage+1
							}
							else if (id.page == 3 and tab_index_before == maxPage and isRight)
								tab_index = 0
							else if ((tab_index_before == maxPage+1 or object_index == objSkillTable_mbs and tab_index_before == maxPage+6) and isUp)
								tab_index = 0
							else if (tab_index_before < maxPage+1 and isUp or tab_index_before == 0 and isLeft) {
								if (id.page != 3) {
									tab_index = hMax*vMax+maxPage
									tab_index_before = tab_index+1
									isUp = true
									isLeft = false
									isDown = false
									isRight = false
								}
								else {
									if (tab_index_before == 0 and isLeft)
										tab_index = maxPage
									else if (tab_index_before == 0)
										tab_index = maxPage
								}
							}
						
							if (isLeft and tab_index_before == 6 and object_index == objSkillTable_mbs) {
								tab_index = maxPage
								mouse_set_position(exitButton_x+exitButtonEdge/2, exitButton_y+exitButtonEdge/2)
							}
							if (tab_index < maxPage+1 and !(isLeft and tab_onSkill == -1 and tab_index_before >= maxPage+1)) {		
								tab_onSkill = -1
							
								if (tab_index == maxPage)
									mouse_set_position(exitButton_x+exitButtonEdge/2, exitButton_y+exitButtonEdge/2)
								else if (object_index != objSkillTable_mbs)
									mouse_set_position(pageButton_x[tab_index+1]+35, pageButton_y[tab_index+1]+18)
							}
							else {
								tab_index -= (isDown or isRight) ? 1 : -1
							
								if (tab_index_before >= maxPage+1 and tab_onSkill == -1 and isLeft)
									tab_index += 1
								
								do {
									var mainBreak = false
								
									tab_index += (isDown or isRight) ? 1 : -1
								
									while (tab_index < maxPage+1)
										tab_index += hMax*vMax
									if (tab_index == hMax*vMax and (isDown or isRight)) {
										tab_onSkill = -1
										tab_index = 0
										if (object_index != objSkillTable_mbs)
											mouse_set_position(pageButton_x[tab_index+1]+35, pageButton_y[tab_index+1]+18)
										else
											mouse_set_position(exitButton_x+exitButtonEdge/2, exitButton_y+exitButtonEdge/2)
										mainBreak = true
										break
									}
							
									if (!mainBreak) {
										var _tab_index = tab_index-maxPage-1
										var i = _tab_index mod hMax
										var j = _tab_index div hMax
									}
									else
										break
								} until (item[i+(id.page-1)*hMax, j] != -1)
							
								if (!mainBreak) {
									mouse_set_position(item[i+(id.page-1)*hMax, j].x+7, item[i+(id.page-1)*hMax, j].y+7)
									tab_onSkill = item[i+(id.page-1)*hMax, j]
								}
							}
						
							_break = true
						}
					}
				}
			}
		
			with (objMap) {
				if (ds_list_size(locationsSorted) > 0) {
					tab_index += isRight - isLeft - isUp + isDown
					while (tab_index < 0)
						tab_index += ds_list_size(locationsSorted)
					tab_index = tab_index mod ds_list_size(locationsSorted)

					mouse_set_position(x+ds_list_find_value(locationsSorted, tab_index).x, y+ds_list_find_value(locationsSorted, tab_index).y)
				}
			
				_break = true
			}
		
			if (!_break) {
				if (room == roomMenu or room == roomOptions) {
					var maxElements = (room == roomMenu) ? 7 : 26
				
					var tab_index_before = objMainMenuDraw.tab_index
					objMainMenuDraw.tab_index += isRight - isLeft - isUp + isDown
					while (objMainMenuDraw.tab_index < 0)
						objMainMenuDraw.tab_index += maxElements
					objMainMenuDraw.tab_index = objMainMenuDraw.tab_index mod maxElements
				
					if (tab_index_before >= maxElements-2 and (isUp or isDown)) {
						objMainMenuDraw.tab_index = isDown ? 0 : maxElements-3
					}
					else if (room == roomOptions and (isUp or isDown or objMainMenuDraw.tab_index >= maxElements-2)) {
						if (objMainMenuDraw.tab_index < maxElements-2) {
							if (tab_index_before >= 2 and tab_index_before < 6)
								objMainMenuDraw.tab_index = isUp ? 1 : 6
							else if (tab_index_before >= 6 and tab_index_before < 9)
								objMainMenuDraw.tab_index = isUp ? 2 : 9
							else if (tab_index_before == 9)
								objMainMenuDraw.tab_index = isUp ? 6 : 10
							else if (tab_index_before >= 10 and tab_index_before < 14)
								objMainMenuDraw.tab_index = isUp ? 9 : 14
							else if (tab_index_before == 14)
								objMainMenuDraw.tab_index = isUp ? 10 : 15
							else if (tab_index_before >= 15 and tab_index_before < 22)
								objMainMenuDraw.tab_index = isUp ? 14 : 22
						}
						else {
							if (objMainMenuDraw.tab_index == maxElements-1)
								with (objFullscreenButton)
									mouse_set_position(screen_point(x, 0), screen_point(y, 1))
							else
								with (objFullscreenButton)
									mouse_set_position(screen_point(x, 0)-110, screen_point(y, 1))
						}
					}
				
					if (objMainMenuDraw.tab_index < maxElements-2 or room != roomMenu) {
						var _break2 = false
						with (objMainMenuButton) {
							if (objMainMenuDraw.tab_index == 0 and no == 0 or objMainMenuDraw.tab_index == 1 and no == 2
							or objMainMenuDraw.tab_index == 2 and no == 1 or objMainMenuDraw.tab_index == 3 and no == 4
							or objMainMenuDraw.tab_index == 4 and no == 3 or objMainMenuDraw.tab_index == (maxElements-4) and no == 6
							or objMainMenuDraw.tab_index == (maxElements-3) and no == 5) {
								mouse_set_position(screen_point(x, 0), screen_point(y, 1))
								_break2 = true
							}
						}
					
						if (!_break2) {
							if (objMainMenuDraw.tab_index == 0)
								mouse_set_position(screen_point(objMainMenuDraw.rightSide_x, 0), screen_point(objMainMenuDraw.offset_y_start, 1))
							else if (objMainMenuDraw.tab_index == 1)
								mouse_set_position(screen_point(objMainMenuDraw.rightSide_x, 0), screen_point(objMainMenuDraw.offset_y_start+objMainMenuDraw.between, 1))
							else if (objMainMenuDraw.tab_index >= 2 and objMainMenuDraw.tab_index < 6)
								mouse_set_position(screen_point(objMainMenuDraw.rightSide_x+objMainMenuDraw.checkButton_between*(objMainMenuDraw.tab_index-2), 0)
								, screen_point(objMainMenuDraw.offset_y_start+objMainMenuDraw.between*2, 1))
							else if (objMainMenuDraw.tab_index >= 6 and objMainMenuDraw.tab_index < 9)
								mouse_set_position(screen_point(objMainMenuDraw.rightSide_x+objMainMenuDraw.checkButton_between*(objMainMenuDraw.tab_index-6), 0)
								, screen_point(objMainMenuDraw.offset_y_start+objMainMenuDraw.between*4, 1))
							else if (objMainMenuDraw.tab_index == 9)
								mouse_set_position(screen_point(objMainMenuDraw.rightSide_x, 0)
								, screen_point(objMainMenuDraw.offset_y_start+objMainMenuDraw.between*5, 1))
							else if (objMainMenuDraw.tab_index >= 10 and objMainMenuDraw.tab_index < 14)
								mouse_set_position(screen_point(objMainMenuDraw.rightSide_x+objMainMenuDraw.checkButton_between*(objMainMenuDraw.tab_index-10), 0)
								, screen_point(objMainMenuDraw.offset_y_start+objMainMenuDraw.between*6, 1))
							else if (objMainMenuDraw.tab_index == 14)
								mouse_set_position(screen_point(objMainMenuDraw.rightSide_x, 0)
								, screen_point(objMainMenuDraw.offset_y_start+objMainMenuDraw.between*7, 1))
							else if (objMainMenuDraw.tab_index >= 15 and objMainMenuDraw.tab_index < 22)
								mouse_set_position(screen_point(objMainMenuDraw.rightSide_x+objMainMenuDraw.checkButton_between*(-3-15+objMainMenuDraw.tab_index), 0)
								, screen_point(objMainMenuDraw.offset_y_start+objMainMenuDraw.between*8, 1))
						}
					}
					else {
						if (objMainMenuDraw.tab_index == maxElements-1)
							with (objFullscreenButton)
								mouse_set_position(screen_point(x, 0), screen_point(y, 1))
						else
							with (objFullscreenButton)
								mouse_set_position(screen_point(x, 0)-110, screen_point(y, 1))
					}
				}
				else if (instance_exists(contGUI)) {
					contGUI.tab_index += isRight - isLeft + isUp - isDown
					while (contGUI.tab_index < 0)
						contGUI.tab_index += (7+contGUI.findButton_exists+IS_MOBILE)
					contGUI.tab_index = contGUI.tab_index mod (7+IS_MOBILE+contGUI.findButton_exists)
			
					var mY = display_get_gui_height()-27
			
					var mX = contGUI.bLogoX
					if (contGUI.tab_index == 0)
						mX = contGUI.bLogoX
					else if (contGUI.tab_index == 1)
						mX = contGUI.qLogoX
					else if (contGUI.tab_index == 2)
						mX = display_get_gui_width()/2-118+0*119/2
					else if (contGUI.tab_index == 3)
						mX = display_get_gui_width()/2-118+4*119/2
					else if (contGUI.tab_index == 4)
						mX = contGUI.cLogoX
					else if (contGUI.tab_index == 5)
						mX = contGUI.sLogoX
					else if (contGUI.tab_index == 6) {
						mX = contGUI.mLogoX
						if (IS_MOBILE)
							mY = 100
					}
					else if (contGUI.tab_index == 6+IS_MOBILE) {
						mX = contGUI.pauseLogoX
						if (IS_MOBILE)
							mY = 160
					}
					else if (contGUI.tab_index == 7+IS_MOBILE)
						mX = contGUI.findButtonX
				
					mouse_set_position(mX, mY)
				}
			}
		
			gamepad_leftarrow_virtual = false
			gamepad_down = 0
		}
		#endregion
	}
}