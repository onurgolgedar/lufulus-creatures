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
		    draw_rectangle(x+5, y+4+43, m_end_x-4,
			m_end_y-4-2, 0)
		draw_set_color(c_black) draw_set_alpha(mainAlpha)
    draw_roundrect(x, y, m_end_x, m_end_y, 1)
    
    draw_set_font(fontMessageTitle) draw_set_color(c_white)
        draw_text(x+offset_x, y+offset_x, ltext_equipment)
    draw_set_font(global.mainFont) draw_set_color(c_black)
	
	event_perform(ev_other, ev_user2)
	var drawInfo_empty = false
    for (i = horizontalBoxCount*(page-1); i < horizontalBoxCount*page; i++) {
        for (j = 0; j < verticalBoxCount; j++) {
			if (i%(horizontalBoxCount-1) == 0 and j%(verticalBoxCount-1) == 0)
				continue
			
            draw_set_alpha(mainAlpha)
			
			var xx = x+box_x[i, j]
			var yy = y+box_y[i, j]
			
			var cellIndex = 0
			var cellBlend = c_white
			if (item[i, j] == -1 or (instance_exists(item[i, j]) and item[i, j].object_index == objNoItem)) {
				cellIndex = 1

	            if (mouseOnBox_i == i and mouseOnBox_j == j) {
					cellBlend = c_ltgray
					
					drawInfo_empty = true
				}
			}
            else {
				cellIndex = 2
				
				if (item[i, j] == global.itemSelected)
					cellBlend = c_dkgray
	            else if (mouseOnBox_i == i and mouseOnBox_j == j)
					cellBlend = c_ltgray
			}
			
			var boxEdgeRatio = boxEdge/50
			draw_sprite_ext(sprCell, cellIndex, x+box_x[i, j], y+box_y[i, j], boxEdgeRatio, boxEdgeRatio, 0, cellBlend, mainAlpha)
            
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
						
					var aalpha = mainAlpha*(1-(global.itemSelected == id))///2)
					var aangle = image_angle+45*(type != type_necklace and type != type_medallion)
					
					if (shadow)
		                draw_outline_origin(sprite, -1, xx, yy, ssize, ssize, aangle, aalpha*aalpha)
						
					draw_sprite_origin_ext(sprite, -1, xx, yy, ssize, ssize, aangle, c_white, aalpha)
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
					
			        if (isCollectable and count != 1) {
			            draw_set_halign(fa_center) draw_set_valign(fa_center) draw_set_font(fontMain_small)
							var xx2 = xx
							var yy2 = yy+other.boxEdge/2-10
							/*draw_set_alpha(0.6) draw_set_color(c_ltyellow)
								draw_roundrect(xx2-10, yy2-6, xx2+10, yy2+6, 0)*/
							draw_set_alpha(1) draw_set_color(c_white)
			                draw_text_outline(xx2, yy2, count, 2, c_black, global.performanceOutFidelty, boxEdgeRatio, boxEdgeRatio, 0)
			            draw_set_default()
			        }
	            }
			}
			else {
				var ssprite = -1
				var swordOrBow = false
					
				if (i == 1 and j == 0) { ssprite = sprNecklaceLogo swordOrBow = false}
				else if (i == 0 and j == 1) { ssprite = sprSwordLogo swordOrBow = true }
				else if (i == 1 and j == 1) { ssprite = sprClothesLogo swordOrBow = false  }
				else if (i == 2 and j == 1) { ssprite = sprBowLogo swordOrBow = true }
				else if (i == 1 and j == 2) { ssprite = sprMedallionLogo swordOrBow = false }
					
				if (ssprite != -1)
					draw_sprite_ext(ssprite, -1, xx, yy, (1-swordOrBow*0.5)*boxEdgeRatio, (1-swordOrBow*0.5)*boxEdgeRatio, swordOrBow*45, c_white, mainAlpha/2)
			}
        }
    }
	
	if (global.itemSelected != -1 and global.itemSelected.from == window_items
	and (global.itemSelected.type == type_mweapon or global.itemSelected.type == type_sweapon
	or global.itemSelected.type == type_clothes or global.itemSelected.type == type_necklace or global.itemSelected.type == type_medallion)) {
		var isProper = (global.itemSelected.itemLevel/*-2*/ <= global.level) and (global.itemSelected.isDeletable or global.itemSelected.isForQuest == false)
		draw_set_color(isProper ? (mouseOnBody ? c_green : c_aqua) : c_red) draw_set_halign(fa_center) draw_set_valign(fa_center)
		draw_set_alpha((1-contMain.period/40)*mainAlpha/(2.5-mouseOnBody*isProper))
			var ltBgHeight = 170+IS_MOBILE*37
			var stX_draw = x+5
			var endX_draw = m_end_x-4
			var stY_draw = y+4+43
			var endY_draw = stY_draw+ltBgHeight
				
			draw_rectangle(stX_draw, stY_draw, endX_draw,
			endY_draw, 0)
				
			draw_set_font(fontGUI) draw_set_alpha(mainAlpha) draw_set_color(c_black)
				draw_text((stX_draw+endX_draw)/2, (stY_draw+endY_draw)/2, isProper ? ltext_equip : ltext_cannotequip)
		draw_set_default() draw_set_alpha(mainAlpha)
	}
	
    // Exit button
    exitButtonEdge = 30
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
	
	if (!front) {
		draw_set_alpha(mainAlpha/6)
			draw_roundrect(x, y, m_end_x,
			m_end_y, 0)
	}
	
draw_set_alpha(1) gpu_set_tex_filter(1)

if (drawInfo_empty) {
	if (mouseOnBox_i == 1 and mouseOnBox_j == 0) show_textbox(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), ltext_noneck)
	else if (mouseOnBox_i == 0 and mouseOnBox_j == 1) show_textbox(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), ltext_nosword)
	else if (mouseOnBox_i == 1 and mouseOnBox_j == 1) show_textbox(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), ltext_noclothes)
	else if (mouseOnBox_i == 2 and mouseOnBox_j == 1) show_textbox(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), ltext_noshield)
	else if (mouseOnBox_i == 1 and mouseOnBox_j == 2) show_textbox(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), ltext_norune)
}