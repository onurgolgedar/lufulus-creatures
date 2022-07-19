var isEnglish = eng()

draw_set_alpha(0.75*image_alpha)
	draw_rectangle(-1, -1, display_get_gui_width(), display_get_gui_height(), 0)
draw_set_alpha(image_alpha)

gpu_set_tex_filter(1)
	draw_sprite_ext(sprMap, 0, x, y, size, size, 0, image_blend, image_alpha)
gpu_set_tex_filter(1)

draw_set_alpha(image_alpha)
	//var gui_size = 1.12
	draw_sprite_ext(sprYoureHere, -1, x+54, y+159, size, size, -current_time/4, c_white, image_alpha)
	draw_sprite_ext(sprYouvePossible, -1, x+54, y+189, size, size, 0, c_white, image_alpha)
	draw_sprite_ext(sprYouveFinished, -1, x+54, y+219, size, size, 0, c_white, image_alpha)
	draw_sprite_ext(sprYouveQuest, -1, x+54, y+249, size, size, 0, c_white, image_alpha)
	draw_sprite_ext(sprLockSymbol, 2, x+54, y+279, size*0.65, size*0.65, 0, c_white, image_alpha)

	gpu_set_tex_filter(1) draw_set_font(fontBeautiful) draw_set_color(c_ltgray)
		draw_text(x+72, y+143, isEnglish ? "Your Location" : "Konumun")
		draw_text(x+72, y+173, isEnglish ? "Quest Offer" : "Görev Teklifi")
		draw_text(x+72, y+203, isEnglish ? "Completed Quest" : "Biten Görev")
		draw_text(x+72, y+233, isEnglish ? "Active Quest" : "Aktif Görev")
		draw_text(x+72, y+263, isEnglish ? "Locked Area": "Kilitli Bölge")
	gpu_set_tex_filter(1) draw_set_font(global.mainFont)
draw_set_alpha(image_alpha/1.5) draw_set_color(c_black)

with (parLocation) {
	var youAreHere = global.locationName == name
	var isCastle = is_castle(roomIndex)

	image_xscale = 1+(isBig or youAreHere)/5
	image_yscale = image_xscale
	
	var aalpha = objMap.image_alpha/(1+!mouseOn*!youAreHere/6)

	if (point_distance(objMap.x+x, objMap.y+y, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)) < 17+isBig*10+IS_MOBILE*12) {
		mouseOn = true
		image_xscale *= 1.2
		image_yscale *= 1.2
	}
	else
		mouseOn = false
		
	if (IS_MOBILE and other.location_lastSelected == id) {
		draw_set_alpha(aalpha*0.8)
			draw_circle_width(objMap.x+x, objMap.y+y, 20+isBig+contMain.period/5, 29+isBig*2+contMain.period/3, 27)
		draw_set_color(unlocked ? c_orange : c_dkgray)
			draw_circle_width(objMap.x+x, objMap.y+y, 22+isBig+contMain.period/7, 25+isBig*2+contMain.period/5, 27)
		draw_set_alpha(1) draw_set_color(c_black)
		
		if (!youAreHere) {
			draw_set_alpha(aalpha*0.8*other.travelButton_alpha)
				draw_roundrect(other.travelX, other.travelY, other.travelX2, other.travelY2, false)
			draw_set_color(unlocked ? c_orange : c_dkgray) draw_set_alpha(aalpha*0.8*other.travelButton_alpha)
				draw_roundrect(other.travelX+5, other.travelY+3, other.travelX2-7, other.travelY2-3, false)
			draw_set_alpha(1) draw_set_color(c_black)
		
			draw_set_center() draw_set_font(fontGUi) draw_set_alpha(aalpha*other.travelButton_alpha)
				draw_text((other.travelX+other.travelX2)/2, (other.travelY+other.travelY2)/2, unlocked ? (eng() ? "Travel" : "Git") : (eng() ? "Locked" : "Kilitli"))
			draw_set_default() draw_set_alpha(1)
		}
	}
		
	var pointSize = (1.2+IS_MOBILE*0.4+mouseOn/4+isBig/4+youAreHere*0.12)*(1+unlocked*0.35+contMain.period/(100-youAreHere*68))
	//draw_sprite_ext(sprLocationPoint, unlocked ? point_index : 2, objMap.x+x, objMap.y+y, pointSize+0.1, pointSize+0.1, -current_time/2*youAreHere, c_white, aalpha)
	draw_sprite_ext(sprLocationPoint, (isDestroyed and point_index == 0) ? 3 : (unlocked ? point_index : 2), objMap.x+x, objMap.y+y, pointSize*1.05, pointSize*1.05, -current_time/2*youAreHere, c_black, aalpha*1.25)
	draw_sprite_ext(sprLocationPoint, (isDestroyed and point_index == 0) ? 3 : (unlocked ? point_index : 2), objMap.x+x, objMap.y+y, pointSize, pointSize, -current_time/2*youAreHere, c_white, aalpha*1.25)
		
	var symbolSize = 1.1+mouseOn*0.35+IS_MOBILE*0.4
	
	if (symbol != -1 and (unlocked or isCastle) and isBig) { // old: if (symbol != -1)
		draw_sprite_ext(symbol, -1, objMap.x+x, objMap.y+y, symbolSize, symbolSize, 0, c_white, objMap.image_alpha)
		/*if (!unlocked)
			draw_sprite_ext(symbol, -1, objMap.x+x, objMap.y+y, symbolSize, symbolSize, 0, c_black, objMap.image_alpha/1.4)*/
	}
	
	if (!unlocked) {
		draw_sprite_ext(sprLockSymbol, 2, objMap.x+x+isCastle*20, objMap.y+y-isCastle*8, symbolSize-0.05-isCastle*0.3, symbolSize-0.05-isCastle*0.3, 0, c_black, objMap.image_alpha/3.5)
		draw_sprite_ext(sprLockSymbol, 2, objMap.x+x+isCastle*20, objMap.y+y-isCastle*8, symbolSize-0.2-isCastle*0.3, symbolSize-0.2-isCastle*0.3, 0, c_ltgray, objMap.image_alpha/1.3)
	}
	
	if (!(isBig and level <= global.level)) {
		draw_set_center() draw_set_font(fontinfo_small)
			var str = string(level)+"-"+string(level+4)+"lv"
			
			//draw_set_alpha((1-other.upTextBox_alpha*(1.5-!mouseOn*0.8))*objMap.image_alpha)
			//draw_rectangle(objMap.x+x-str_w/2-3, objMap.y+y+13+contMain.period/4-8, objMap.x+x+str_w/2+3, objMap.y+y+13+contMain.period/4+8, 0)
			/*draw_set_color(c_ltgray)
			if (global.level < level)
				draw_roundrect(objMap.x+x-str_w/2-1, objMap.y+y+13+contMain.period/4-6, objMap.x+x+str_w/2+1, objMap.y+y+13+contMain.period/4+6, 0)*/
			draw_set_alpha(0.9*other.image_alpha)
			
			var ssize = 1.12
			if (isDestroyed) {
				draw_set_color(point_index == 0 ? c_red : c_orange)
				ssize = 0.9
			}
			else if (global.level < level)
				draw_set_color(c_nicered)
			else if (is_recommended_location()) {
				draw_set_color((contMain.period < 5) ? c_green : c_lime)
				ssize = 1.2
			}
			else
				draw_set_color(c_silver)
				
			if (!isDestroyed)
				draw_text_outline(objMap.x+x, objMap.y+y+16+contMain.period/4*unlocked, str, 2, c_black, global.performanceOutFidelty, ssize, ssize, 2)
			else {
				if (point_index == 0)
					draw_text_outline(objMap.x+x, objMap.y+y+16, eng() ? "defeated" : "bilinçsiz", 2, c_black, global.performanceOutFidelty, ssize*0.9, ssize*0.9, 2)
				else
					draw_text_outline(objMap.x+x, objMap.y+y+16, eng() ? "captainless" : "kaptansız", 2, c_black, global.performanceOutFidelty, ssize*0.9, ssize*0.9, 2)
			}
		draw_set_default()
	}
	
	//var txtSize = 1
	if (youAreHere) {
		//txtSize = (3+pointSize)/6
		draw_sprite_ext(sprYoureHere, 0, objMap.x+x, objMap.y+y, pointSize, pointSize, -current_time/4, c_white, aalpha)
	}
		
	if (object_index == locLerinForest and (room == roomBeforeRoad or room == roomRoad))
		draw_sprite_ext(sprYoureHere, 0, objMap.x+x-50, objMap.y+y-4, 1.4, 1.4, -current_time/4, c_white, aalpha)

	var logoSize = image_xscale+0.5+other.bonusSize
	
	if (hasPossibleQuest != false)
		draw_sprite_ext(sprYouvePossible, -1, objMap.x+x-12, objMap.y+y+contMain.period/5, logoSize, logoSize, image_angle, c_white, aalpha*(1-other.bonusSize/0.8))
	
	if (hasFinished != false)
		draw_sprite_ext(sprYouveFinished, -1, objMap.x+x, objMap.y+y-10+contMain.period/5, logoSize, logoSize, image_angle, c_white, aalpha*(1-other.bonusSize/0.8))
	
	if (hasQuest != false)
		draw_sprite_ext(sprYouveQuest, -1, objMap.x+x+12, objMap.y+y+contMain.period/5, logoSize, logoSize, image_angle, c_white, aalpha*(1-other.bonusSize/0.8))
	
	/*if (youAreHere){
		draw_set_center() draw_set_color(c_red)
			draw_text_outline(objMap.x+x-5, objMap.y+y-20, eng() ? "you" : "sen", 2, c_black, global.performanceOutFidelty, txtSize, txtSize, 4)
		draw_set_default()
	}*/
	
	draw_set_alpha(1)
}

/*draw_set_color(c_aqua) draw_set_alpha(image_alpha/6)
	draw_rectangle(-1, device_mouse_y_to_gui(0)-1, display_get_gui_width(), device_mouse_y_to_gui(0)+1, 0)
	draw_rectangle(device_mouse_x_to_gui(0)-1, 0, device_mouse_x_to_gui(0)+1, display_get_gui_height(), 0)
draw_set_color(c_black) draw_set_alpha(1)*/

var mouseOnLocation = false
with (parLocation) {
	if (mouseOn and !IS_MOBILE or other.location_lastSelected == id and IS_MOBILE) {
		mouseOnLocation = true
		
		/*var fx = objMap.x+x//device_mouse_x_to_gui(0)
		var fy = objMap.y+y-contMain.period/2//device_mouse_y_to_gui(0)
	
		draw_set_color(unlocked ? c_ltyellow : c_gray) draw_set_alpha(0.8*other.image_alpha*other.upTextBox_alpha)
			draw_roundrect(fx-tbW/2-8, fy-16-40, fx+tbW/2+8, fy+16-40, 0)
		draw_set_color(c_black) draw_set_alpha(other.image_alpha*other.upTextBox_alpha)
			draw_rectangle_width(fx-tbW/2-8, fy-16-40, fx+tbW/2+8, fy+16-40, 3)
		draw_set_alpha(1)
		
		if (tbW_desc != 0) {
			draw_set_color(unlocked ? c_ltyellow : c_gray) draw_set_alpha(0.8*other.image_alpha*other.bottomTextBox_alpha)
				draw_roundrect(fx-tbW_desc/2-6, fy+34, fx+tbW_desc/2+6, fy+38+tbH_desc, 0)
			draw_set_color(c_black) draw_set_alpha(1*other.image_alpha*other.bottomTextBox_alpha)
				draw_rectangle_width(fx-tbW_desc/2-6, fy+34, fx+tbW_desc/2+6, fy+38+tbH_desc, 3)
			draw_set_alpha(1)
		}
		
		draw_set_valign(fa_center) draw_set_halign(fa_center) draw_set_font(fontLocation) gpu_set_tex_filter(1) draw_set_alpha(other.upTextBox_alpha*other.image_alpha)
			draw_text_colortags(fx, fy-40, tbT)
		draw_set_font(fontLocation_small) draw_set_valign(fa_top) draw_set_alpha(other.bottomTextBox_alpha*other.image_alpha)
			if (tbW_desc != 0)
				draw_text_colortags(fx, fy+36, tbT_desc)
		draw_set_default() gpu_set_tex_filter(1) draw_set_alpha(1)*/
	}
}

with (parLocation) {
	if (mouseOn and !IS_MOBILE or other.location_lastSelected == id and IS_MOBILE) {			
		draw_set_font(fontGUi) draw_set_color(c_orange) draw_set_alpha(other.bottomTextBox_alpha*objMap.image_alpha)
			draw_set_halign(IS_MOBILE ? fa_right : fa_left)
			draw_text_outline(objMap.x-73-IS_MOBILE*20, objMap.y-380+IS_MOBILE*80, name, 3, c_black, global.performanceOutFidelty, 1.1, 1.1, 0)
			draw_set_halign(fa_left)
			if (!IS_MOBILE and is_recommended_location()) {
				draw_set_color((contMain.period < 5) ? c_green : c_lime)
				draw_text_outline(objMap.x+190, objMap.y-239+61*IS_MOBILE, eng() ? "Recommended for\n   your level" : "Seviyen için\n    öneriliyor.", 3, c_black, global.performanceOutFidelty, 0.57+IS_MOBILE*0.03, 0.57+IS_MOBILE*0.03, 0)
				draw_set_halign(fa_left)
			}
		draw_set_color(c_yellow) draw_set_font(fontMain)
			draw_text_outline(objMap.x-73-IS_MOBILE*10, objMap.y-335+IS_MOBILE*35, infoText, 3, c_black, global.performanceOutFidelty, 1, 1, 0)
		draw_set_color(c_black) draw_set_alpha(1)
	}
}

if (mouseOnLocation) {
	var _delta = 0.05*delta()
	if (upTextBox_alpha+_delta <= 1)
		upTextBox_alpha += _delta
		
	if (bottomTextBox_alpha+_delta <= 1)
		bottomTextBox_alpha += _delta
}
else {
	upTextBox_alpha = 0
	bottomTextBox_alpha = 0
}
	
gpu_set_tex_filter(1) draw_set_alpha(1)

if (global.debugMode)
	draw_text(device_mouse_x_to_gui(0)+10, device_mouse_y_to_gui(0), string(device_mouse_x_to_gui(0)-x)+", "+string(device_mouse_y_to_gui(0)-y))