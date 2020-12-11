var mainAlpha = image_alpha

var m_end_x = x+horizontalBoxCount*(boxEdge+boxBetween)-boxBetween+offset_x*2-cut_right
var m_end_y = y+verticalBoxCount*(boxEdge+(boxBetween+boxBetween_additionalV))-(boxBetween+boxBetween_additionalV)+offset_yTop+offset_yDown

draw_set_alpha(mainAlpha)
	draw_set_alpha(mainAlpha/(1.2+temporaryWindow*0.7))
		draw_roundrect(x, y, m_end_x,
		m_end_y, 0)
    draw_set_color(front ? windowColor_main : c_gray) draw_set_alpha(mainAlpha/4)
        draw_roundrect(x+2, y+2, m_end_x-2,
		m_end_y-2, 0)
    draw_set_color(windowColor)
        draw_roundrect(x+4, y+4, m_end_x-4,
		m_end_y-4, 0)
	draw_set_color(c_ltgray) draw_set_alpha(mainAlpha/2)
		draw_rectangle(x+5, y+4+71, m_end_x-4,
		m_end_y-4-43, 0)
	draw_set_color(c_black) draw_set_alpha(mainAlpha)
	draw_roundrect(x, y, m_end_x, m_end_y, 1)
	
    draw_set_font(fontMessageTitle) draw_set_color(c_white)
		var title = ""
		if (page == 1)
			title = ""
		else if (page == 2)
			title = ltext_title
        draw_text(x+offset_x, y+offset_x+31/*special*/, title)
    draw_set_font(global.mainFont) draw_set_color(c_black)
	
	// Skill Points Text (Extra)
    var spTextOffset = 3
	var points = global.skillPoints
	
    draw_set_font(fontPoints) draw_set_color(c_white) draw_set_valign(fa_bottom)
        draw_text_colortags(x+offset_x,
		m_end_y-spTextOffset,
		"[c="+string(global.skillPoints == 0 ? c_white : c_ltgreen)+"]"+ltext_availablepoints+string(points)+"[/c]")
    draw_set_font(global.mainFont) draw_set_color(c_black) draw_set_valign(fa_top)
	
	/*var leftTop_corner_x = x+box_x[0, 0]-boxEdge/2-offset_x/2
	var rightBottom_corner_x = x+box_x[9, 5]+boxEdge/2+offset_x/2
	var leftBottom_corner_x = x+box_x[0, 5]-boxEdge/2-offset_x/2
	var rightTop_corner_x = x+box_x[9, 0]+boxEdge/2+offset_x/2
	var leftTop_corner_y = y+box_y[0, 0]-boxEdge/2-offset_x/2
	var rightBottom_corner_y = y+box_y[9, 5]+boxEdge/2+offset_x
	var leftBottom_corner_y = y+box_y[0, 5]+boxEdge/2+offset_x
	var rightTop_corner_y = y+box_y[9, 0]-boxEdge/2-offset_x/2
	var middle_corner_x = x+box_x[5, 3]-boxEdge/2-3
	var middle_corner_y = y+box_y[5, 3]-boxEdge*/
	
	/*draw_set_color(c_customgreen_compare) draw_set_alpha(mainAlpha*0.3)
		//draw_rectangle(leftTop_corner_x, leftTop_corner_y, middle_corner_x-1, middle_corner_y, 0)
	draw_set_alpha(mainAlpha*0.6)
		draw_rectangle(leftTop_corner_x, leftTop_corner_y, middle_corner_x, middle_corner_y, 1)
	draw_set_color(c_green) draw_set_alpha(mainAlpha*0.3)
		//draw_rectangle(leftBottom_corner_x, leftBottom_corner_y, middle_corner_x, middle_corner_y, 0)
	draw_set_alpha(mainAlpha*0.6)
		draw_rectangle(leftBottom_corner_x, leftBottom_corner_y, middle_corner_x, middle_corner_y, 1)
	draw_set_color(c_customgreen) draw_set_alpha(mainAlpha*0.3)
		//draw_rectangle(rightBottom_corner_x, rightBottom_corner_y, middle_corner_x, middle_corner_y, 0)
	draw_set_alpha(mainAlpha*0.6)
		draw_rectangle(rightBottom_corner_x, rightBottom_corner_y, middle_corner_x, middle_corner_y, 1)
	draw_set_color(c_customgreen2) draw_set_alpha(mainAlpha*0.3)
		//draw_rectangle(rightTop_corner_x, rightTop_corner_y, middle_corner_x, middle_corner_y, 0)
	draw_set_alpha(mainAlpha*0.6)
		draw_rectangle(rightTop_corner_x, rightTop_corner_y, middle_corner_x, middle_corner_y, 1)
	draw_set_color(c_white) draw_set_alpha(mainAlpha)*/
	
	for (var p = (page-1)*horizontalBoxCount; p < horizontalBoxCount*page; p += horizontalBoxCount-5) {
		for (var k = 0; k < verticalBoxCount; k++) {
			if (item[p, k] != -1) {
				var xx_l = x+box_x[p, k]
				var yy_l = y+box_y[p, k]
				var m_l = boxEdge*5-(item[p, k].upgrade == 0)*boxEdge*2
				
				draw_set_color(c_black) draw_set_alpha(mainAlpha)
					draw_roundrect(xx_l-boxEdge/2, yy_l-boxEdge/2-4, xx_l+m_l, yy_l+boxEdge/2+4, 0)
			
				draw_set_alpha(mainAlpha*0.3) draw_set_color(item[p, k].upgrade > 0 ? (item[p, k].upgrade == item[p, k].maxUpgrade ? c_broccoli : c_aqua) : c_ltgray)
					draw_roundrect(xx_l-boxEdge/2+2, yy_l-boxEdge/2-4+2, xx_l+m_l-2, yy_l+boxEdge/2+2, 0)
					draw_roundrect(xx_l-boxEdge/2+4, yy_l-boxEdge/2-4+4, xx_l+m_l-4, yy_l+boxEdge/2, 0)
			}
		}
	}
	draw_set_alpha(mainAlpha) draw_set_color(c_black)
    
	event_perform(ev_other, ev_user2)
    for (i = horizontalBoxCount*(page-1); i < horizontalBoxCount*page; i++) {
        for (j = 0; j < verticalBoxCount; j++) {
			var xx = x+box_x[i, j]
			var yy = y+box_y[i, j]
			
			if (item[i, j] != -1) {			
				if (item[i, j].upgrade > 0) {
		            draw_set_color(c_black) draw_set_alpha(mainAlpha*0.5)
						draw_rectangle(xx+boxEdge/2+7, yy-boxEdge/2-2, xx+boxEdge/2+9, yy+boxEdge/2+2, 0)
						draw_rectangle(xx+boxEdge*3/2+28, yy-boxEdge/2-2, xx+boxEdge*3/2+30, yy+boxEdge/2+2, 0)
						draw_rectangle(xx+boxEdge/2+7, yy-boxEdge/2-2, xx+boxEdge*3/2+30, yy+boxEdge/2+2, 0)
					draw_set_alpha(mainAlpha)
			
					draw_set_center() draw_set_color((item[i, j].upgrade > 0) ? c_white : c_nicered) draw_set_font(fontSkills)
						var ttxt = item[i, j].upgrade != item[i, j].maxUpgrade ? (ltext_tier+"\n+"+string(item[i, j].upgrade)) : ltext_tier+"\nMax"
						draw_text(xx+boxEdge+19, yy, ttxt)
					draw_set_default()
				}
				
				if (item[i, j].upgrade != item[i, j].maxUpgrade) {
					var upg_pst_x = xx+boxEdge/2+upgradePart_offset_x-(item[i, j].upgrade == 0)*90
					
					draw_roundrect(upg_pst_x-2, yy-10+10-2, 
					upg_pst_x+upgradePart_length+2, yy-10+30+2, 0)
					
					draw_set_alpha(mainAlpha*0.5) draw_set_color(c_black)
						draw_rectangle(upg_pst_x+upgradePart_length/2+46, yy-boxEdge/2-1, upg_pst_x+upgradePart_length/2+44, yy+boxEdge/2+2, 0)
						draw_rectangle(upg_pst_x+upgradePart_length/2-46, yy-boxEdge/2-1, upg_pst_x+upgradePart_length/2-44, yy+boxEdge/2+2, 0)
						draw_rectangle(upg_pst_x+upgradePart_length/2-46, yy-boxEdge/2-1, upg_pst_x+upgradePart_length/2+46, yy+boxEdge/2+2, 0)
					draw_set_valign(fa_top) draw_set_halign(fa_left) draw_set_font(fontMain) draw_set_alpha(mainAlpha) draw_set_color(c_white)
						draw_text(upg_pst_x, yy-boxEdge/2-3, item[i, j].upgrade == 0 ? ltext_unlock : ltext_upgrade)
					draw_set_color(c_black)
					
					if (global.skillPoints < item[i, j].neededPoints)
						draw_set_color(c_dkgray)
					else if (mouseOnBox_i == i and mouseOnBox_j == j and mouseOnBox_forUpgrade)
						draw_set_color(c_lime)
					else
						draw_set_color(c_green)
						
					draw_set_center()
						draw_roundrect(upg_pst_x, yy-10+10, 
						upg_pst_x+upgradePart_length, yy-10+30, 0)
					draw_set_color(c_black)
						var pointsText
						if (item[i, j].neededPoints > 25)
							pointsText = "-"
						else
							pointsText = string(item[i, j].neededPoints)
						draw_text(upg_pst_x+upgradePart_length/2, yy-10+20, pointsText+" "+(eng() ? "points" : "puan"))
					draw_set_default()
				}
            
	            with (item[i, j]) {
	                i = other.i
	                j = other.j
                    
	                draw_sprite_ext(sprite_index, -1,
	                xx+5, yy,
	                1, 1,
	                image_angle, image_blend,
	                mainAlpha*(1-(global.itemSelected == id)/2))
					
					if (upgrade < 1) {
						/*with (other) {
							draw_set_alpha(mainAlpha*0.35)
								if (!other.passive)
									draw_roundrect(xx-boxEdge/2+2, yy-boxEdge/2+2, 
									xx+boxEdge/2-2, yy+boxEdge/2-2, 0)
								else
									draw_circle(xx, yy,
									19, 0)
							draw_set_alpha(mainAlpha)
						}*/
					}
					
					if (!condition)
						draw_sprite(sprLockSymbol, 0, xx, yy)
	            }
			}
        }
    }
	
	draw_set_alpha(mainAlpha)
    
    // Exit button
    exitButtonEdge= 30+IS_MOBILE*6
    exitButton_x = x+horizontalBoxCount*(boxEdge+boxBetween)-boxBetween+offset_x*2-offset_x-exitButtonEdge-cut_right
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
		draw_roundrect(x, y, m_end_x, m_end_y, 0)
	}
	
	draw_set_alpha(greenForeground_alpha) draw_set_color(c_green)
		draw_roundrect(x+2, y+2, m_end_x-2, m_end_y-2, 0)
draw_set_alpha(1) gpu_set_tex_filter(1) draw_set_default()