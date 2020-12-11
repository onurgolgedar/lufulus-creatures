var mainAlpha = image_alpha

var m_end_x = x+horizontalBoxCount*(boxWidth+boxBetween)-boxBetween+offset_x*2
var m_end_y = y+verticalBoxCount*(boxHeight+(boxBetween+boxBetween_additionalV))-(boxBetween+boxBetween_additionalV)+offset_yTop+offset_yDown

draw_set_alpha(mainAlpha) gpu_set_tex_filter(1)

	draw_set_alpha(mainAlpha/1.2)
	draw_roundrect(x, y, m_end_x, m_end_y, 0)
	draw_set_color(front ? windowColor_main : c_gray) draw_set_alpha(mainAlpha/4)
        draw_roundrect(x+2, y+2, m_end_x-2, m_end_y-2, 0)
    draw_set_color(windowColor)
        draw_roundrect(x+4, y+4, m_end_x-4, m_end_y-4, 0)
	draw_set_color(c_ltgray) draw_set_alpha(mainAlpha/2)
		draw_rectangle(x+5, y+4+75, m_end_x-4,
		m_end_y-4, 0)
	draw_set_color(c_black) draw_set_alpha(mainAlpha)
	draw_roundrect(x, y, m_end_x, m_end_y, 1)
	
    draw_set_font(fontMessageTitle) draw_set_color(c_white)
        draw_text(x+offset_x, y+offset_x+31+IS_MOBILE*4, ltext_quests)
    draw_set_font(global.mainFont) draw_set_color(c_black)
	
	draw_set_font(fontInfo_small) draw_set_center()
		if (blueBack_start[page] != -1) {			
			draw_set_color(c_ltblue) draw_set_alpha(mainAlpha*0.35)
				//draw_rectangle(x+5, y+box_y[page-1, blueBack_start[page]]-boxHeight/2, m_end_x-4, y+box_y[page-1, blueBack_end[page]]+boxHeight/2, 0)
				draw_roundrect(x+5+4, y+box_y[page-1, blueBack_start[page]]-boxHeight/2, m_end_x-4-4, y+box_y[page-1, blueBack_end[page]]+boxHeight/2+2, 0)
			draw_set_alpha(mainAlpha) draw_set_color(c_black)
		}
	
		if (orangeBack_start[page] != -1) {			
			draw_set_color(c_gold) draw_set_alpha(mainAlpha*0.35)
				//draw_rectangle(x+5, y+box_y[page-1, orangeBack_start[page]]-boxHeight/2, m_end_x-4, y+box_y[page-1, orangeBack_end[page]]+boxHeight/2, 0)
				draw_roundrect(x+5+4, y+box_y[page-1, orangeBack_start[page]]-boxHeight/2, m_end_x-4-4, y+box_y[page-1, orangeBack_end[page]]+boxHeight/2+2, 0)
		}
		
		if (yellowBack_start[page] != -1) {			
			draw_set_color(c_challenge) draw_set_alpha(mainAlpha*0.35)
				//draw_rectangle(x+5, y+box_y[page-1, yellowBack_start[page]]-boxHeight/2, m_end_x-4, y+box_y[page-1, yellowBack_end[page]]+boxHeight/2, 0)
				draw_roundrect(x+5+4, y+box_y[page-1, yellowBack_start[page]]-boxHeight/2, m_end_x-4-4, y+box_y[page-1, yellowBack_end[page]]+boxHeight/2+2, 0)
		}
	draw_set_default() draw_set_alpha(mainAlpha)
    
	event_perform(ev_other, ev_user2)
    for (var i = horizontalBoxCount*(page-1); i < horizontalBoxCount*page; i++) {
        for (var j = 0; j < verticalBoxCount; j++) {
			var xx = x+box_x[i, j]
			var yy = y+box_y[i, j]
			
			if (item[i, j] != -1) {
	            draw_set_alpha(mainAlpha)
        
				var mouseOn = mouseOnBox_i == i and mouseOnBox_j == j
				
				if (item[i, j].isSimpleQuest) {
					draw_set_alpha(mainAlpha/2) draw_set_color(c_navy)
						draw_roundrect(xx-boxWidth/2, yy-boxHeight/2, 
			            xx+boxWidth/2, yy+boxHeight/2, 0)
					draw_set_alpha(mainAlpha) draw_set_color(c_black)
				}
				
				draw_set_alpha(mainAlpha*(0.6-(item[i, j].isSimpleQuest or item[i, j].isPrepQuest)*0.2))
	            if (item[i, j] == global.itemSelected and global.itemSelected != -1) draw_set_color(c_white)
	            else if (mouseOn) draw_set_color(c_yellow)
	            else if (item[i, j] != -1 and global.questScore[j+(page-1)*verticalBoxCount] == global.questMaxScore[j+(page-1)*verticalBoxCount]) draw_set_color(c_green)
				else { draw_set_color(c_dkgray) draw_set_alpha(mouseOn) }
					draw_roundrect(xx-boxWidth/2+2, yy-boxHeight/2+3, 
		            xx+boxWidth/2-2, yy+boxHeight/2-1-item[i, j].isSimpleQuest, 0)
	            draw_set_color(c_black) draw_set_alpha(mainAlpha)
            
				draw_set_font(fontQuestInfo)
			        with (item[i, j]) {
			            draw_sprite_ext(sprite_index, -1,
			            xx, yy,
			            1, 1,
			            image_angle, image_blend,
			            mainAlpha*(1-(global.itemSelected == id)/2))
					
						draw_text_transformed(xx-other.boxWidth/2+other.offset_x-2, yy-other.boxHeight/2+14+IS_MOBILE*6, shortDesc, 1+IS_MOBILE*0.13, 1+IS_MOBILE*0.13, 0)
						
						draw_set_valign(fa_center) draw_set_halign(fa_right) draw_set_font(fontSlidingValue)
							draw_text_transformed(xx+other.boxWidth/2-other.offset_x+2, yy-other.boxHeight/2+10+IS_MOBILE*8, name_upper, 1+IS_MOBILE*0.13, 1+IS_MOBILE*0.13, 0)
								
						if (j < other.verticalBoxCount-1 and other.item[i, j+1] != -1 and other.blueBack_start[other.page] != j+1
						and other.yellowBack_start[other.page] != j+1 and other.orangeBack_start[other.page] != j+1 and !other.item[i, j+1].isSimpleQuest) {
							draw_set_alpha(mainAlpha/1.7)
								draw_rectangle(xx-other.boxWidth/2, yy+other.boxHeight/2+3, xx+other.boxWidth/2+1, yy+other.boxHeight/2+4, 0)
							draw_set_alpha(mainAlpha)
						}
			        }
				draw_set_default()
				
				/*if (item[i, j].isSimpleQuest) {
					draw_set_alpha(mainAlpha/1.7)
						draw_rectangle_width(xx-boxWidth/2+3, yy-boxHeight/2+2, xx+boxWidth/2-3, yy+boxHeight/2-2, 2)
					draw_set_alpha(mainAlpha)
				}*/
			}
        }
    }
    
    // Exit button
    exitButtonEdge = 30+IS_MOBILE*6
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
	
    // Page 5 button
    pageButtonEdge[5] = 30+IS_MOBILE*6
    pageButton_x[5] = exitButton_x-offset_x-pageButtonEdge[5]
    pageButton_y[5] = y+offset_x
    
    if (front and mouseOnBody and device_mouse_x_to_gui(0) > pageButton_x[5] and device_mouse_x_to_gui(0) < pageButton_x[5]+pageButtonEdge[5] and
    device_mouse_y_to_gui(0) > pageButton_y[5] and device_mouse_y_to_gui(0) < pageButton_y[5]+pageButtonEdge[5]) {
        draw_set_color(c_lime)
        mouseOnPageButton5 = true
    }
    else {
        draw_set_color(c_dkgray)
        mouseOnPageButton5 = false
    }
        
	// Button Outline
	var beforeColor = draw_get_color() draw_set_color(c_black)
	draw_roundrect(pageButton_x[5]-2, pageButton_y[5]-2,
	pageButton_x[5]+pageButtonEdge[5]+2, pageButton_y[5]+pageButtonEdge[5]+2, 0)
	draw_set_color((page != 5) ? beforeColor : c_ltgray)
			
	draw_roundrect(pageButton_x[5], pageButton_y[5],
	pageButton_x[5]+pageButtonEdge[5], pageButton_y[5]+pageButtonEdge[5], 0)
	draw_set_color(c_black)
    
    draw_set_center()
		draw_text(pageButton_x[5]+pageButtonEdge[5]/2, pageButton_y[5]+pageButtonEdge[5]/2, "5")
    draw_set_default()
	
    // Page 4 button
    pageButtonEdge[4] = 30+IS_MOBILE*6
    pageButton_x[4] = pageButton_x[5]-offset_x-pageButtonEdge[4]
    pageButton_y[4] = y+offset_x
    
    if (front and mouseOnBody and device_mouse_x_to_gui(0) > pageButton_x[4] and device_mouse_x_to_gui(0) < pageButton_x[4]+pageButtonEdge[4] and
    device_mouse_y_to_gui(0) > pageButton_y[4] and device_mouse_y_to_gui(0) < pageButton_y[4]+pageButtonEdge[4]) {
        draw_set_color(c_lime)
        mouseOnPageButton4 = true
    }
    else {
        draw_set_color(c_dkgray)
        mouseOnPageButton4 = false
    }
        
	// Button Outline
	var beforeColor = draw_get_color() draw_set_color(c_black)
	draw_roundrect(pageButton_x[4]-2, pageButton_y[4]-2,
	pageButton_x[4]+pageButtonEdge[4]+2, pageButton_y[4]+pageButtonEdge[4]+2, 0)
	draw_set_color((page != 4) ? beforeColor : c_ltgray)
			
	draw_roundrect(pageButton_x[4], pageButton_y[4],
	pageButton_x[4]+pageButtonEdge[4], pageButton_y[4]+pageButtonEdge[4], 0)
	draw_set_color(c_black)
    
    draw_set_center()
        draw_text(pageButton_x[4]+pageButtonEdge[4]/2, pageButton_y[4]+pageButtonEdge[4]/2, "4")
    draw_set_default()
	
    // Page 3 button
    pageButtonEdge[3] = 30+IS_MOBILE*6
    pageButton_x[3] = pageButton_x[4]-offset_x-pageButtonEdge[3]
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
	draw_set_color(c_black)
    
    draw_set_center()
		draw_text(pageButton_x[3]+pageButtonEdge[3]/2, pageButton_y[3]+pageButtonEdge[3]/2, "3")
    draw_set_default()
    
    // Page 2 button
    pageButtonEdge[2] = 30+IS_MOBILE*6
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
	draw_set_color(c_black)
    
    draw_set_center()
		draw_text(pageButton_x[2]+pageButtonEdge[2]/2, pageButton_y[2]+pageButtonEdge[2]/2, "2")
    draw_set_default()
    
    // Page 1 button
    pageButtonEdge[1] = 30+IS_MOBILE*6
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
	
	if (!front) {
		draw_set_alpha(mainAlpha/6)
			draw_roundrect(x, y, m_end_x, m_end_y, 0)
	}
draw_set_alpha(1) gpu_set_tex_filter(1)