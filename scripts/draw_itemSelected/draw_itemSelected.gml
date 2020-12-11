function draw_itemSelected() {
	with (global.itemSelected) { 
	    var sprite
		var shadow = false
		var ssize = 1.2
		var addAngle = 0
	
	    if (type == type_mweapon or type == type_sweapon) {
	        sprite = sprite_index
			shadow = true
			ssize = 0.65
			addAngle = 45
		} else if (type == type_clothes or type == type_potion or type == type_pet or type == type_hair) {
			if (type == type_clothes)
				ssize = 0.65
			
			sprite = sprite_index
			addAngle = 45
		} else
	        sprite = sprite_index
		
		if (type == type_hair) {
			draw_sprite_ext(sprHead, image_index, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), ssize, ssize, image_angle+addAngle, c_white, 1)
		}
            
		if (shadow)
			draw_outline_origin(sprite, -1, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), ssize, ssize, image_angle+addAngle, 1)
			
	    draw_sprite_origin_ext(sprite, -1,
	    device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
	    ssize, ssize,
	    image_angle+addAngle, image_blend, 1)
	
		if (type == type_clothes) {
			draw_sprite_ext(sprHead, image_index, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), ssize, ssize, image_angle+addAngle, c_white, 1)
		
			draw_sprite_ext(global.hair, image_index, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), ssize, ssize, image_angle+addAngle, c_white, 1)
			draw_outline_low(global.hair, image_index, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), ssize, ssize, image_angle+addAngle)
		}
	
		draw_sprite_ext(sprMarkBubble, -1, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0.6, 0.6, 0, c_white, 1)
	
		/*if (from == window_trade or from == "Loot") {
			draw_set_color(c_aqua) draw_set_halign(fa_center) draw_set_valign(fa_center)
				draw_text_outline(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)-60, eng() ? ("Double "+(IS_MOBILE ? "tap" : "click")+" to "+(from == window_trade ? "buy" : "take"))
				:((from == window_trade ? "Satın almak için " : "Almak için ")+"çift "+(IS_MOBILE ? "dokun" : "tıkla")), 2, c_black, 12, 1.3, 1.3, 0)
			draw_set_default()
		}*/
	}


}
