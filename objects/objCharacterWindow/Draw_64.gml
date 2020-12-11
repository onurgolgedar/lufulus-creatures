var mainAlpha = image_alpha

var _extraHeight = extraHeight-66*(page != 2)-(30-20*IS_MOBILE)*(page == 1)

var m_end_x = x+horizontalBoxCount*(boxWidth+boxBetween)-boxBetween+offset_x*2+extraWidth
var m_end_y = y+verticalBoxCount*(boxHeight+(boxBetween+boxBetween_additionalV))-(boxBetween+boxBetween_additionalV)+offset_yTop+offset_yDown+_extraHeight

draw_set_alpha(mainAlpha) gpu_set_tex_filter(1)
	draw_set_alpha(mainAlpha/1.2)
	draw_roundrect(x, y, m_end_x,
	m_end_y, 0)
    draw_set_color(front ? windowColor_main : c_gray) draw_set_alpha(mainAlpha/4)
	    draw_roundrect(x+2, y+2, m_end_x-2,
		m_end_y-2,
		0)
	draw_set_color(windowColor)
        draw_roundrect(x+4, y+4, m_end_x-4,
		m_end_y-4,
		0)
	draw_set_color(c_ltgray) draw_set_alpha(mainAlpha/2)
		draw_rectangle(x+5, y+4+75, m_end_x-4,
		m_end_y-4, 0)
	draw_set_color(c_black) draw_set_alpha(mainAlpha)
	draw_roundrect(x, y, m_end_x,
	m_end_y, 1)
    
	if (page == 2) {
		draw_set_color(c_white)
		draw_set_font(fontMessageTitle)
			draw_text(x+offset_x, y+offset_x+31+IS_MOBILE*4, ltext_info)
		draw_set_color(c_black)
			
		draw_set_font(fontCharacterWindow)
		
		var weaponInfo = eng() ? "Attack Type: ???" : "Saldırı Türü: ???"
		if (!objPlayer.noArms) {
			if (is_mweapon_onhand() and global.weaponType != wtype_shield)
				weaponInfo = eng() ? "Attack Type: Ranged" : "Saldırı Türü: Menzilli"
			else if (is_sweapon_onhand())
				weaponInfo = eng() ? "Attack Type: Melee" : "Saldırı Türü: Yakın"
		}
		else
			weaponInfo = ""
			
		var statisticsInfo
		if (!objPlayer.noArms) {
			statisticsInfo = eng() ? ("\n"+weaponInfo
			+"\nPhysical Power: "+string(ceil(objPlayer.physicalPower))
			+"\nAttack Speed: "+((global.attackSpeed < 10) ? string(global.attackSpeed) : "-")+" hit/s"
			+"\nCritical Chance: "+string(global.criticalChance)+"%"
			+"\nCritical Power: "+string(1+global.criticalFactor)+"x"
			+"\nMagical Power: "+string (ceil(global.magicalPower)))
			: ("\n"+weaponInfo
			+"\nFiziksel Güç: "+string(ceil(objPlayer.physicalPower))
			+"\nSaldırı Hızı: "+((global.attackSpeed < 10) ? string(global.attackSpeed) : "-")+" vuruş/s"
			+"\nKritik İhtimali: %"+string(global.criticalChance)
			+"\nKritik Gücü: "+string(1+global.criticalFactor)+"x"
			+"\nBüyü Gücü: "+string (ceil(global.magicalPower)))
		}
		else {
			var unknownText = eng() ? "[c="+string(c_customred3)+"]Unarmed[/c]" : "[c="+string(c_customred3)+"]Silahsızsın[/c]"
				
			statisticsInfo = eng() ? ("\n"+weaponInfo
			+"\nPhysical Power: "+unknownText
			+"\nAttack Speed: "+unknownText
			+"\nCritical Chance: "+unknownText
			+"\nCritical Power: "+unknownText
			+"\nMagical Power: "+unknownText) 
			: ("\n"+weaponInfo
			+"\nFiziksel Güç: "+unknownText
			+"\nSaldırı Hızı: "+unknownText
			+"\nKritik İhtimali: "+unknownText
			+"\nKritik Gücü: "+unknownText
			+"\nBüyü Gücü: "+unknownText) 
		}
		
		var ltext = eng() ? ("Health: [c="+string(c_customgreen2)+"]"+string(ceil(objPlayer.hp))+"/"+string(ceil(objPlayer.maxHp))+"[/c]"
		+"\nMana: [c="+string(c_customblue)+"]"+string(ceil(objPlayer.mana))+"/"+string(ceil(objPlayer.maxMana))+"[/c]"
		+"\nArmor: "+string(round(objPlayer.armor))+"%"
		+"\nResistance: "+string(round(objPlayer.resistance))+"%"
		+"\n"+statisticsInfo
		+"\n\nEXP: "+string(global.experience)+"/"+string(global.targetExperience)+" ("+string(round(global.experience/global.targetExperience*100))+"%)"
		+"\nMovement Speed: "+string(floor(global.movementSpeed*5))
		+"\n\n[c="+string(c_navy)+"]General Score: "+string(global.game_score)+"\nYour Record: "+string(global.steamScore)+" (#"+string(global.steamRank)+")[/c]") : ("Can: [c="+string(c_customgreen2)+"]"+string(ceil(objPlayer.hp))+"/"+string(ceil(objPlayer.maxHp))+"[/c]"
		+"\nMana: [c="+string(c_customblue)+"]"+string(ceil(objPlayer.mana))+"/"+string(ceil(objPlayer.maxMana))+"[/c]"
		+"\nZırh: "+string(round(objPlayer.armor))+"%"
		+"\nBüyü Direnci: "+string(round(objPlayer.resistance))+"%"
		+"\n"+statisticsInfo
		+"\n\nEXP: "+string(global.experience)+"/"+string(global.targetExperience)+" (%"+string(round(global.experience/global.targetExperience*100))+")"
		+"\nHareket Hızı: "+string(floor(global.movementSpeed*5))
		+"\n\n[c="+string(c_navy)+"]Genel Skor: "+string(global.game_score)+"\nKendi Rekorun: "+string(global.steamScore)+" (#"+string(global.steamRank)+")[/c]")
		
		draw_text_colortags(x+offset_x, y+offset_x+75, ltext)
	}
	else if (page == 1) {
		draw_set_color(c_white)
		draw_set_font(fontMessageTitle)
			draw_text(x+offset_x, y+offset_x+31+IS_MOBILE*4, ltext_stats)
		draw_set_color(c_black)
			
		statX = x+offset_x+36+IS_MOBILE*10
		statY = y+offset_x+75+IS_MOBILE*5
		statBetween = 34+IS_MOBILE*13
		draw_set_font(fontCharacterWindow)
		    draw_text_colortags(statX, statY,
			ltext_str+string(round(global.givenStr+global.virtual_str))+string_return(" [c="+string(c_customgreen2)+"](+"+string_format(global.str-global.givenStr-global.virtual_str, 0, 1)+")[/c]", global.str-global.givenStr-global.virtual_str > 0))
			statY += statBetween
			
			draw_text_colortags(statX, statY,
			+ltext_dex+string(round(global.givenDex+global.virtual_dex))+string_return(" [c="+string(c_customgreen2)+"](+"+string_format(global.dex-global.givenDex-global.virtual_dex, 0, 1)+")[/c]", global.dex-global.givenDex-global.virtual_dex > 0))
			statY += statBetween
			
			draw_text_colortags(statX, statY,
			+ltext_vit+string(round(global.givenVit+global.virtual_vit))+string_return(" [c="+string(c_customgreen2)+"](+"+string_format(global.vit-global.givenVit-global.virtual_vit, 0, 1)+")[/c]", global.vit-global.givenVit-global.virtual_vit > 0))
			statY += statBetween
			
			draw_text_colortags(statX, statY,
			+ltext_mp+string(round(global.givenMp+global.virtual_mp))+string_return(" [c="+string(c_customgreen2)+"](+"+string_format(global.mp-global.givenMp-global.virtual_mp, 0, 1)+")[/c]", global.mp-global.givenMp-global.virtual_mp > 0))
			statY += statBetween
			
			draw_text_colortags(statX, statY,
			+ltext_sta+string(round(global.givenSta+global.virtual_sta))+string_return(" [c="+string(c_customgreen2)+"](+"+string_format(global.sta-global.givenSta-global.virtual_sta, 0, 1)+")[/c]", global.sta-global.givenSta-global.virtual_sta > 0))
			statY += statBetween
			
			draw_set_font(fontPoints)
				draw_text_colortags(x+offset_x, y+offset_x+75+189+IS_MOBILE*75, "[c="+string(global.virtual_stat_points == 0 ? c_white : c_ltgreen)+"] "+ltext_availablepoints+string(global.virtual_stat_points)+"[/c]")
			draw_set_font(fontCharacterWindow)
			
			draw_text_colortags(x+offset_x, y+offset_x+75+181, ""/*"\n\n\n\n\n\n"+ltext_level+": "+string(global.level)
			+"\n"+ltext_exp+": "*/)
	}
	else if (page == 3) {
		draw_set_color(c_white)
		draw_set_font(fontMessageTitle)
			draw_text(x+offset_x, y+offset_x+31+IS_MOBILE*4, ltext_tags)
		draw_set_color(c_black)
			
		draw_set_font(fontBeautiful)
		var ds_size = ds_list_size(global.titles)
		for (var i = 0; i < ds_size; i++) {
			draw_set_color(c_aqua) draw_set_alpha(mainAlpha)
				draw_roundrect(x+offset_x+8, y+offset_x+75+i*30+2, x+offset_x+155, y+offset_x+75+i*30+24, 0)
			draw_set_color(c_teal) draw_set_alpha(0.7*mainAlpha)
				draw_roundrect(x+offset_x+6, y+offset_x+75+i*30, x+offset_x+157, y+offset_x+75+i*30+26, 0)
			draw_set_color(c_black) draw_set_alpha(mainAlpha)
			
			draw_text(x+offset_x+13, y+offset_x+75+i*30,/* string(i+1)+". "+*/ds_list_find_value(global.titles, i))
		}
	}
    draw_set_font(global.mainFont) draw_set_color(c_black)
	
    // Exit button
    exitButtonEdge = 30+IS_MOBILE*6
    exitButton_x = x+horizontalBoxCount*(boxWidth+boxBetween)-boxBetween+offset_x*2-offset_x+extraWidth-exitButtonEdge
    exitButton_y = y+offset_x
    
    if (front and mouseOnBody and device_mouse_x_to_gui(0) > exitButton_x and device_mouse_x_to_gui(0) < exitButton_x+exitButtonEdge and
    device_mouse_y_to_gui(0) > exitButton_y and device_mouse_y_to_gui(0) < exitButton_y+exitButtonEdge) {
        draw_set_color(c_red)
        mouseOnExit = true
    }
    else {
        draw_set_color(c_customred1)
        mouseOnExit = false
    }
		// Button Outline
		var beforeColor = draw_get_color() draw_set_color(c_black)
		draw_roundrect(exitButton_x-2, exitButton_y-2,
		exitButton_x+exitButtonEdge+2, exitButton_y+exitButtonEdge+2, 0)
		draw_set_color(beforeColor)
        
        draw_roundrect(exitButton_x, exitButton_y,
        exitButton_x+exitButtonEdge, exitButton_y+exitButtonEdge, 0)
    draw_set_color(c_black)
	draw_sprite(sprExitButton, -1, exitButton_x+exitButtonEdge/2, exitButton_y+exitButtonEdge/2)
	
	/*if (page == 1 or page == 2) {
		// EXP Bar
		var expbar_xoffset = eng() ? 0 : -20
		draw_rectangle(x+127+5+expbar_xoffset, y+420+7, x+267+5+expbar_xoffset, y+440+7, 0)
		draw_set_color(windowColor)
			draw_rectangle(x+127+5+2+expbar_xoffset, y+420+7+2, x+263+5+2+expbar_xoffset, y+440+7-2, 0)
		draw_set_color(c_gray)
			draw_rectangle(x+127+5+2+expbar_xoffset, y+420+7+2, x+263+5+2+expbar_xoffset, y+440+7-2, 0)
		draw_set_color(c_gold)
			draw_rectangle(x+127+5+2+expbar_xoffset, y+420+7+2, x+127+global.experience/global.targetExperience*136+5+2+expbar_xoffset, y+440+7-2, 0)
		draw_set_color(c_black)
		
		draw_set_valign(fa_center) draw_set_halign(fa_center)
			draw_text(x+194+5+expbar_xoffset, y+440-2, string(floor(global.experience))+"/"+string(global.targetExperience))
		draw_set_default()
	}*/

	if (page == 1) {
		var isSkillsActive = global.selectedSkill[4] == objMainBS
		if (!isSkillsActive) {
			draw_set_color(c_black)
				draw_text(x+offset_x+3, y+353+IS_MOBILE*27, ltext_mpsta)
			draw_set_color(c_black)
		}
		
		// Undo button
		var undoButtonWidth = 90
		var undoButtonHeight = 23+IS_MOBILE*5
		undoButton_x = x+150
		undoButton_y = y+310+IS_MOBILE*12
    
		if (front and mouseOnBody and device_mouse_x_to_gui(0) > undoButton_x and device_mouse_x_to_gui(0) < undoButton_x+undoButtonWidth and
		device_mouse_y_to_gui(0) > undoButton_y and device_mouse_y_to_gui(0) < undoButton_y+undoButtonHeight) {
		    draw_set_color(c_lime)
		    mouseOnUndoButton = true
		}
		else {
		    draw_set_color(c_green)
		    mouseOnUndoButton = false
		}
		
		if (global.statPoints == global.virtual_stat_points)
			if (mouseOnUndoButton) draw_set_color(c_gray) else draw_set_color(c_dkgray)
    
		// Button Outline
		var beforeColor = draw_get_color() draw_set_color(c_black)
		draw_roundrect(undoButton_x-2, undoButton_y-2,
		undoButton_x+undoButtonWidth+2, undoButton_y+undoButtonHeight+2, 0)
		draw_set_color(beforeColor)	
		
		draw_roundrect(undoButton_x, undoButton_y,
		undoButton_x+undoButtonWidth, undoButton_y+undoButtonHeight, 0)
		draw_set_color(c_black)
    
		draw_set_center()
		    draw_text(undoButton_x+undoButtonWidth/2, undoButton_y+undoButtonHeight/2, ltext_undo)
		draw_set_default()
		
		// Save button
		var saveButtonWidth = 125
		var saveButtonHeight = 23+IS_MOBILE*5
		saveButton_x = x+15
		saveButton_y = y+310+IS_MOBILE*12
    
		if (front and mouseOnBody and device_mouse_x_to_gui(0) > saveButton_x and device_mouse_x_to_gui(0) < saveButton_x+saveButtonWidth and
		device_mouse_y_to_gui(0) > saveButton_y and device_mouse_y_to_gui(0) < saveButton_y+saveButtonHeight) {
		    draw_set_color(c_lime)
		    mouseOnSaveButton = true
		}
		else {
		    draw_set_color(c_green)
		    mouseOnSaveButton = false
		}
		
		if (global.statPoints == global.virtual_stat_points)
			if (mouseOnSaveButton) draw_set_color(c_gray) else draw_set_color(c_dkgray)
    
		// Button Outline
		var beforeColor = draw_get_color() draw_set_color(c_black)
		draw_roundrect(saveButton_x-2, saveButton_y-2,
		saveButton_x+saveButtonWidth+2, saveButton_y+saveButtonHeight+2, 0)
		draw_set_color(beforeColor)	
		
		draw_roundrect(saveButton_x, saveButton_y,
		saveButton_x+saveButtonWidth, saveButton_y+saveButtonHeight, 0)
		draw_set_color(c_black)
    
		draw_set_center()
		    draw_text(saveButton_x+saveButtonWidth/2, saveButton_y+saveButtonHeight/2, ltext_save)
		draw_set_default()
		
		var statButtonsX = x+15//215
		var statButtonsY = y+85
		var statButtonsEdge = 25+IS_MOBILE*10
		var statButtonsBetween = 9+IS_MOBILE*3
	
		// STR Button
		var strButtonY = statButtonsY
		if (front and mouseOnBody and device_mouse_x_to_gui(0) > statButtonsX and device_mouse_x_to_gui(0) < statButtonsX+statButtonsEdge+150 and
		device_mouse_y_to_gui(0) > strButtonY-4 and device_mouse_y_to_gui(0) < strButtonY+statButtonsEdge+4) {
			mouseOnSTR_text = true
			
			if (device_mouse_x_to_gui(0) < statButtonsX+statButtonsEdge and device_mouse_y_to_gui(0) > strButtonY and device_mouse_y_to_gui(0) < strButtonY+statButtonsEdge) {
			    draw_set_color(c_lime)
			    mouseOnSTR = true
			}
			else {
				draw_set_color(c_green)
				mouseOnSTR = false
			}
		}
		else {
		    draw_set_color(c_green)
		    mouseOnSTR = false
			mouseOnSTR_text = false
		}
			
		if (global.virtual_stat_points <= 0)
			if (mouseOnSTR) draw_set_color(c_gray) else draw_set_color(c_dkgray)
        
			// Button Outline
			var beforeColor = draw_get_color() draw_set_color(c_black)
			draw_roundrect(statButtonsX-2, strButtonY-2,
			statButtonsX+statButtonsEdge+2, strButtonY+statButtonsEdge+2, 0)
			draw_set_color(beforeColor)
		
		    draw_roundrect(statButtonsX, strButtonY,
		    statButtonsX+statButtonsEdge, strButtonY+statButtonsEdge, 0)
		draw_set_color(c_black)
		
		draw_set_font(fontMessageTitle) draw_set_valign(fa_center) draw_set_halign(fa_center)
			draw_text(statButtonsX+statButtonsEdge/2, strButtonY+statButtonsEdge/2, "+")
		draw_set_default()
	
		// DEX Button
		var dexButtonY = statButtonsY+statButtonsEdge+statButtonsBetween
		if (front and mouseOnBody and device_mouse_x_to_gui(0) > statButtonsX and device_mouse_x_to_gui(0) < statButtonsX+statButtonsEdge+150 and
		device_mouse_y_to_gui(0) > dexButtonY-4 and device_mouse_y_to_gui(0) < dexButtonY+statButtonsEdge+4) {
			mouseOnDEX_text = true
			if (device_mouse_x_to_gui(0) < statButtonsX+statButtonsEdge and device_mouse_y_to_gui(0) > dexButtonY and device_mouse_y_to_gui(0) < dexButtonY+statButtonsEdge) {
			    draw_set_color(c_lime)
			    mouseOnDEX = true
			}
			else {
				mouseOnDEX = false
				draw_set_color(c_green)
			}
		}
		else {
			mouseOnDEX_text = false
		    draw_set_color(c_green)
		    mouseOnDEX = false
		}
        
		if (global.virtual_stat_points <= 0)
			if (mouseOnDEX) draw_set_color(c_gray) else draw_set_color(c_dkgray)
			
			// Button Outline
			var beforeColor = draw_get_color() draw_set_color(c_black)
			draw_roundrect(statButtonsX-2, dexButtonY-2,
			statButtonsX+statButtonsEdge+2, dexButtonY+statButtonsEdge+2, 0)
			draw_set_color(beforeColor)
		
		    draw_roundrect(statButtonsX, dexButtonY,
		    statButtonsX+statButtonsEdge, dexButtonY+statButtonsEdge, 0)
		draw_set_color(c_black)
		
		draw_set_font(fontMessageTitle) draw_set_valign(fa_center) draw_set_halign(fa_center)
			draw_text(statButtonsX+statButtonsEdge/2, dexButtonY+statButtonsEdge/2, "+")
		draw_set_default()
		
		// VIT Button
		var vitButtonY = statButtonsY+statButtonsEdge*2+statButtonsBetween*2
		if (front and mouseOnBody and device_mouse_x_to_gui(0) > statButtonsX and device_mouse_x_to_gui(0) < statButtonsX+statButtonsEdge+150 and
		device_mouse_y_to_gui(0) > vitButtonY-4 and device_mouse_y_to_gui(0) < vitButtonY+statButtonsEdge+4) {
			mouseOnVIT_text = true
			if (device_mouse_x_to_gui(0) < statButtonsX+statButtonsEdge and device_mouse_y_to_gui(0) > vitButtonY and device_mouse_y_to_gui(0) < vitButtonY+statButtonsEdge) {
			    draw_set_color(c_lime)
			    mouseOnVIT = true
			}
			else {
				mouseOnVIT = false
				draw_set_color(c_green)
			}
		}
		else {
			mouseOnVIT_text = false
		    draw_set_color(c_green)
		    mouseOnVIT = false
		}
		
		if (global.virtual_stat_points <= 0)
			if (mouseOnVIT) draw_set_color(c_gray) else draw_set_color(c_dkgray)
        
			// Button Outline
			var beforeColor = draw_get_color() draw_set_color(c_black)
			draw_roundrect(statButtonsX-2, vitButtonY-2,
			statButtonsX+statButtonsEdge+2, vitButtonY+statButtonsEdge+2, 0)
			draw_set_color(beforeColor)
		
		    draw_roundrect(statButtonsX, vitButtonY,
		    statButtonsX+statButtonsEdge, vitButtonY+statButtonsEdge, 0)
		draw_set_color(c_black)
		
		draw_set_font(fontMessageTitle) draw_set_valign(fa_center) draw_set_halign(fa_center)
			draw_text(statButtonsX+statButtonsEdge/2, vitButtonY+statButtonsEdge/2, "+")
		draw_set_default()
	
		// MP Button
		var mpButtonY = statButtonsY+statButtonsEdge*3+statButtonsBetween*3
		if (front and mouseOnBody and device_mouse_x_to_gui(0) > statButtonsX and device_mouse_x_to_gui(0) < statButtonsX+statButtonsEdge+150 and
		device_mouse_y_to_gui(0) > mpButtonY-4 and device_mouse_y_to_gui(0) < mpButtonY+statButtonsEdge+4) {
			mouseOnMP_text = true
			if (device_mouse_x_to_gui(0) < statButtonsX+statButtonsEdge and device_mouse_y_to_gui(0) > mpButtonY and device_mouse_y_to_gui(0) < mpButtonY+statButtonsEdge) {
			    draw_set_color(isSkillsActive ? c_lime : c_hardgray)
			    mouseOnMP = isSkillsActive
			}
			else {
			    draw_set_color(isSkillsActive ? c_green : c_hardgray)
			    mouseOnMP = false
			}
		}
		else {
			mouseOnMP_text = false
		    draw_set_color(isSkillsActive ? c_green : c_hardgray)
		    mouseOnMP = false
		}
		
		if (global.virtual_stat_points <= 0)
			if (mouseOnMP) draw_set_color(c_gray) else draw_set_color(isSkillsActive ? c_dkgray : c_hardgray)
        
			// Button Outline
			var beforeColor = draw_get_color() draw_set_color(c_black)
			draw_roundrect(statButtonsX-2, mpButtonY-2,
			statButtonsX+statButtonsEdge+2, mpButtonY+statButtonsEdge+2, 0)
			draw_set_color(beforeColor)
		
		    draw_roundrect(statButtonsX, mpButtonY,
		    statButtonsX+statButtonsEdge, mpButtonY+statButtonsEdge, 0)
		draw_set_color(c_black)
			
		draw_set_font(fontMessageTitle) draw_set_valign(fa_center) draw_set_halign(fa_center)
			draw_text(statButtonsX+statButtonsEdge/2, mpButtonY+statButtonsEdge/2, "+")
		draw_set_default()
		
		// STA Button
		var staButtonY = statButtonsY+statButtonsEdge*4+statButtonsBetween*4
		if (front and mouseOnBody and device_mouse_x_to_gui(0) > statButtonsX and device_mouse_x_to_gui(0) < statButtonsX+statButtonsEdge+150 and
		device_mouse_y_to_gui(0) > staButtonY-4 and device_mouse_y_to_gui(0) < staButtonY+statButtonsEdge+4) {
			mouseOnSTA_text = true
			if (device_mouse_x_to_gui(0) < statButtonsX+statButtonsEdge and device_mouse_y_to_gui(0) > staButtonY and device_mouse_y_to_gui(0) < staButtonY+statButtonsEdge) {
			    draw_set_color(isSkillsActive ? c_lime : c_hardgray)
			    mouseOnSTA = isSkillsActive
			}
			else {
			    draw_set_color(isSkillsActive ? c_green : c_hardgray)
			    mouseOnSTA = false
			}
		}
		else {
			mouseOnSTA_text = false
		    draw_set_color(isSkillsActive ? c_green : c_hardgray)
		    mouseOnSTA = false
		}
		
		if (global.virtual_stat_points <= 0)
			if (mouseOnSTA) draw_set_color(c_gray) else draw_set_color(isSkillsActive ? c_dkgray : c_hardgray)
        
			// Button Outline
			var beforeColor = draw_get_color() draw_set_color(c_black)
			draw_roundrect(statButtonsX-2, staButtonY-2,
			statButtonsX+statButtonsEdge+2, staButtonY+statButtonsEdge+2, 0)
			draw_set_color(beforeColor)
		
		    draw_roundrect(statButtonsX, staButtonY,
		    statButtonsX+statButtonsEdge, staButtonY+statButtonsEdge, 0)
		draw_set_color(c_black)
		
		draw_set_font(fontMessageTitle) draw_set_valign(fa_center) draw_set_halign(fa_center)
			draw_text(statButtonsX+statButtonsEdge/2, staButtonY+statButtonsEdge/2, "+")
		draw_set_default()
						
		var mReverse = true
		if (mouseOnSTR_text)
			show_textbox_tcolor(statButtonsX+310, strButtonY, ltext_strinfo, ltext_strinfo_w, ltext_strinfo_h, statText_alpha)
		else if (mouseOnDEX_text)
			show_textbox_tcolor(statButtonsX+310, dexButtonY, ltext_dexinfo, ltext_dexinfo_w, ltext_dexinfo_h, statText_alpha)
		else if (mouseOnVIT_text)
			show_textbox_tcolor(statButtonsX+310, vitButtonY, ltext_vitinfo, ltext_vitinfo_w, ltext_vitinfo_h, statText_alpha)
		else if (mouseOnMP_text)
			show_textbox_tcolor(statButtonsX+310, mpButtonY, ltext_mpinfo, ltext_mpinfo_w, ltext_mpinfo_h, statText_alpha)
		else if (mouseOnSTA_text)
			show_textbox_tcolor(statButtonsX+310, staButtonY, ltext_stainfo, ltext_stainfo_w, ltext_stainfo_h, statText_alpha)
		else {
			mReverse = false
			statText_alpha = -0.3
		}
			
		if (mReverse) {			
			if (statText_alpha < 0.97)
				statText_alpha += 0.065
			else
				statText_alpha = 0.97
		}
	}
	
    // Page 3 button
    var pageButton3Width = 70-(eng() ? 17 : 0)
	var pageButton3Height = 30+IS_MOBILE*6
	pageButtonEdge[3] = 30+IS_MOBILE*6
    pageButton_x[3] = exitButton_x-offset_x+3-pageButton3Width
    pageButton_y[3] = y+offset_x
    
    if (front and mouseOnBody and device_mouse_x_to_gui(0) > pageButton_x[3] and device_mouse_x_to_gui(0) < pageButton_x[3]+pageButton3Width and
    device_mouse_y_to_gui(0) > pageButton_y[3] and device_mouse_y_to_gui(0) < pageButton_y[3]+pageButton3Height) {
        draw_set_color(c_lime)
        mouseOnPageButton3 = true
    }
    else {
        draw_set_color(c_dkgray)
        mouseOnPageButton3 = false
    }
        
	// Button Outline
	var beforeColor = draw_get_color() draw_set_color(c_black)
	draw_roundrect(pageButton_x[3]-2, pageButton_y[3]-2,
	pageButton_x[3]+pageButton3Width+2, pageButton_y[3]+pageButton3Height+2, 0)
	draw_set_color((page != 3) ? beforeColor : c_ltgray)
			
	draw_roundrect(pageButton_x[3], pageButton_y[3],
	pageButton_x[3]+pageButton3Width, pageButton_y[3]+pageButton3Height, 0)
	draw_set_color(c_black)
    
    draw_set_center()
        draw_text(pageButton_x[3]+pageButton3Width/2, pageButton_y[3]+pageButton3Height/2, ltext_tags_short)
    draw_set_default()
    
    // Page 2 button
    var pageButton2Width = 50
	var pageButton2Height = 30+IS_MOBILE*6
	pageButtonEdge[2] = 30+IS_MOBILE*6
    pageButton_x[2] = pageButton_x[3]-offset_x+3-pageButton2Width
    pageButton_y[2] = y+offset_x
    
    if (front and mouseOnBody and device_mouse_x_to_gui(0) > pageButton_x[2] and device_mouse_x_to_gui(0) < pageButton_x[2]+pageButton2Width and
    device_mouse_y_to_gui(0) > pageButton_y[2] and device_mouse_y_to_gui(0) < pageButton_y[2]+pageButton2Height) {
        draw_set_color(c_lime)
        mouseOnPageButton2 = true
    }
    else {
        draw_set_color(c_dkgray)
        mouseOnPageButton2 = false
    }
        
	// Button Outline
	var beforeColor = draw_get_color() draw_set_color(c_black)
	draw_roundrect(pageButton_x[2]-2, pageButton_y[2]-2,
	pageButton_x[2]+pageButton2Width+2, pageButton_y[2]+pageButton2Height+2, 0)
	draw_set_color((page != 2) ? beforeColor : c_ltgray)
		
	draw_roundrect(pageButton_x[2], pageButton_y[2],
	pageButton_x[2]+pageButton2Width, pageButton_y[2]+pageButton2Height, 0)
	draw_set_color(c_black)
    
    draw_set_center()
        draw_text(pageButton_x[2]+pageButton2Width/2, pageButton_y[2]+pageButton2Height/2, ltext_info2)
    draw_set_default()
	
    // Page 1 button
    var pageButton1Width = 65
	var pageButton1Height = 30+IS_MOBILE*6
	pageButtonEdge[1] = 30+IS_MOBILE*6
    pageButton_x[1] = pageButton_x[2]-offset_x+3-pageButton1Width
    pageButton_y[1] = y+offset_x
    
    if (front and mouseOnBody and device_mouse_x_to_gui(0) > pageButton_x[1] and device_mouse_x_to_gui(0) < pageButton_x[1]+pageButton1Width and
    device_mouse_y_to_gui(0) > pageButton_y[1] and device_mouse_y_to_gui(0) < pageButton_y[1]+pageButton1Height) {
        draw_set_color(c_lime)
        mouseOnPageButton1 = true
    }
    else {
		draw_set_color(c_dkgray)
		mouseOnPageButton1 = false
    }
        
	// Button Outline
	var beforeColor = draw_get_color() draw_set_color(c_black)
	draw_roundrect(pageButton_x[1]-2, pageButton_y[1]-2,
	pageButton_x[1]+pageButton1Width+2, pageButton_y[1]+pageButton1Height+2, 0)
	draw_set_color((page != 1) ? beforeColor : c_ltgray)
		
	draw_roundrect(pageButton_x[1], pageButton_y[1],
	pageButton_x[1]+pageButton1Width, pageButton_y[1]+pageButton1Height, 0)
	draw_set_color(c_black)
    
    draw_set_center()
        draw_text(pageButton_x[1]+pageButton1Width/2, pageButton_y[1]+pageButton1Height/2, ltext_stats)
    draw_set_default()
	
	if (!front) {
		draw_set_alpha(mainAlpha/6)
			draw_roundrect(x, y, m_end_x, m_end_y, 0)
	}
	
	draw_set_alpha(greenForeground_alpha) draw_set_color(c_green)
		draw_roundrect(x+2, y+2, m_end_x-2, m_end_y-2, 0)
draw_set_alpha(1) gpu_set_tex_filter(1) draw_set_default()