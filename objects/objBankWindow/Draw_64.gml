var mainAlpha = image_alpha

var m_end_x = x+horizontalBoxCount*(boxEdge+boxBetween)-boxBetween+offset_x*2
var m_end_y = y+verticalBoxCount*(boxEdge+boxBetween)-boxBetween+offset_yTop+offset_yDown

var isItemSelectedFromBank = global.itemSelected != -1 and global.itemSelected.from == window_bank

draw_set_alpha(mainAlpha) gpu_set_tex_filter(1)

	draw_set_alpha(mainAlpha/1.2)
		draw_roundrect(x, y, m_end_x,
		m_end_y, 0)
		draw_set_color(front ? windowColor_main : c_gray) draw_set_alpha(mainAlpha/4)
		    draw_roundrect(x+2, y+2, m_end_x-2,
			m_end_y-2, 0)
	    draw_set_color(windowColor)
	        draw_roundrect(x+4, y+4, m_end_x-4,
			m_end_y-4, 0)
	    draw_set_color((beforePage != page and isItemSelectedFromBank) ? c_aqua : (greenPage ? c_customgreen : c_ltgray)) draw_set_alpha(mainAlpha/2)
		    draw_rectangle(x+5, y+4+49+IS_MOBILE*6, m_end_x-4,
			m_end_y-4-2-100, 0)
		draw_set_color(c_black) draw_set_alpha(mainAlpha)
    draw_roundrect(x, y, m_end_x, m_end_y, 1)
    
    draw_set_font(fontMessageTitle) draw_set_color(c_white)
        draw_text(x+offset_x, y+offset_x, ltext_bank)
    draw_set_font(global.mainFont) draw_set_color(c_black)
	
    // Money Text
	var moneyTextOffset = 6
	draw_sprite(sprCoin, -1, x+offset_x+21+196+!eng()*5,
	m_end_y-moneyTextOffset-16)
	
    draw_set_font(fontCharacterWindow) draw_set_valign(fa_bottom) draw_set_color(c_aqua)
		draw_text(x+offset_x+3, m_end_y-moneyTextOffset-4, ltext_activated)
	draw_set_font(fontMessageTitle) draw_set_color(c_gold)
		draw_text(x+offset_x+32+196+!eng()*5, m_end_y-moneyTextOffset+1, string(bankItems_totalActivatedRent))

	moneyTextOffset = 32
	draw_sprite_ext(sprCoin, -1, x+offset_x+21+196+!eng()*5,
	m_end_y-moneyTextOffset-17, 1, 1, 0, c_gray, 1)
	
	draw_set_font(fontCharacterWindow) draw_set_color(c_gray)
		draw_text(x+offset_x+3, m_end_y-moneyTextOffset-4, ltext_potential)
	draw_set_font(fontMessageTitle) draw_set_color(c_gray)
		draw_text(x+offset_x+32+196+!eng()*5, m_end_y-moneyTextOffset, string(bankItems_totalPotentialRent))
	
	moneyTextOffset = 62
	draw_sprite(sprCoin, -1, x+offset_x+21+196+!eng()*5,
	m_end_y-moneyTextOffset-15)
	
	draw_set_font(fontCharacterWindow) draw_set_color(c_white)
		draw_text(x+offset_x+3+67, m_end_y-moneyTextOffset-4, ltext_collected)
	draw_set_font(fontMessageTitle) draw_set_color(c_gold)
		draw_text(x+offset_x+32+196+!eng()*5, m_end_y-moneyTextOffset+2, string(global.rentGold))
    draw_set_default()

    
	event_perform(ev_other, ev_user2)
    for (i = horizontalBoxCount*(page-1); i < horizontalBoxCount*page; i++) {
        for (j = 0; j < verticalBoxCount; j++) {
            draw_set_alpha(mainAlpha)
			
			var xx = x+box_x[i, j]
			var yy = y+box_y[i, j]
			
			var cellIndex = 0
			var cellBlend = c_white
			if (item[i, j] == -1 or (instance_exists(item[i, j]) and item[i, j].object_index == objNoItem)) {
				cellIndex = 1

	            if (mouseOnBox_i == i and mouseOnBox_j == j)
					cellBlend = c_ltgray
			}
            else {
				cellIndex = 0
				
				if (item[i, j] == global.itemSelected)
					cellBlend = c_dkgray
	            else if (mouseOnBox_i == i and mouseOnBox_j == j)
					cellBlend = c_ltgray
			}
			
			var boxEdgeRatio = boxEdge/50
			draw_sprite_ext(sprCell, cellIndex, xx, yy, boxEdge/50, boxEdge/50, 0, cellBlend, mainAlpha)
            
	        if (item[i, j] != -1) {
	            with (item[i, j]) {
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
					} else
	                    sprite = sprite_index
						
					ssize *= boxEdgeRatio
						
					var aalpha = mainAlpha*(1-(global.itemSelected == id))///2)
					var aangle = image_angle+45*(type != type_necklace and type != type_call and type != type_medallion and type != type_material and object_index != objTheLetter)
					
					if (shadow)
		                draw_outline_origin(sprite, -1, xx, yy, ssize, ssize, aangle, aalpha)
						
					draw_sprite_origin_ext(sprite, -1, xx, yy, ssize, ssize, aangle, c_white, aalpha)
					if (type == type_clothes) {
						draw_sprite_ext(sprHead, 0, xx, yy, ssize, ssize, aangle, c_white, aalpha)
						draw_outline_low(global.hair, 0, xx, yy, ssize, ssize, aangle, aalpha)
						draw_sprite_ext(global.hair, 0, xx, yy, ssize, ssize, aangle, c_white, aalpha)
					}
					
					var extCount = ((extension[0] != -1)+(extension[1] != -1))*(type != type_medallion)
					if (extCount > 0)
						draw_sprite(sprPassiveSymbol, -1, xx+other.boxEdge/2-11, yy+other.boxEdge/2-8)
					if (extCount > 1)
						draw_sprite(sprPassiveSymbol, -1, xx+other.boxEdge/2-16, yy+other.boxEdge/2-8)
						
					if (get_day()-rentTime > 1)
						draw_sprite_ext(sprCell, 9, xx, yy, boxEdgeRatio, boxEdgeRatio, 0, c_white, 0.43*mainAlpha)
					
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
			
			if (item[i, j] != -1 and item[i, j].itemLevel/*-2*/ > global.level) {
				draw_sprite_ext(sprCell, 10, xx, yy, 
				boxEdgeRatio, boxEdgeRatio, 0, c_black, 0.6*mainAlpha)
				
				//draw_set_alpha(mainAlpha)
				//	draw_set_color(c_white) draw_set_halign(fa_center) draw_set_valign(fa_center)
				//		draw_text_outline(xx, yy-10, string(item[i, j].itemLevel/*-2*/)+" lv", 2, c_black, global.performanceOutFidelty, boxEdgeRatio, boxEdgeRatio, 0)
				//	draw_set_default()
				//draw_set_alpha(mainAlpha)
			}
        }
    }
	
	if (global.itemSelected != -1 and global.itemSelected.from == window_items) {
		var isProper = !is_active(global.itemSelected.i, global.itemSelected.j)
		
		draw_set_color(isProper ? (mouseOnBody ? c_green : c_aqua) : c_red) draw_set_halign(fa_center) draw_set_valign(fa_center)
		draw_set_alpha((1-contMain.period/40)*mainAlpha/(2.5-mouseOnBody))
			var ltBgHeight = 285+IS_MOBILE*60
			var stX_draw = x+5
			var endX_draw = m_end_x-4
			var stY_draw = y+4+49+IS_MOBILE*4
			var endY_draw = stY_draw+ltBgHeight
				
			draw_rectangle(stX_draw, stY_draw, endX_draw,
			endY_draw, 0)
				
			draw_set_font(fontGUI) draw_set_alpha(mainAlpha) draw_set_color(c_black)
				draw_text((stX_draw+endX_draw)/2, (stY_draw+endY_draw)/2, isProper ? ltext_add : ltext_active)
		draw_set_default() draw_set_alpha(mainAlpha)
	}
    
    // Exit button
    exitButtonEdge = 36+IS_MOBILE*6
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
	
	draw_sprite(sprExitButton, -1, exitButton_x+exitButtonEdge/2, exitButton_y+exitButtonEdge/2)
    
    // Page 3 button
    pageButtonEdge[3] = 36+IS_MOBILE*6
    pageButton_x[3] = exitButton_x-offset_x-pageButtonEdge[3]
    pageButton_y[3] = y+offset_x
    
    if (front and mouseOnBody and device_mouse_x_to_gui(0) > pageButton_x[3] and device_mouse_x_to_gui(0) < pageButton_x[3]+pageButtonEdge[3] and
    device_mouse_y_to_gui(0) > pageButton_y[3] and device_mouse_y_to_gui(0) < pageButton_y[3]+pageButtonEdge[3]) {
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
	pageButton_x[3]+pageButtonEdge[3]+2, pageButton_y[3]+pageButtonEdge[3]+2, 0)
	draw_set_color((page != 3) ? beforeColor : c_ltgray)
			
	draw_roundrect(pageButton_x[3], pageButton_y[3],
	pageButton_x[3]+pageButtonEdge[3], pageButton_y[3]+pageButtonEdge[3], 0)

	if (global.itemSelected != -1 and page != 3) {
		if (!mouseOnPageButton3) {
			draw_set_color(c_aqua) draw_set_alpha(0.5*mainAlpha)
				draw_roundrect(pageButton_x[3], pageButton_y[3],
				pageButton_x[3]+pageButtonEdge[3], pageButton_y[3]+pageButtonEdge[3], 0)
			draw_set_alpha(mainAlpha)
		}	
	}	
	draw_set_color(c_black)
    
    draw_set_center()
        draw_text(pageButton_x[3]+pageButtonEdge[3]/2, pageButton_y[3]+pageButtonEdge[3]/2, "3")
    draw_set_default()
	
    // Page 2 button
    pageButtonEdge[2] = 36+IS_MOBILE*6
    pageButton_x[2] = pageButton_x[3]-offset_x-pageButtonEdge[2]
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
	
	if (global.itemSelected != -1 and page != 2) {
		if (!mouseOnPageButton2) {
			draw_set_color(c_aqua) draw_set_alpha(0.5*mainAlpha)
				draw_roundrect(pageButton_x[2], pageButton_y[2],
				pageButton_x[2]+pageButtonEdge[2], pageButton_y[2]+pageButtonEdge[2], 0)
			draw_set_alpha(mainAlpha)
		}	
	}
	draw_set_color(c_black)
    
    draw_set_center()
        draw_text(pageButton_x[2]+pageButtonEdge[2]/2, pageButton_y[2]+pageButtonEdge[2]/2, "2")
    draw_set_default()
    
    // Page 1 button
    pageButtonEdge[1] = 36+IS_MOBILE*6
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
	
	if (global.itemSelected != -1 and page != 1) {
		if (!mouseOnPageButton1) {
			draw_set_color(c_aqua) draw_set_alpha(0.5*mainAlpha)
				draw_roundrect(pageButton_x[1], pageButton_y[1],
				pageButton_x[1]+pageButtonEdge[1], pageButton_y[1]+pageButtonEdge[1], 0)
			draw_set_alpha(mainAlpha)
		}	
	}
	draw_set_color(c_black)
    
    draw_set_center()
        draw_text(pageButton_x[1]+pageButtonEdge[1]/2, pageButton_y[1]+pageButtonEdge[1]/2, "1")
    draw_set_default()
	
	if (true) {
	    // Take button
	    takeButtonEdge = 60
	    takeButton_x = x+offset_x//m_end_x-offset_x-takeButtonEdge-136-(eng() ? 20 : 0)
	    takeButton_y = m_end_y-moneyTextOffset-32
    
	    if (front and mouseOnBody and device_mouse_x_to_gui(0) > takeButton_x and device_mouse_x_to_gui(0) < takeButton_x+takeButtonEdge and
	    device_mouse_y_to_gui(0) > takeButton_y and device_mouse_y_to_gui(0) < takeButton_y+30) {
	        draw_set_color(c_lime)
	        mouseOnTakeButton = true
	    }
	    else {
	        draw_set_color(c_dkgray)
	        mouseOnTakeButton = false
	    }
		
		if (global.rentGold == 0)
			if (mouseOnTakeButton) draw_set_color(c_gray) else draw_set_color(c_dkgray)
    
		// Button Outline
		var beforeColor = draw_get_color() draw_set_color(c_black)
		draw_roundrect(takeButton_x-2, takeButton_y-2,
		takeButton_x+takeButtonEdge+2,takeButton_y+30+2, 0)
		draw_set_color(beforeColor)	
		
		draw_roundrect(takeButton_x, takeButton_y,
		takeButton_x+takeButtonEdge, takeButton_y+30, 0)
		
		if (global.itemSelected != -1 and (global.itemSelected.type == type_mweapon or global.itemSelected.type == type_sweapon
		or global.itemSelected.type == type_clothes or global.itemSelected.type == type_necklace or global.itemSelected.type == type_medallion)) {
			var isProper = (global.itemSelected.itemLevel/*-2*/ <= global.level) and (global.itemSelected.isDeletable or global.itemSelected.isForQuest == false)
			if (isProper and !mouseOnTakeButton) {
				draw_set_color(c_aqua) draw_set_alpha(0.5*mainAlpha)
					draw_roundrect(takeButton_x, takeButton_y,
					takeButton_x+takeButtonEdge, takeButton_y+30, 0)
				 draw_set_alpha(mainAlpha)
			}
				
		}
		draw_set_color(c_black)
    
	    draw_set_center()
	        draw_text(takeButton_x+takeButtonEdge/2, takeButton_y+30/2, ltext_take)
	    draw_set_default()
	}
	
	if (!front) {
		draw_set_alpha(mainAlpha/6)
			draw_roundrect(x, y, m_end_x,
			m_end_y, 0)
	}
draw_set_alpha(1) gpu_set_tex_filter(1)