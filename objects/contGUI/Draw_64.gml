var wPort = display_get_gui_width()
var hPort = display_get_gui_height()

if (global.showGUI) {
	var my = device_mouse_y_to_gui(0)
	var mx = device_mouse_x_to_gui(0)
	var scX_player = screen_point(objPlayer.x, 0)
	var scY_player = screen_point(objPlayer.y, 1)
	var isOutFight = is_outfight()
	var v_isEnglish = eng()
	
	#region Quest Arrows
	mouseOnArrow = -1

	if (showArrows) {
		var ds_size_green = ds_list_size(greenDirectionArrows)
		var ds_size_red = ds_list_size(redDirectionArrows)
		var ds_size_yellow = ds_list_size(yellowDirectionArrows)
		var ds_size_blue = ds_list_size(blueDirectionArrows)

		for (var i = 0; i < ds_size_green; i++) {
			var dirObj = ds_list_find_value(greenDirectionArrows, i)
	
			if (instance_exists(dirObj)) {
				var dir = point_direction(objPlayer.x, objPlayer.y, dirObj.x, dirObj.y)
		
				var xx = scX_player+lengthdir_x(165+contMain.period, dir)
				var yy = scY_player+lengthdir_y(165+contMain.period, dir)
		
				if (point_distance(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx, yy) < 30) {
					draw_set_color(c_lime) draw_set_font(fontInfo_small) draw_set_center()
						draw_text_outline(xx, yy-40, eng() ? "Completed\nQuest" : "Tamamlanan\nGörev", 2, c_black, 8, 1, 1, 0)
					draw_set_default()
			
					mouseOnArrow = 100+i
				}
		
				draw_sprite_ext(sprDirectionArrow, 2, xx, yy, 1+(mouseOnArrow >= 100)/5, 1+(mouseOnArrow >= 100)/5, dir, c_white, 1)
			}
		}

		for (var i = 0; i < ds_size_yellow; i++) {
			var dirObj = ds_list_find_value(yellowDirectionArrows, i)
	
			if (instance_exists(dirObj)) {
				var arrow_size = 1
				var dir = point_direction(objPlayer.x, objPlayer.y, dirObj.x, dirObj.y)
		
				var xx = scX_player+lengthdir_x(150+contMain.period/2, dir)
				var yy = scY_player+lengthdir_y(150+contMain.period/2, dir)
				
				if (point_distance(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx, yy) < 30) {			
					draw_set_color(c_yellow) draw_set_font(fontInfo_small) draw_set_center()
						draw_text_outline(xx, yy-40, eng() ? "Quest\nTarget" : "Görev\nHedefi", 2, c_black, 8, 1, 1, 0)
					draw_set_default()
			
					mouseOnArrow = 200+i
					arrow_size = 1.2
				}
			
				draw_sprite_ext(sprDirectionArrow, 1, xx, yy, arrow_size, arrow_size, dir, c_white, 1)
			}
		}

		for (var i = 0; i < ds_size_red; i++) {
			var dirObj = ds_list_find_value(redDirectionArrows, i)
	
			if (instance_exists(dirObj)) {
				var arrow_size = 1
				var dir = point_direction(objPlayer.x, objPlayer.y, dirObj.x, dirObj.y)
		
				var xx = scX_player+lengthdir_x(135+contMain.period/2, dir)
				var yy = scY_player+lengthdir_y(135+contMain.period/2, dir)
				
				if (point_distance(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx, yy) < 30) {			
					draw_set_color(c_red) draw_set_font(fontInfo_small) draw_set_center()
						draw_text_outline(xx, yy-40, eng() ? "Quest\nOffer" : "Görev\nTeklifi", 2, c_black, 8, 1, 1, 0)
					draw_set_default()
			
					mouseOnArrow = 300+i
					arrow_size = 1.2
				}
			
				draw_sprite_ext(sprDirectionArrow, 0, xx, yy, arrow_size, arrow_size, dir, c_white, 1)
			}
		}
		
		for (var i = 0; i < ds_size_blue; i++) {
			var dirObj = ds_list_find_value(blueDirectionArrows, i)
	
			if (instance_exists(dirObj)) {
				var arrow_size = 1
				var dir = point_direction(objPlayer.x, objPlayer.y, dirObj.x, dirObj.y)
		
				var xx = scX_player+lengthdir_x(120+contMain.period/2, dir)
				var yy = scY_player+lengthdir_y(120+contMain.period/2, dir)
				
				if (point_distance(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx, yy) < 30) {			
					draw_set_color(c_challenge) draw_set_font(fontInfo_small) draw_set_center()
						draw_text_outline(xx, yy-40, eng() ? "Challenge" : "Sözleşme", 2, c_black, 8, 1, 1, 0)
					draw_set_default()
			
					mouseOnArrow = 400+i
					arrow_size = 1.2
				}
			
				draw_sprite_ext(sprDirectionArrow, 3, xx, yy, arrow_size, arrow_size, dir, c_white, 1)
			}
		}
	}
	#endregion

	with (objLootbox) {
		if (inView) {
			var scX = screen_point(x, 0)
			var scY = screen_point(y, 1)
	
			if (hasDropList and ds_list_size(droppedList) > 0) {
				draw_sprite_ext(sprDrop, !objPlayer.death/* and isOutFight*/, scX, scY-5+contMain.period, 1, 1, 0, c_white, 1)
				draw_sprite_ext(sprDrop, !objPlayer.death/* and isOutFight*/, scX, scY-5+contMain.period, 1, 1, 0, c_white, 1)
		
				if (position_meeting(mouse_x, mouse_y, id) and !test_upperclick_window()) {
					draw_sprite_ext(sprMarkBubble, -1, scX, scY, 1, 1, 0, c_white, 0.8)
					
					if (!IS_MOBILE)
						show_textbox(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), v_isEnglish ? "<Left Click>" : "<Sol Fare>", 1)
				}
			}
		}
	}

	with (objTradeWindow) {
		if (instance_exists(owner)) {
			var scX = screen_point(owner.x, 0)
			var scY = screen_point(owner.y, 1)
		
			draw_sprite_ext(sprMarkBubble, -1, scX, scY, 1, 1, 0, c_white, 1)
		}
	}

	with (parCreature) {	
		if (inView) {			
			var scX = screen_point(x, 0)
			var scY = screen_point(y, 1)
		
			if (death) {
				if (hasDropList and ds_list_size(droppedList) > 0) {
					var dropSize = (1.2-(alarm[9] > 10*sec)*0.2)*dropSymbolSize
					var dropAlpha = 0.75+(dropSize == 1)*0.25
				
					if (dropSymbolSize > 1)
						dropSymbolSize -= 0.025
			
					draw_sprite_ext(sprDrop, !objPlayer.death/*and isOutFight*/, scX, scY-5+contMain.period, dropSize, dropSize, 0, dropSize == 1 ? c_white : (contMain.period mod 2 == 0 ? c_white : c_ltyellow), dropAlpha)
		
					if (position_meeting(mouse_x, mouse_y, id) and !test_upperclick_window()) {
						draw_sprite_ext(sprMarkBubble, -1, scX, scY, 1, 1, 0, c_white, 0.8)
						
						if (!IS_MOBILE)
							show_textbox(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), v_isEnglish ? "<Left Click>" : "<Sol Fare>", 1)
					}
				}
			}
			else {		
				if (mode == md_attack) {
					var size = 1+boss*0.3
					var offsetX = -boss*110*0.15
					
					draw_sprite_general(sprBarInside_hp, -1, 0, 0, 110, 9, scX-55+offsetX, scY-60,
					size, size, 0, c_black, c_black, c_black, c_black, 0.15)
			
					draw_sprite_general(sprBarInsideRed_hp, -1, 0, 0, 110*healthBarP, 9, scX-55+offsetX, scY-60,
					size, size, 0, c_white, c_white, c_white, c_white, 0.35)
			
					if (healthBarP != 1)
						draw_sprite_general(sprBarInside_hp, -1, 110*healthBarP, 0, 2, 9, scX-55+110*healthBarP*size+offsetX, scY-60,
						size, size, 0, c_black, c_black, c_black, c_black, 1)
	
					draw_sprite_general(sprBarInside_hp, -1, 0, 0, 110*hp/maxHp, 9, scX-55+offsetX, scY-60,
					size, size, 0, c_white, c_white, c_white, c_white, 0.5)
					draw_sprite_ext(sprBar, -1, scX, scY-60,
					size, size, 0, c_white, 1)
				
					draw_set_halign(fa_center) draw_set_valign(fa_center) draw_set_font(fontMain_small)
						draw_text(scX, scY-55, string(ceil(hp)))
					draw_set_default()
		
					var secondaryX
					var count = 0
					var ds_size = ds_list_size(bars)
					for (var b = 0; b < ds_size; b++) {
						// List
						var ds_element = ds_list_find_value(bars, b)
						if (ds_element == sk_earthmove and abilityEarthMove and earthMovePoints > 0) {
							secondaryX = scX-54+108*earthMovePoints/100
		
							if (stance == stEarthMove2)
								draw_set_color(c_white)
							else
								draw_set_color(c_orange)
							draw_set_alpha(0.5)
								draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 0)
							draw_set_alpha(1) draw_set_color(c_black)
			
							draw_roundrect(scX-54, scY-68-count*7, scX+54, scY-61-count*7, 1)
							draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 1)
				
							count++
						}
						else if (ds_element == sk_shock and abilityShock and shockPoints > 0) {
							secondaryX = scX-54+108*shockPoints/100
		
							draw_set_color(c_blue)
							draw_set_alpha(0.5)
								draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 0)
							draw_set_alpha(1) draw_set_color(c_black)
			
							draw_roundrect(scX-54, scY-68-count*7, scX+54, scY-61-count*7, 1)
							draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 1)
				
							count++
						}
						else if (ds_element == sk_rofux and abilityRofux and rofuxPoints > 0) {
							secondaryX = scX-54+108*rofuxPoints/100
		
							draw_set_color(c_aqua)
							draw_set_alpha(0.5)
								draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 0)
							draw_set_alpha(1) draw_set_color(c_black)
			
							draw_roundrect(scX-54, scY-68-count*7, scX+54, scY-61-count*7, 1)
							draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 1)
				
							count++
						}
						else if (ds_element == sk_laser and abilityLaser and laserPoints > 0) {
							secondaryX = scX-54+108*laserPoints/100
		
							draw_set_color(c_nicered)
							draw_set_alpha(0.5)
								draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 0)
							draw_set_alpha(1) draw_set_color(c_black)
			
							draw_roundrect(scX-54, scY-68-count*7, scX+54, scY-61-count*7, 1)
							draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 1)
				
							count++
						}
					}
				}
				else {
					draw_set_valign(fa_center) draw_set_halign(fa_center) draw_set_alpha(1)
					if (isAggressive) {
						draw_set_color(c_nicered) draw_set_font(fontArt)
							draw_text_outline(scX, scY-86-contMain.period, other.ltext_aggressive, 2, c_black, global.performanceOutFidelty, 0.8, 0.8, 0)
						draw_set_font(global.mainFont)
					}
			
					if ((isQuestTarget or isQuestTarget_direct) and (contMain.period > 3 and contMain.period < 9))
						draw_set_color(c_yellow)
					else
						draw_set_color(c_gray)
				
					if (!boss) {
						if (isLeader_hard) draw_set_font(fontBossName) else draw_set_font(fontCreatureName)
							draw_text_outline(scX, scY-51, name, 2, c_black, global.performanceOutFidelty, 1, 1, 0)
						
							draw_set_color(levelColor)
								draw_text_outline(scX, scY-69, string(level)+other.ltext_level, 2, c_black, global.performanceOutFidelty, 0.95, 0.95, 0)
							draw_set_color(c_black)
					}
					else {
						if (type == type_wisdom) {
							draw_set_color(c_fuchsia) draw_set_font(fontArt)
								draw_text_outline(scX, scY-104, string(level_wisdom)+other.ltext_wisdom, 2, c_black, global.performanceOutFidelty, 0.95, 0.95, 0)
							draw_set_color(c_aqua)
								draw_text_outline(scX, scY-75, name, 2, c_black, global.performanceOutFidelty, 1.05+contMain.period/200, 1.1+contMain.period/100, 0)
							draw_set_color(c_black)
						}
						else {
							draw_set_font(fontBossName)
								draw_text_outline(scX, scY-57, name, 2, c_black, global.performanceOutFidelty, 1, 1, 0)
								
							draw_set_color(levelColor) 
								draw_text_outline(scX, scY-85, string(level)+other.ltext_boss, 2, c_black, global.performanceOutFidelty, 1, 1, 0)
							draw_set_color(c_black)
						}
					}
					draw_set_default() draw_set_color(c_black) draw_set_alpha(1)
				}
			
				if (stunned and !freezed)
					draw_sprite_ext(sprStunEffect, -1, scX, scY-23, 1, 1, current_time/5 mod 360, c_white, 0.8)
			}
		}
	}

	with (parNPC) {
		if (inView) {
			var scX = screen_point(x, 0)
			var scY = screen_point(y, 1)
	
			if (death) {
				if (hasDropList and ds_list_size(droppedList) > 0) {
					var dropSize = (1.2-(alarm[9] > 10*sec)*0.2)*dropSymbolSize
					var dropAlpha = 0.75+(dropSize == 1)*0.25
				
					if (dropSymbolSize > 1)
						dropSymbolSize -= 0.025
			
					draw_sprite_ext(sprDrop, !objPlayer.death/*and isOutFight*/, scX, scY-5+contMain.period, dropSize, dropSize, 0, dropSize == 1 ? c_white : (contMain.period mod 2 == 0 ? c_white : c_gray), 0.75+(dropSize == 1)*0.25)
				
					if (position_meeting(mouse_x, mouse_y, id) and !test_upperclick_window()) {
						draw_sprite_ext(sprMarkBubble, -1, scX, scY, 1, 1, 0, c_white, 0.8)
						
						if (!IS_MOBILE)
							show_textbox(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), v_isEnglish ? "<Left Click>" : "<Sol Fare>", 1)
					}
				}
			}
			else {
				if (mode == md_attack or (hp != maxHp and protection_owner != pointer_null)) {
					var size = 1+boss*0.3
					var offsetX = -boss*110*0.15
					
					draw_sprite_general(sprBarInside_hp, -1, 0, 0, 110, 9, scX-55+offsetX, scY-60,
					size, size, 0, c_black, c_black, c_black, c_black, 0.15)
			
					draw_sprite_general(sprBarInsideRed_hp, -1, 0, 0, 110*healthBarP, 9, scX-55+offsetX, scY-60,
					size, size, 0, c_white, c_white, c_white, c_white, 0.35)
			
					if (healthBarP != 1)
						draw_sprite_general(sprBarInside_hp, -1, 110*healthBarP, 0, 2, 9, scX-55+110*healthBarP*size+offsetX, scY-60,
						size, size, 0, c_black, c_black, c_black, c_black, 1)
	
					draw_sprite_general(sprBarInside_hp, -1, 0, 0, 110*hp/maxHp, 9, scX-55+offsetX, scY-60,
					size, size, 0, c_white, c_white, c_white, c_white, 0.5)
					draw_sprite_ext(sprBar, -1, scX, scY-60,
					size, size, 0, c_white, 1)
				
					draw_set_halign(fa_center) draw_set_valign(fa_center) draw_set_font(fontMain_small)
						draw_text(scX, scY-55, string(ceil(hp)))
					draw_set_default()
		
					var secondaryX
					var count = 0
					var ds_size = ds_list_size(bars)
					for (var b = 0; b < ds_size; b++) {
						var ds_element = ds_list_find_value(bars, b)
						// List
						if (ds_element == sk_earthmove and abilityEarthMove and earthMovePoints > 0) {
							secondaryX = scX-54+108*earthMovePoints/100
		
							if (stance == stEarthMove2)
								draw_set_color(c_white)
							else
								draw_set_color(c_orange)
							draw_set_alpha(0.5)
								draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 0)
							draw_set_alpha(1) draw_set_color(c_black)
			
							draw_roundrect(scX-54, scY-68-count*7, scX+54, scY-61-count*7, 1)
							draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 1)
				
							count++
						}
						else if (ds_element == sk_shock and abilityShock and shockPoints > 0) {
							secondaryX = scX-54+108*shockPoints/100
		
							draw_set_color(c_blue)
							draw_set_alpha(0.5)
								draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 0)
							draw_set_alpha(1) draw_set_color(c_black)
			
							draw_roundrect(scX-54, scY-68-count*7, scX+54, scY-61-count*7, 1)
							draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 1)
				
							count++
						}
						else if (ds_element == sk_rofux and abilityRofux and rofuxPoints > 0) {
							secondaryX = scX-54+108*rofuxPoints/100
		
							draw_set_color(c_aqua)
							draw_set_alpha(0.5)
								draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 0)
							draw_set_alpha(1) draw_set_color(c_black)
			
							draw_roundrect(scX-54, scY-68-count*7, scX+54, scY-61-count*7, 1)
							draw_roundrect(scX-54, scY-68-count*7, secondaryX, scY-61-count*7, 1)
				
							count++
						}
					}
				}
				else {
					if (quests and isExlMarkActive and excMark != -1) {
						draw_outline(sprExcMark, excMark, scX+32, scY-49+contMain.period/1.5, 1.23, 1.23, -6, 1)
						draw_sprite_ext(sprExcMark, excMark, scX+32, scY-49+contMain.period/1.5, 1.17, 1.17, -6, c_white, 1)
					}
	
					if (isAggressive) {
						draw_set_color(c_nicered) draw_set_font(fontArt) draw_set_halign(fa_center) draw_set_valign(fa_center)
							draw_text_outline(scX, scY-37-contMain.period, other.ltext_aggressive, 3, c_black, global.performanceOutFidelty, 1, 1, 0)
						draw_set_default()
					}
				
					if (challengeCount > 0) {
						draw_set_color(c_challenge) draw_set_center()
							draw_text_outline(scX, scY-110, string(challengeCount) + other.challengeText, 2, c_black, 7, 1, 1, 0)
						draw_set_default()
					}
				
					draw_set_halign(fa_center)
						if (pathFollower.conditionalTarget != -1 and
						lastPathNo != -1 and
						point_distance(x, y, pathFollower.conditionalTarget.x, pathFollower.conditionalTarget.y) > 400)
							draw_text(scX, scY-sprite_height/2-90, waitingMessage)
			
						if ((isQuestTarget or isQuestTarget_direct) and (contMain.period > 3 and contMain.period < 8))
							draw_set_color(c_yellow)
						else
							draw_set_color($b3b3b3)
		
						draw_set_font(fontBeautiful)
			
							draw_text_outline(scX, scY-77, name, 2, c_black, 7, 1, 1, 0)
						draw_set_color(c_black)
			
						if (tag != "") {
							draw_set_font(fontTag) draw_set_color($b3b3b3)
								draw_text_outline(scX, scY-103, tag, 2, c_black, 7, 1, 1, 0)
						}
					draw_set_default()
				}
			
				if (stunned and !freezed)
					draw_sprite_ext(sprStunEffect, -1, scX, scY-23, 1, 1, current_time/5 mod 360, c_white, 0.8)
			}
		}
	}

	with (objPlayer) {	
		var scX = scX_player
		var scY = scY_player
	
		if (stunned)
			draw_sprite_ext(sprStunEffect, -1, scX, scY-38, 1, 1, current_time/10 mod 360, c_white, 0.8)
	
		//if (!isOutFight or hp != maxHp or mana != maxMana or energy != 100) {
			var secInsideSprite = healthBarP <= hp/maxHp ? sprBarSetInside_hp : sprBarSetInsideRed_hp
		
			draw_sprite_general(secInsideSprite, -1, 0, 0, 135*healthBarP, 12, scX-135/2, scY-100,
			1, 1, 0, c_white, c_white, c_white, c_white, 0.5)
			draw_sprite_general(sprBarSetInside_mana, -1, 0, 0, 134*manaBarP, 13, scX-67, scY-88,
			1, 1, 0, c_white, c_white, c_white, c_white, 0.5)
	
			var eneColor = energy == 100 ? c_white : c_ltgray

			if (healthBarP != 1)
				draw_sprite_general(sprBarSetInsideRed_hp, -1, 135*healthBarP, 0, 2, 12, scX-135/2+135*healthBarP, scY-100,
				1, 1, 0, c_black, c_black, c_black, c_black, 1)
	
			if (manaBarP != 1)
				draw_sprite_general(sprBarSetInside_mana, -1, 134*manaBarP, 0, 2, 13, scX-67+134*manaBarP, scY-88,
				1, 1, 0, c_black, c_black, c_black, c_black, 1)
	
			if (energyBarP < 0.98)
				draw_sprite_general(sprBarSetInside_energy, -1, 130*energy/100, 0, 2, 37, scX-65+130*energy/100, scY-104,
				1, 1, 0, c_black, c_black, c_black, c_black, 1)
	
			draw_sprite_general(sprBarSetInside_hp, -1, 0, 0, 135*hp/maxHp, 12, scX-135/2, scY-100,
			1, 1, 0, c_white, c_white, c_white, c_white, 0.65)
			draw_sprite_general(sprBarSetInside_mana, -1, 0, 0, 134*mana/maxMana, 13, scX-67, scY-88,
			1, 1, 0, c_white, c_white, c_white, c_white, 0.65)
			draw_sprite_general(sprBarSetInside_energy, -1, 0, 0, 130*energy/100, 37, scX-65, scY-104,
			1, 1, 0, eneColor, eneColor, eneColor, eneColor, 0.65)
		
			if (other.deathEffect) {
				draw_sprite_general(sprBarSetInside_hp, -1, 135*0.75, 0, 135*0.25-1, 12, scX-135/2+135*0.75+1, scY-100,
				1, 1, 0, c_red, c_red, c_red, c_red, 0.7)
			
				if (global.performanceMode != 0)
					draw_sprite_general(sprBarSetInside_hp, -1, 135*0.75-1, 0, 2, 12, scX-135/2+135*0.75-1, scY-100,
					1, 1, 0, c_black, c_black, c_black, c_black, 1)
			}
	
			draw_sprite_ext(sprBarSet, -1, scX, scY-88,
			1, 1, 0, c_white, 1)
	
			draw_sprite_ext(sprLevelSquare, 0, scX+43, scY-110, 1, 1, 0, c_gray, 1)
	
			/*var extTexpRatio = global.experience/global.targetExperience
			if (extTexpRatio <= 1)
				draw_sprite_general(sprLevelSquare, 1, 2, 0, 33*extTexpRatio, 17, scX+28, scY-119,
				1, 1, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1)*/
	
			draw_set_halign(fa_center) draw_set_valign(fa_center) draw_set_font(fontBarText)
				draw_text(scX, scY-95, string(ceil(hp)))
				draw_text(scX, scY-83, string(ceil(mana)))
			draw_set_font(fontLevel)
				draw_text(scX+43, scY-109, global.level)
			draw_set_default()
		//}
	}

	if (redScreenAlpha != 0)
		draw_sprite_ext(sprRedScreenEffect, 0, -1, -1, contView.aspectRatio*global.gui_size*global.portHeight_real/300/*sprite_get_width(sprRedScreenEffect)*/, global.gui_size*global.portHeight_real/225/*sprite_get_height(sprRedScreenEffect)*/, 0, c_white, redScreenAlpha/3+0.2)

	if (global.performanceMode != 0) {
		with (parTarget) {
			if (target == objPlayer.id and !inView and !death) {
				var dir = point_direction(objPlayer.x, objPlayer.y, x, y)
				var R = wPort-40
				var r = hPort-95
				var tandir = dtan(dir)
		
				var xx = R/2*r/2/sqrt(power(r/2, 2)+power(R/2*tandir, 2))
				var yy = tandir*xx
		
				if (dir < 270 and dir > 90) {
					xx *= -1
					yy *= -1
				}
			
				draw_sprite_ext(sprEnemyIndicator, -1,
				wPort/2+xx, hPort/2-43-yy, 1, 1, dir, c_white, 0.7)
			}
		}
	}

	draw_sprite_ext(sprSkillTableBelow, -1, wPort/2, hPort, 1, 1, 0, c_white, 1-!isOutFight/3)

	mouseOnSkillBar = false
	if (mx > wPort/2-380 and mx < wPort/2+380 and my > hPort-60 and my < hPort)
		mouseOnSkillBar = true

	mouseOnMLogo = false
	mouseOnSLogo = false
	mouseOnCLogo = false
	mouseOnBLogo = false
	mouseOnQLogo = false
	mouseOnPauseLogo = false
	mouseOnFindButton = false

	var mapY = IS_MOBILE ? 192 : hPort-35
	if (point_distance(mx, my, mLogoX, mapY) < 35+IS_MOBILE*5 and !test_upperclick_window())
		mouseOnMLogo = isOutFight
	else if (point_distance(mx, my, pauseLogoX, mapY-60) < 35+IS_MOBILE*5 and !test_upperclick_window())
		mouseOnPauseLogo = true
	
	if (my > hPort-53) {
		if (mx > sLogoX-22 and mx < sLogoX+22 and !test_upperclick_window())
			mouseOnSLogo = isOutFight
		else if (mx > cLogoX-22 and mx < cLogoX+22 and !test_upperclick_window())
			mouseOnCLogo = isOutFight
		else if (mx > bLogoX-22 and mx < bLogoX+22 and !test_upperclick_window())
			mouseOnBLogo = isOutFight
		else if (mx > qLogoX-22 and mx < qLogoX+22 and !test_upperclick_window())
			mouseOnQLogo = isOutFight
		else if (findButton_exists and mx > findButtonX-62 and mx < findButtonX+62 and !test_upperclick_window())
			mouseOnFindButton = isOutFight
	}
	
	if (outFight_alpha > 0 or IS_MOBILE) {
		var _outFight_alpha = IS_MOBILE ? (outFight_alpha-(IS_MOBILE and (contGUI.joystick_hold or contGUI.joystick2_hold))/1.5)*(1-hideSummaryInfo_alpha) : 1-!isOutFight/1.5
		draw_sprite_ext(sprMapLogo, -1, mLogoX, mapY, 1+IS_MOBILE*0.15, 1+IS_MOBILE*0.15, 0, c_white, _outFight_alpha)
		if (mouseOnMLogo) {
			draw_sprite_ext(sprMapLogo, -1, mLogoX, mapY, 1.15+IS_MOBILE*0.15+contMain.period/50, 1.15+IS_MOBILE*0.15+contMain.period/50, 0, c_white, 0.35*_outFight_alpha)
	
			shader_set(shDraw_aqua)
			var uni_alpha = contMain.uni_drawAqua_alpha*_outFight_alpha
			shader_set_uniform_f(uni_alpha, 0.4)
			draw_sprite_ext(sprMapLogo, -1, mLogoX, mapY, 1.3+IS_MOBILE*0.15+contMain.period/70, 1.3+IS_MOBILE*0.15+contMain.period/70, 0, c_white, 0)
			shader_reset()
		}
	}
	
	if (IS_MOBILE) {
		var _pauseAlpha = 1-(IS_MOBILE and (contGUI.joystick_hold or contGUI.joystick2_hold))/1.5
		draw_sprite_ext(sprPauseLogo, -1, pauseLogoX, mapY-90, 1+IS_MOBILE*0.15, 1+IS_MOBILE*0.15, 0, c_white, _pauseAlpha)
		if (mouseOnPauseLogo) {
			draw_sprite_ext(sprPauseLogo, -1, pauseLogoX, mapY-90, 1.15+IS_MOBILE*0.15+contMain.period/50, 1.15+IS_MOBILE*0.15+contMain.period/50, 0, c_white, _pauseAlpha*0.35)
	
			shader_set(shDraw_aqua)
			var uni_alpha = _pauseAlpha*contMain.uni_drawAqua_alpha
			shader_set_uniform_f(uni_alpha, 0.4)
			draw_sprite_ext(sprPauseLogo, -1, pauseLogoX, mapY-90, 1.2+IS_MOBILE*0.15+contMain.period/70, 1.2+IS_MOBILE*0.15+contMain.period/70, 0, c_white, 0)
			shader_reset()
		}
	}

	var skillLogoAlpha = 1-(!isOutFight or IS_MOBILE and (contGUI.joystick_hold or contGUI.joystick2_hold))/1.5
	if (findButton_exists) {
		draw_sprite_ext(sprFindButton, !v_isEnglish, findButtonX, hPort-35, 1, 1, 0, isOutFight ? c_white : c_gray, skillLogoAlpha)
		if (mouseOnFindButton or findQuestion) {
			shader_set(shDraw_aqua)
			var uni_alpha = contMain.uni_drawAqua_alpha
			shader_set_uniform_f(uni_alpha, 0.4)
			draw_sprite_ext(sprFindButton, !v_isEnglish, findButtonX, hPort-35, 1.03+contMain.period/170, 1.1+contMain.period/130, 0, c_white, 0)
			shader_reset()
		}
	}

	var isActive_skills = contMain.isActive_skills
	draw_sprite_ext(sprWindowLogoBack, mouseOnSLogo, sLogoX, hPort-27, 1, 1, 0, isActive_skills ? c_white : c_dkgray, 1)
	draw_sprite_ext(sprSkillsLogo, -1, sLogoX, hPort-27, 1-!mouseOnSLogo*0.2, 1-!mouseOnSLogo*0.2, 0, isActive_skills ? c_white : c_dkgray, skillLogoAlpha)

	draw_sprite_ext(sprWindowLogoBack, mouseOnCLogo, cLogoX, hPort-27, 1, 1, 0, c_white, 1)
	draw_sprite_ext(sprCharInfoLogo, -1, cLogoX, hPort-27, 1-!mouseOnCLogo*0.2, 1-!mouseOnCLogo*0.2, 0, c_white, skillLogoAlpha)

	draw_sprite_ext(sprWindowLogoBack, mouseOnBLogo, bLogoX, hPort-27, 1, 1, 0, c_white, 1)
	draw_sprite_ext(sprBagLogo, -1, bLogoX, hPort-27, 1-!mouseOnBLogo*0.2, 1-!mouseOnBLogo*0.2, 0, c_white, skillLogoAlpha)

	draw_sprite_ext(sprWindowLogoBack, mouseOnQLogo, qLogoX, hPort-27, 1, 1, 0, c_white, 1)
	draw_sprite_ext(sprQuestLogo, -1, qLogoX, hPort-27, 1-!mouseOnQLogo*0.2, 1-!mouseOnQLogo*0.2, 0, c_white, skillLogoAlpha)
	
	if (hlSDis != 0)
		draw_sprite_ext(sprWindowLogoBack, 1, sLogoX, hPort-hlSDis*1.25, 1, 0.3, 0, hlSLogoColor, isActive_skills*hlSDis/40)
	
	if (hlCDis != 0)
		draw_sprite_ext(sprWindowLogoBack, 1, cLogoX, hPort-hlCDis*1.25, 1, 0.3, 0, hlCLogoColor, hlCDis/40)
		
	if (hlQDis != 0)
		draw_sprite_ext(sprWindowLogoBack, 1, qLogoX, hPort-hlQDis*1.25, 1, 0.3, 0, hlQLogoColor, hlQDis/40)

	draw_set_valign(fa_center) draw_set_halign(fa_center)
		if (global.virtual_stat_points > 0) {		
			draw_sprite(sprWindowLogoUpperBack, -1, cLogoX, hPort-64)
		
			draw_set_font(fontMain_small)
			draw_text(cLogoX, hPort-64, string(global.virtual_stat_points))
			draw_set_color(c_black)
		}
	
		if (global.activeQuestCount > 0) {
			draw_sprite(sprWindowLogoUpperBack, -1, qLogoX, hPort-64)
		
			draw_set_font(fontMain_small)
			draw_text(qLogoX, hPort-64, string(global.activeQuestCount))
			draw_set_color(c_black)
		}
		
		if (global.skillPoints > 0 and isActive_skills) {
			draw_sprite(sprWindowLogoUpperBack, -1, sLogoX, hPort-64)
		
			draw_set_font(fontMain_small)
			draw_text(sLogoX, hPort-64, string(global.skillPoints))
			draw_set_color(c_black)
		}
	draw_set_default()
	
	for (var i = 0; i < 5; i++) {
		var xx = wPort/2-117+i*2*29.5
	
		if (i != 4 or !mouseOnSkillBox[4]) {
			if (objPlayer.mana < global.selectedSkillMana[i])
				draw_sprite_ext(sprSkillColor, 2, xx, hPort-46, 1, 1, 0, (selectedSkill_colortime[i] == 0) ? c_white : c_purple, 1)
			else
				draw_sprite_ext(sprSkillColor, global.selectedSkillRem[i] == 0, xx, hPort-46, 1, 1, 0, (selectedSkill_colortime[i] == 0) ? c_white : c_purple, 1)
		}
		else
			draw_sprite_ext(sprSkillColor, 4, xx, hPort-46, 1, 1, 0, c_white, 1)
		
		if (i == 4)
			draw_sprite_ext(sprSkillColor, 5, xx, hPort-46, 1, 1, 0, c_white, 1)
		
		if (global.itemSelected != -1 and instance_exists(global.itemSelected) and global.itemSelected.i == i and global.itemSelected.from == "Skill Boxes")
			draw_sprite_ext(sprSkillColor, 3, xx, hPort-46, 1, 1, 0, c_black, 0.5)
		else if (mouseOnSkillBox[i] and i != 4)
			draw_sprite_ext(sprSkillColor, 3, xx, hPort-46, 1, 1, 0, c_white, 0.5)
		
		if (tbW[i] != -1) {
			if !(global.itemSelected != -1 and instance_exists(global.itemSelected) and global.itemSelected.i == i and global.itemSelected.from == "Skill Boxes")
				draw_sprite(skillSprite[i], -1, wPort/2-118+i*119/2, hPort-46)
		
			var y2 = hPort-70+48*global.selectedSkillRem[i]/global.selectedSkillMaxRem[i]
		
			if (global.selectedSkillRem[i] > 3) {
				draw_set_alpha(0.7)
					draw_rectangle(wPort/2-140+i*59, hPort-70, wPort/2-95+i*59, y2, 0)
				draw_set_alpha(1)
			
				draw_rectangle(wPort/2-140+i*59, y2-1, wPort/2-95+i*59, y2+1, 0)
			}
		
			if (objPlayer.mana < global.selectedSkillMana[i]) {
				draw_set_alpha(0.5) draw_set_color(c_blue) 
					draw_rectangle(wPort/2-140+i*59, hPort-70, wPort/2-95+i*59, hPort-22, 0)
				draw_set_alpha(1) draw_set_color(c_black)
			}
			
			if (((objPlayer.noArms or objPlayer.stunned) and i != 4) or global.skillBar != 0)
				draw_sprite_ext(sprSkillColor, 3, xx, hPort-46, 1, 1, 0, c_black, 0.7)
		}
	}

	draw_sprite(sprSkillTable, -1, wPort/2, hPort-45)

	draw_set_center() draw_set_font(fontInfo_small)
	for (var i = 0; i < 5; i++) {
		var xx = wPort/2-118+i*119/2
	
		draw_set_alpha(0.5)
			draw_rectangle(xx-24, hPort-11, xx+24, hPort, 0)
	
			draw_set_color(c_white)
				if (i != 4)
					draw_text(xx, hPort-8, string(i+1))
				else
					draw_text(xx, hPort-8, IS_MOBILE ? "MAIN" : "CTRL")
			draw_set_color(c_black)
		draw_set_alpha(1)
	}
	draw_set_default()

	if (global.skillBar > 0) {
		var barL = 322/100*global.skillBar
		draw_sprite_general(sprSkillBarInside, 0, 3, 0, barL, 104, wPort/2-158, hPort-104, 1, 1, 0, c_white, c_white, c_white, c_white, 1)
	}

	if (my > hPort-200) {
		var textBox_exists = false
		for (var i = 0; i < 5; i++) {
			mouseOnSkillBox[i] = false
		
			if (mx < wPort/2-93+i*59 and mx > wPort/2-143+i*59 and
			my < hPort-21 and my > hPort-71 or device_mouse_check_button(1, mb_left) and
			device_mouse_x_to_gui(1) < wPort/2-93+i*59 and device_mouse_x_to_gui(1) > wPort/2-143+i*59 and
			device_mouse_y_to_gui(1) < hPort-21 and device_mouse_y_to_gui(1) > hPort-71) {
				if (skillText_alpha < 0.94)
					skillText_alpha += 0.08
				else
					skillText_alpha = 0.94
			
				if (tbW[i] != -1) {
					show_textbox_tcolor(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
					tbT[i], tbW[i], tbH[i], skillText_alpha)
				}
				mouseOnSkillBox[i] = true
				textBox_exists = true
			}
		}
	
		if (!textBox_exists)
			skillText_alpha = 0
	}

	if (expBarAlpha != 0) {
		var hasComboText =  global.comboCount > 1
		draw_set_alpha(expBarAlpha) draw_set_font(fontGUI) draw_set_color(hasComboText ? c_aqua : c_yellow) draw_set_halign(fa_center) draw_set_valign(fa_center)
			var expText_size = hasComboText ? (expBarAlpha > 1 ? expBarAlpha : 1) : 0.95
			draw_text_outline(wPort/2, 48, hasComboText ? (ltext_combo+": "+string(global.comboCount)) : ltext_barexperience, 2, c_black, global.performanceOutFidelty, expText_size, expText_size, 0)
		draw_set_alpha(1) draw_set_default()
		
		var expLength = min(320, 320*global.experience/global.targetExperience)
		var previousExpLength = 320*global.previousExperience/global.targetExperience
	
		if (global.comboCount > 1) {
			var expWithComboLength = min(320, 320*(global.experience+calculate_givenexperience(global.comboExperience))/global.targetExperience)
		
			draw_sprite_general(sprExpBarInsideAqua, -1, expLength, 0, expWithComboLength-expLength, 17, wPort/2-160*1.5+expLength*1.5, 80, 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 0.7*expBarAlpha)
			draw_sprite_general(sprExpBarInside, -1, expWithComboLength-1, 0, 2, 17, wPort/2-160*1.5+expWithComboLength*1.5-1, 80, 1.5, 1.5, 0, c_black, c_black, c_black, c_black, expBarAlpha)
		}
	
		draw_sprite_general(sprExpBarInside, -1, 0, 0, expLength, 17, wPort/2-160*1.5, 80, 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 0.7*expBarAlpha)
		draw_sprite_general(sprExpBarInside, -1, 0, 0, previousExpLength, 17, wPort/2-160*1.5, 80, 1.5, 1.5, 0, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0.5*expBarAlpha)
	
		draw_sprite_general(sprExpBarInside, -1, expLength-1, 0, 2, 17, wPort/2-160*1.5+expLength*1.5-1, 80, 1.5, 1.5, 0, c_black, c_black, c_black, c_black, expBarAlpha)
		draw_sprite_general(sprExpBarInside, -1, previousExpLength-1, 0, 2, 17, wPort/2-160*1.5+previousExpLength*1.5-1, 80, 1.5, 1.5, 0, c_black, c_black, c_black, c_black, expBarAlpha)
	
		draw_sprite_ext(sprExpBar, -1, wPort/2, 80, 1.5, 1.5, 0, c_white, expBarAlpha)
	}

	var totH = 0
	if (ds_list_size(global.fixedMessages) > 0) {
		draw_set_alpha(1/1.4) draw_set_color(c_black)
			draw_roundrect(wPort-maxFixedMessageW-26, 11-IS_MOBILE*2, wPort+5, 8-IS_MOBILE*2+fixedMessageTotH, 0)
		draw_set_alpha(1/5) draw_set_color(c_aqua)
			draw_roundrect(wPort-maxFixedMessageW-24, 13-IS_MOBILE*2, wPort+5, 6-IS_MOBILE*2+fixedMessageTotH, 0)
		draw_set_color(c_black)
			draw_roundrect(wPort-maxFixedMessageW-22, 15-IS_MOBILE*2, wPort+5, 4-IS_MOBILE*2+fixedMessageTotH, 0)
		draw_set_alpha(0.7) draw_set_color(c_white)
	
		draw_set_font(fontFixedMessage) draw_set_halign(fa_left) draw_set_valign(fa_top)
			var ds_size = ds_list_size(global.fixedMessages)
			for (var i = 0; i < ds_size; i++) {	
				var activation = ds_list_find_value(global.fixedMessageActivations, i)
				if (activation == 0)
					if (contMain.period > 4)
						draw_set_color(c_green)
					else
						draw_set_color(c_yellow)
				else if (activation == -1)
					draw_set_color(c_white)
				else
					draw_set_color(c_gray)
			
				draw_text(wPort-10-maxFixedMessageW, 19+i*(8-IS_MOBILE*2)+totH-IS_MOBILE*2,
				ds_list_find_value(global.fixedMessages, i))
			
				totH += ds_list_find_value(fixedMessageH, i)
			}
		draw_set_default() draw_set_alpha(1)
	}

	if (outFight_alpha > 0) {
		var _outFight_alpha = outFight_alpha*(1-hideSummaryInfo_alpha)
		draw_set_alpha(0.6*_outFight_alpha)
			draw_roundrect(14+IS_MOBILE*52, 76, 205+IS_MOBILE*52, 160-IS_MOBILE*2, 0)
		draw_set_alpha(_outFight_alpha)
		draw_sprite(sprCoin, -1, 33+IS_MOBILE*52, 123-IS_MOBILE*2)
		draw_set_font(fontMessageTitle) draw_set_valign(fa_bottom) draw_set_color(c_gold)
		    draw_text_outline(48+IS_MOBILE*52, 140, string(floor(global.money)), 2, c_black, global.performanceOutFidelty, 1, 1, 0)
		draw_set_color(c_white)
			draw_text_outline(21+IS_MOBILE*52, 112, ltext_level2+string(global.level), 2, c_black, global.performanceOutFidelty, 1, 1, 0)
		draw_set_default() draw_set_alpha(outFight_alpha*_outFight_alpha)
	
		draw_rectangle(20+IS_MOBILE*52, 139-IS_MOBILE*2, 195+IS_MOBILE*52, 153, 0)
		draw_set_color(windowColor)
			draw_rectangle(22+IS_MOBILE*52, 141-IS_MOBILE*2, 193+IS_MOBILE*52, 152, 0)
		draw_set_color(c_gray)
			draw_rectangle(24+IS_MOBILE*52, 143-IS_MOBILE*2, 191+IS_MOBILE*52, 149, 0)
		draw_set_color(c_gold)
			var lastX_experienceBar = 24+167*global.experience/global.targetExperience+IS_MOBILE*52
			draw_rectangle(24+IS_MOBILE*52, 143-IS_MOBILE*2, lastX_experienceBar, 149, 0)
		draw_set_color(c_black)
			draw_rectangle(lastX_experienceBar-1, 139-IS_MOBILE*2, lastX_experienceBar+1, 153, 0)
		draw_set_alpha(1)
		
		draw_set_font(fontBeautiful) draw_set_color(c_white) draw_set_alpha(_outFight_alpha)
			draw_text_outline(18+IS_MOBILE*52, 160+IS_MOBILE*5, contMain.roomName, 2, c_black, global.performanceOutFidelty, 1, 1, 0)
			draw_text_outline(18+IS_MOBILE*52, 185+IS_MOBILE*5, ltext_daytime, 2, c_black, global.performanceOutFidelty, 1, 1, 0)
			if (!IS_MOBILE and global.gamepad_active)
				draw_text_outline(18+IS_MOBILE*52, 210+IS_MOBILE*5, ltext_mode, 2, c_black, global.performanceOutFidelty, 1, 1, 0)
		draw_set_default() draw_set_alpha(1)
	}
	
	if (surface_exists(global.minimapSurface))
		draw_surface(global.minimapSurface, 13-IS_MOBILE*7, display_get_gui_height()-82-contMain.miniMap_height+(IS_MOBILE and !findButton_exists)*60+IS_MOBILE*7)

	if (!IS_MOBILE) {
		if (mouseOnMLogo)
			show_textbox(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), eng() ? "Map" : "Harita")
		else if (mouseOnBLogo)
			show_textbox(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), eng() ? "Item Bag" : "Eşyalar")
		else if (mouseOnQLogo)
			show_textbox(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), eng() ? "Quests" : "Görevler")
		else if (mouseOnSLogo)
			show_textbox(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), eng() ? "Skills" : "Beceriler")
		else if (mouseOnCLogo)
			show_textbox(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), eng() ? "Character" : "Karakter")
	}
}

if (colorScreenAlpha != 0) {
	draw_set_alpha(colorScreenAlpha) draw_set_color(colorScreenColor)
		draw_rectangle(-1, -1, wPort, hPort, 0)
	draw_set_alpha(1) draw_set_color(c_black)
}

if (roomNameAlpha != 0) {
	draw_set_font(fontRoomName) draw_set_halign(fa_center) draw_set_valign(fa_top)
	
	if (!surface_exists(textShadow_surface))
		textShadow_surface = create_surface(display_get_gui_width(), display_get_gui_height())
		
	surface_set_target(textShadow_surface)
		draw_clear_alpha(c_black, 0)
		
		for (var i = 45; i < 405; i += 360/9)
		    draw_text_transformed(wPort/2+lengthdir_x(1.9, i), 100+lengthdir_y(1.9, i)-2
			, global.locationName, 1-IS_MOBILE*0.2, 1-IS_MOBILE*0.2, 0)
	surface_reset_target() draw_set_color(c_black)
	
	draw_set_alpha(roomNameAlpha)
		draw_surface(textShadow_surface, 0, 0)
	
	draw_set_color(c_ltorange)
		draw_text_transformed(wPort/2, 100, global.locationName, 1-IS_MOBILE*0.2, 1-IS_MOBILE*0.2, 0)
		
	draw_set_default() draw_set_alpha(1)
}

if (global.halfFPS_warning) {
	draw_set_color(c_red)
		draw_text(15, 430, "Half FPS Warning! Try press F4 one time.")
	draw_set_color(c_black)
}

if (showFPS) {
	draw_set_halign(fa_left) draw_set_valign(fa_top) draw_set_font(fontMain_small) draw_set_alpha(0.5)
		draw_text(15, 460, "FPS Warning!\nFPS: "+string(fps)+"\nRS: "+string(room_speed))
	draw_set_default() draw_set_alpha(1)
}

if (IS_MOBILE and !is_room_out()) {
	/*for (var i = 0; i < 5; i++)
		if (device_mouse_check_button(i, mb_left))
			draw_text(device_mouse_x_to_gui(i), device_mouse_y_to_gui(i)-80, i)*/
	
	draw_set_alpha(0.45) draw_set_color(c_white)
	
	if (joystick_hold) {
		draw_sprite_ext(sprJoystickBase_left, -1, JOYSTICK_CENTER_X, JOYSTICK_CENTER_Y, 1, 1, 0, c_white, 1)
		
		var dir = point_direction(JOYSTICK_CENTER_X, JOYSTICK_CENTER_Y, device_mouse_x_to_gui(joystick_hold_device), device_mouse_y_to_gui(joystick_hold_device))
		var dis = point_distance(JOYSTICK_CENTER_X, JOYSTICK_CENTER_Y, device_mouse_x_to_gui(joystick_hold_device), device_mouse_y_to_gui(joystick_hold_device))
		draw_sprite_ext(sprJoystick, -1,
						JOYSTICK_CENTER_X+lengthdir_x(min(dis, JOYSTICK_R), dir),
						JOYSTICK_CENTER_Y+lengthdir_y(min(dis, JOYSTICK_R), dir),
						1, 1, 0, c_white, 1)
					
		joystick_dir = dir
		joystick_dis = dis
	}
		
	if (joystick2_hold) {
		var joystick_r = contPlayer.melee ? JOYSTICK_R : JOYSTICK2_R
		
		if (contPlayer.melee)
			draw_sprite_ext(sprJoystickBase_left, -1, JOYSTICK2_CENTER_X, JOYSTICK2_CENTER_Y, 1, 1, 0, c_white, 1)
		else
			draw_sprite_ext(sprJoystickBase_right, -1, JOYSTICK2_CENTER_X, JOYSTICK2_CENTER_Y, 1, 1, 0, c_white, 1)
		
		var dir = point_direction(JOYSTICK2_CENTER_X, JOYSTICK2_CENTER_Y, device_mouse_x_to_gui(joystick2_hold_device), device_mouse_y_to_gui(joystick2_hold_device))
		var dis = point_distance(JOYSTICK2_CENTER_X, JOYSTICK2_CENTER_Y, device_mouse_x_to_gui(joystick2_hold_device), device_mouse_y_to_gui(joystick2_hold_device))
		draw_sprite_ext(sprJoystick, -1,
						JOYSTICK2_CENTER_X+lengthdir_x(min(dis, joystick_r), dir),
						JOYSTICK2_CENTER_Y+lengthdir_y(min(dis, joystick_r), dir),
						1, 1, 0, c_white, 1)

		joystick2_dir = point_direction(JOYSTICK2_CENTER_X, JOYSTICK2_CENTER_Y, device_mouse_x_to_gui(joystick2_hold_device), device_mouse_y_to_gui(joystick2_hold_device))
		joystick2_dis = dis
	}
	else
		joystick2_dis = 0

	draw_sprite_ext(sprButtonSpeedBoost, -1, BUTTON_SPEEDBOOST_X, BUTTON_SPEEDBOOST_Y, 1, 1, 0, objPlayer.energy == 100 ? c_white : c_gray, 1-colorScreenAlpha)
	draw_sprite_ext(sprButtonWeaponChange, has_shield(), BUTTON_WEAPONCHANGE_X, BUTTON_WEAPONCHANGE_Y, 1, 1, 0, objPlayer.stance == stShieldMode ? c_gray : c_white, 1-colorScreenAlpha)
	
	var skillAlpha = 0.5*(1-colorScreenAlpha)
	if (!objPlayer.death and !global.consoleMode and global.skillBar == 0
	and !objPlayer.stunned and !objPlayer.noArms)
		skillAlpha = 1
	skillAlpha *= (1-colorScreenAlpha)
	
	if (global.selectedSkill[4] != -1) {
		draw_sprite_ext(sprMainBS, -1, BUTTON_MAIN_X, BUTTON_MAIN_Y, 1.2, 1.2, 0, c_white, global.selectedSkillRem[4] == 0 ? skillAlpha : skillAlpha/2)
		if (global.selectedSkillMana[4] > objPlayer.mana) {
			draw_set_color(c_blue) draw_set_alpha(0.4)
				draw_circle(BUTTON_MAIN_X, BUTTON_MAIN_Y, 30, false)
			draw_set_color(c_black)
		}
		
		draw_set_alpha(0.4) draw_set_color(c_black)
			draw_circle(BUTTON_MAIN_X, BUTTON_MAIN_Y, global.selectedSkillRem[4]/global.selectedSkillMaxRem[4]*30, false)
	}
	
	if (global.selectedSkill[0] != -1) {
		draw_sprite_ext(skillSprite[0], -1, BUTTON_SKILL1_X, BUTTON_SKILL1_Y, 1.2, 1.2, 0, c_white,  global.selectedSkillRem[0] == 0 ? skillAlpha : skillAlpha/2)
		if (global.selectedSkillMana[0] > objPlayer.mana) {
			draw_set_color(c_blue) draw_set_alpha(0.4)
				draw_circle(BUTTON_SKILL1_X, BUTTON_SKILL1_Y, 30, false)
			draw_set_color(c_black)
		}
		
		draw_set_alpha(0.4) draw_set_color(c_black)
			draw_circle(BUTTON_SKILL1_X, BUTTON_SKILL1_Y, global.selectedSkillRem[0]/global.selectedSkillMaxRem[0]*30, false)
	}
	
	if (global.selectedSkill[1] != -1) {
		draw_sprite_ext(skillSprite[1], -1, BUTTON_SKILL2_X, BUTTON_SKILL2_Y, 1.2, 1.2, 0, c_white,  global.selectedSkillRem[1] == 0 ? skillAlpha : skillAlpha/2)
		if (global.selectedSkillMana[1] > objPlayer.mana) {
			draw_set_color(c_blue) draw_set_alpha(0.4)
				draw_circle(BUTTON_SKILL2_X, BUTTON_SKILL2_Y, 30, false)
			draw_set_color(c_black)
		}
		
		draw_set_alpha(0.4) draw_set_color(c_black)
			draw_circle(BUTTON_SKILL2_X, BUTTON_SKILL2_Y, global.selectedSkillRem[1]/global.selectedSkillMaxRem[1]*30, false)
	}
	
	draw_set_alpha(1) draw_set_color(c_black)
}