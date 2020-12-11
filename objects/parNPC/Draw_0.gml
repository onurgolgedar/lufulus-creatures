isSellActive = false

if (inView) {	
	var image_xscale_new = image_xscale*scale_factor
	var image_yscale_new = image_yscale*scale_factor
	
	#region Rigidbody Draw
	var ds_element
	if (rigidbodyParts != pointer_null) {
		var ds_size = ds_list_size(rigidbodyParts)
		for (var rb = 0; rb < ds_size; rb++) {
			ds_element = ds_list_find_value(rigidbodyParts, rb)
			if (ds_element != shoulders and
			ds_element != leftHand and 
			ds_element != rightHand)
				with (ds_element)
					draw_outline_low(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_alpha)
		}

		gpu_set_tex_filter(0)
		var ds_size = ds_list_size(rigidbodyParts)
		for (var rb = 0; rb < ds_size; rb++) {
			ds_element = ds_list_find_value(rigidbodyParts, rb)
			if (ds_element != shoulders and
			ds_element != leftHand and 
			ds_element != rightHand)
				with (ds_element)
					draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
		}
		gpu_set_tex_filter(1)
		
		with (leftHand) {
			draw_outline_low(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_alpha)
			draw_self()
			
			if (other.hasTorch) {
				var xx = x+lengthdir_x(11, image_angle)
				var yy = y+lengthdir_y(11, image_angle)
				var aangle = -target*side-owner.phy_rotation
				var aalpha = image_alpha

				draw_outline(sprTorch, -1, xx, yy,  image_xscale, image_yscale, aangle, aalpha)
				draw_sprite_ext(sprTorch, -1, xx, yy,  image_xscale, image_yscale, aangle, image_blend, aalpha)
			}
		}

		with (rightHand) {
			draw_outline(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_alpha)
	
			if (other.weapon != pointer_null and !other.noArms and !other.isRanged) {
				draw_outline_low(other.weapon, -1, x+lengthdir_x(9, image_angle),
				y+lengthdir_y(9, image_angle), 1, 1, image_angle+70, c_white, image_alpha*image_alpha)
				draw_sprite_ext(other.weapon, -1, x+lengthdir_x(9, image_angle),
				y+lengthdir_y(9, image_angle), 1, 1, image_angle+70, c_white, image_alpha)
			}
		
			draw_self()
		}
	}
	#endregion
			
	var breathScale = 0.96+contMain.period/240
	
	if (rigidbodyParts != pointer_null) {
		with (shoulders) {
			draw_outline_low(sprite_index, -1, x, y, breathScale*image_xscale_new, breathScale*image_yscale_new, image_angle, image_alpha)
			draw_sprite_ext(sprite_index, -1, x, y, breathScale*image_xscale_new, breathScale*image_yscale_new, image_angle, image_blend, image_alpha)
		}
	}
		
	draw_outline_low(sprite_index, -1, x, y, image_xscale_new, image_yscale_new, image_angle, image_alpha)
	draw_sprite_ext(sprite_index, -1, x, y, image_xscale_new, image_yscale_new, image_angle, image_blend, image_alpha)

	draw_outline_low(hair, -1, x, y, image_xscale_new, image_yscale_new, image_angle, image_alpha, image_alpha)
	draw_sprite_ext(hair, -1, x, y, image_xscale_new, image_yscale_new, image_angle, image_blend, image_alpha)
	
	if ((isQuestTarget or isQuestTarget_direct)) {
		shader_set(shDraw_yellow)
			var sh_alpha = contMain.uni_bright_alpha
			shader_set_uniform_f(sh_alpha, image_alpha*(0.15+contMain.period/100))
			
			if (rigidbodyParts != pointer_null) {
				with (shoulders)
					draw_sprite_ext(sprite_index, -1, x, y, image_xscale_new+0.05, image_yscale_new+0.05, image_angle, image_blend, 0)
			}
			
			draw_sprite_ext(sprite_index, -1, x, y, image_xscale_new+0.1, image_yscale_new+0.1, image_angle, image_blend, 0)
			draw_sprite_ext(hair, -1, x, y, image_xscale_new+0.05, image_yscale_new+0.05, image_angle, image_blend, 0)
		shader_reset()
	}
	
	if (mode != md_attack and !death and position_meeting(mouse_x, mouse_y, id) and !test_upperclick_arrow() and !test_upperclick_window()) {	
		draw_highlight()
		isSellActive = true
	}
}

/*if (global.debugMode) {
	if (target != pointer_null and targetLock > 0) {
		draw_set_alpha((targetLock/30*targetLock/30)) draw_set_color(c_red)
			draw_line_width(x, y, target.x, target.y, 3)
		draw_set_alpha(1) draw_set_color(c_black)
	}
}*/