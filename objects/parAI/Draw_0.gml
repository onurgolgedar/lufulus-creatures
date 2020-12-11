if (inView) {
	var image_xscale_new = image_xscale*scale_factor
	var image_yscale_new = image_yscale*scale_factor
	
	if (abilityBrainAttack and brainSprite != pointer_null) {
		var size = 0.25+brain/80
		var xx = x+lengthdir_x(30, image_angle+180)
		var yy = y+lengthdir_y(30, image_angle+180)

		draw_outline_low(brainSprite, -1, xx, yy
		, size, size, image_angle)
		draw_sprite_ext(brainSprite, -1, xx, yy
		, size, size, image_angle, c_white, 0.8)
	}
	
	#region Rigidbody Draw
	if (rigidbodyParts != pointer_null) {
		var ds_size = ds_list_size(rigidbodyParts)
		for (var rb = 0; rb < ds_size; rb++) {
			var rbd = ds_list_find_value(rigidbodyParts, rb)
		
			if (rbd != body and
			rbd != leftHand and
			rbd != rightHand)
				with (rbd)
					draw_outline_low(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle)
		}
	
		gpu_set_tex_filter(0)
		var ds_size = ds_list_size(rigidbodyParts)
		for (var rb = 0; rb < ds_size; rb++) {
			var rbd = ds_list_find_value(rigidbodyParts, rb)
		
			if (rbd != body and
			rbd != leftHand and
			rbd != rightHand)
				with (rbd)
					draw_self()
		}
		gpu_set_tex_filter(1)
		
		with (leftHand)
			draw_outline_low(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle)
		with (rightHand)
			draw_outline_low(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle)
	
		with (leftHand)
			draw_self()
		with (rightHand)
			draw_self()
	}
	#endregion
		
	var breath = contMain.period/160*!death
	draw_outline_low(sprite_index, -1, x, y, image_xscale_new+breath, image_yscale_new+breath, image_angle)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale_new+breath, image_yscale_new+breath, image_angle, image_blend, image_alpha)

	if (rigidbodyParts != pointer_null and body != pointer_null) {
		with (body)
			draw_outline_low(sprite_index, -1, x, y, image_xscale_new, image_yscale_new, image_angle)
		with (body)
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale_new, image_yscale_new, image_angle, image_blend, image_alpha)
	}
	
	/*if ((isQuestTarget or isQuestTarget_direct) and mode != md_attack and !death) {
		shader_set(shDraw_yellow)
		var sh_alpha = contMain.uni_bright_alpha
		shader_set_uniform_f(sh_alpha, image_alpha*(0.15+contMain.period/100))
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale_new+breath+0.1, image_yscale_new+breath+0.1, image_angle, image_blend, 0)
		
		if (rigidbodyParts != pointer_null and body != pointer_null) {
			with (body) {
				shader_set_uniform_f(sh_alpha, image_alpha*(0.15+contMain.period/100))
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale_new+0.07, image_yscale_new+0.07, image_angle, image_blend, 0)
			}
		}
		shader_reset()
	}*/
}