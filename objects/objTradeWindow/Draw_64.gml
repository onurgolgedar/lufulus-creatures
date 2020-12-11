if (alarm[2] == -1) {
	var mainAlpha = image_alpha
	
	var m_end_x = x+horizontalBoxCount*(boxEdge+boxBetween)-boxBetween+offset_x*2
	var m_end_y = y+verticalBoxCount*(boxEdge+boxBetween)-boxBetween+offset_yTop+offset_yDown
	
	draw_set_alpha(mainAlpha)
		draw_set_alpha(mainAlpha/1.2)
		draw_roundrect(x, y, m_end_x,
		m_end_y, 0)
		draw_set_color(front ? windowColor_main : c_gray) draw_set_alpha(mainAlpha/4)
		    draw_roundrect(x+2, y+2, m_end_x-2,
			m_end_y-2, 0)
	    draw_set_color(windowColor)
	        draw_roundrect(x+4, y+4, m_end_x-4,
			m_end_y-4, 0)
	    draw_set_color(c_ltgray) draw_set_alpha(mainAlpha/2)
			var ltBgHeight = 227-56*loot+IS_MOBILE*55-loot*IS_MOBILE*6
		    draw_rectangle(x+5, y+4+43+IS_MOBILE*12, m_end_x-5,
			y+4+43+ltBgHeight, 0)
		draw_set_color(c_black) draw_set_alpha(mainAlpha)
	    draw_roundrect(x, y, m_end_x, m_end_y, 1)
        
        draw_set_font(fontMessageTitle) draw_set_color(c_white)
            draw_text(x+offset_x, y+offset_x, loot ? ltext_loot : ltext_trade)
        draw_set_font(global.mainFont) draw_set_color(c_black)
		
		if (offset_yDown != offset_yDown_base) {
			var moneyTextOffset = 3
    
		    draw_set_font(fontMessageTitle) draw_set_valign(fa_bottom) draw_set_color(c_gold)
		        draw_text(x+offset_x+32, m_end_y-moneyTextOffset, string(floor(global.money)))//+" gold(s)")
		    draw_set_default()
    
			draw_sprite(sprCoin, -1, x+offset_x+moneyTextOffset+14,
			m_end_y-moneyTextOffset-17)
		}
        
        for (i = horizontalBoxCount*(page-1); i < horizontalBoxCount*page; i++) {
            for (j = 0; j < verticalBoxCount; j++) {
                event_perform(ev_other, ev_user2)
                draw_set_alpha(mainAlpha)
				
				var xx = x+box_x[i, j]
				var yy = y+box_y[i, j]
			
				var cellIndex = 0
				var cellBlend = c_white
				var cellVisible = true
				
				if (item[i, j] == -1 or (instance_exists(item[i, j]) and item[i, j].object_index == objNoItem)) {
					cellIndex = 1
					
					if (mouseOnBox_i == i and mouseOnBox_j == j)
						cellBlend = c_ltgray
						
					//cellVisible = false
				}
				else {
					if (item[i, j] == global.itemSelected)
						cellBlend = c_dkgray
		            else if (mouseOnBox_i == i and mouseOnBox_j == j)
						cellBlend = c_ltgray
						
						if (!loot and item[i, j].itemLevel <= global.level) {
							if (item[i, j].cWorth > global.money)
								cellIndex = 5
							else if (item[i, j].cWorth > global.money*0.75)
								cellIndex = 4
							else
								cellIndex = 3
						}
						else if (loot)
							cellIndex = 0
						else
							cellIndex = 10
				}

				var boxEdgeRatio = boxEdge/50
				if (cellVisible)
					draw_sprite_ext(sprCell, cellIndex, xx, yy, boxEdgeRatio, boxEdgeRatio, 0, cellBlend, mainAlpha)	

                draw_set_color(c_black)
                
	            if (item[i, j] != -1) {
	                with (item[i, j])
	                {
	                    i = other.i
	                    j = other.j
                        
		                var sprite
						var ssize = 1
						var shadow = false
		                if (type == type_mweapon or type == type_sweapon) {
		                    sprite = sprite_index
							ssize = 0.45
							shadow = true
						} else if (type == type_clothes) {
							ssize = 0.45
							sprite = sprite_index
						} else if (type == type_hair) {
							ssize = 0.45
							sprite = sprite_index
						} else
		                    sprite = sprite_index
							
						ssize *= boxEdgeRatio
						
						var aalpha = mainAlpha*(1-(global.itemSelected == id)/2)
						var aangle = image_angle+45*(type != type_necklace and type != type_call and type != type_medallion and type != type_material and object_index != objTheLetter)
					
						if (type == type_hair) {
							draw_outline(sprite, -1, xx, yy, ssize, ssize, aangle, aalpha*aalpha)
							draw_sprite_ext(sprHead, 0, xx, yy, ssize, ssize, aangle, c_white, aalpha)
							
							draw_outline_low(sprite, -1, xx, yy, ssize, ssize, aangle, aalpha*aalpha)
							draw_sprite_ext(sprite, -1, xx, yy, ssize, ssize, aangle, c_white, aalpha)
						}
						else {
							if (shadow)
								draw_outline_origin(sprite, -1, xx, yy, ssize, ssize, aangle, aalpha*aalpha)
					
							draw_sprite_origin_ext(sprite, -1, xx, yy, ssize, ssize, aangle, c_white, aalpha)
						}
                        
						if (type == type_clothes) {
							draw_sprite_ext(sprHead, 0, xx, yy, ssize, ssize, aangle, c_white, aalpha)
							draw_outline_low(global.hair, 0, xx, yy, ssize, ssize, aangle, aalpha*aalpha)
							draw_sprite_ext(global.hair, 0, xx, yy, ssize, ssize, aangle, c_white, aalpha)
						}
						
						var extCount = ((extension[0] != -1)+(extension[1] != -1))*(type != type_medallion)
						if (extCount > 0)
							draw_sprite(sprPassiveSymbol, -1, xx+other.boxEdge/2-11, yy+other.boxEdge/2-8)
						if (extCount > 1)
							draw_sprite(sprPassiveSymbol, -1, xx+other.boxEdge/2-16, yy+other.boxEdge/2-8)
							
						if (!isDeletable)
							draw_sprite_ext(sprCell, 8, xx, yy, boxEdgeRatio, boxEdgeRatio, 0, c_white, 0.43*mainAlpha)

				        if (isCollectable and count != 1) {
				            draw_set_halign(fa_center) draw_set_valign(fa_center) draw_set_font(fontMain_small)
								var xx2 = xx
								var yy2 = yy+other.boxEdge/2-10
								/*draw_set_alpha(0.6) draw_set_color(c_ltyellow)
									draw_roundrect(xx2-10, yy2-6, xx2+10, yy2+6, 0)*/
								draw_set_alpha(mainAlpha) draw_set_color(c_white)
									draw_text_outline(xx2, yy2, count, 2, c_black, global.performanceOutFidelty, boxEdgeRatio, boxEdgeRatio, 0)
				            draw_set_default()
				        }
	                }
				}
				
				if (item[i, j] != -1 and item[i, j].itemLevel/*-loot*2*/ > global.level and item[i, j].isForQuest == false) {
					draw_sprite_ext(sprCell, 0, xx, yy, boxEdgeRatio, boxEdgeRatio, 0, c_black, 0.38*mainAlpha)
					
					//draw_set_alpha(mainAlpha)
					//	draw_set_color(c_white) draw_set_halign(fa_center) draw_set_valign(fa_center)
					//		draw_text_outline(xx, yy-13, string(item[i, j].itemLevel/*-loot*2*/)+" lv", 2, c_black, global.performanceOutFidelty, 0.9, 0.9, 0)
					//	draw_set_default()
					//draw_set_alpha(mainAlpha)
				}
            }
        }
		
		if (global.itemSelected != -1 and global.itemSelected.from == window_items and !loot) {
			draw_set_color(mouseOnBody ? c_green : c_aqua) draw_set_halign(fa_center) draw_set_valign(fa_center) draw_set_alpha((1-contMain.period/40)*mainAlpha/(2.5-mouseOnBody))
			    var stX_draw = x+5
				var endX_draw = m_end_x-4
				var stY_draw = y+4+43+IS_MOBILE*12
				var endY_draw = y+4+43+ltBgHeight
				
				draw_rectangle(stX_draw, stY_draw, endX_draw,
				endY_draw, 0)
				
				var goldFont = fontMessageTitle
				draw_set_font(goldFont)
				var goldText_width = string_width(string(global.itemSelected.worth))
				
				draw_set_color(c_black) draw_set_alpha(mainAlpha/1.5)
					draw_rectangle((stX_draw+endX_draw)/2-goldText_width/2-41, (stY_draw+endY_draw)/2+7, (stX_draw+endX_draw)/2+goldText_width/2+14,
					(stY_draw+endY_draw)/2+33, 0)
				
				draw_set_font(fontGUI) draw_set_alpha(mainAlpha) draw_set_color(c_black)
					draw_text((stX_draw+endX_draw)/2-8, (stY_draw+endY_draw)/2-17, ltext_sell)
				
				draw_set_font(goldFont) draw_set_color(c_gold)
					draw_sprite_ext(sprCoin, -1, (stX_draw+endX_draw)/2-goldText_width/2-21, (stY_draw+endY_draw)/2+20, 1, 1, 0, c_white, mainAlpha)
					draw_text((stX_draw+endX_draw)/2, (stY_draw+endY_draw)/2+20, string(global.itemSelected.cWorth))
			draw_set_default() draw_set_alpha(mainAlpha)
		}
        
        // Exit button
        exitButtonEdge = 30+IS_MOBILE*12
        exitButton_x = m_end_x-offset_x-exitButtonEdge
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
		
		//draw_set_font(fontExitButton) draw_set_valign(fa_center) draw_set_halign(fa_center)
			//draw_text(exitButton_x+exitButtonEdge/2, exitButton_y+exitButtonEdge/2, "X")
			draw_sprite(sprExitButton, -1, exitButton_x+exitButtonEdge/2, exitButton_y+exitButtonEdge/2)
		//draw_set_default()
        
		if (maxPage > 1) {
	        // Page 2 button
	        pageButtonEdge[2] = 30+IS_MOBILE*12
	        pageButton_x[2] = exitButton_x-offset_x-pageButtonEdge[2]
	        pageButton_y[2] = y+offset_x
        
	        if (front and mouseOnBody and device_mouse_x_to_gui(0) > pageButton_x[2] and device_mouse_x_to_gui(0) < pageButton_x[2]+pageButtonEdge[2] and
	        device_mouse_y_to_gui(0) > pageButton_y[2] and device_mouse_y_to_gui(0) < pageButton_y[2]+pageButtonEdge[2]) {
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
			pageButton_x[2]+pageButtonEdge[2]+2, pageButton_y[2]+pageButtonEdge[2]+2, 0)
			draw_set_color((page != 2) ? beforeColor : c_ltgray)
				
		    draw_roundrect(pageButton_x[2], pageButton_y[2],
		    pageButton_x[2]+pageButtonEdge[2], pageButton_y[2]+pageButtonEdge[2], 0)
			draw_set_color(c_black)
        
	        draw_set_center()
	            draw_text(pageButton_x[2]+pageButtonEdge[2]/2, pageButton_y[2]+pageButtonEdge[2]/2, "2")
	        draw_set_default()
        
	        // Page 1 button
	        pageButtonEdge[1] = 30+IS_MOBILE*12
	        pageButton_x[1] = pageButton_x[2]-offset_x-pageButtonEdge[1]
	        pageButton_y[1] = y+offset_x
        
	        if (front and mouseOnBody and device_mouse_x_to_gui(0) > pageButton_x[1] and device_mouse_x_to_gui(0) < pageButton_x[1]+pageButtonEdge[1] and
	        device_mouse_y_to_gui(0) > pageButton_y[1] and device_mouse_y_to_gui(0) < pageButton_y[1]+pageButtonEdge[1]) {
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
			pageButton_x[1]+pageButtonEdge[1]+2, pageButton_y[1]+pageButtonEdge[1]+2, 0)
			draw_set_color((page != 1) ? beforeColor : c_ltgray)
				
		    draw_roundrect(pageButton_x[1], pageButton_y[1],
		    pageButton_x[1]+pageButtonEdge[1], pageButton_y[1]+pageButtonEdge[1], 0)
			draw_set_color(c_black)
        
	        draw_set_center()
	            draw_text(pageButton_x[1]+pageButtonEdge[1]/2, pageButton_y[1]+pageButtonEdge[1]/2, "1")
	        draw_set_default()
	    draw_set_alpha(1)
	}
	draw_set_alpha(1)
	
	if (!front) {
		draw_set_alpha(mainAlpha/6)
		draw_roundrect(x, y, m_end_x,
		m_end_y, 0)
	}
}

/*if (global.itemSelected != -1 and (global.itemSelected.from == window_trade and !loot or global.itemSelected.from == "Loot" and loot))
	draw_itemSelected()*/
	
gpu_set_tex_filter(1)
