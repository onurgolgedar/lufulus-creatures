if (room == roomMenu) {
	gpu_set_tex_filter(0)
	
		var mainAlpha = objMainMenuDraw.image_alpha
		with (objMainMenuButton) {
			if (usable) {
				#region Rigidbody Draw
				if (rigidbodyParts != pointer_null) {
					gpu_set_tex_filter(1)
					var ds_size = ds_list_size(rigidbodyParts)
					for (var rb = 0; rb < ds_size; rb++) {
						var rbd = ds_list_find_value(rigidbodyParts, rb)
		
						if (rbd != body and
						rbd != leftHand and
						rbd != rightHand)
							with (rbd)
								draw_outline_width(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, mainAlpha, c_black, 4)
					}
	
					gpu_set_tex_filter(0)
					var ds_size = ds_list_size(rigidbodyParts)
					for (var rb = 0; rb < ds_size; rb++) {
						var rbd = ds_list_find_value(rigidbodyParts, rb)
		
						if (rbd != body and
						rbd != leftHand and
						rbd != rightHand)
							with (rbd)
								draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, c_white, mainAlpha)
					}
					gpu_set_tex_filter(1)
		
					with (leftHand)
						draw_outline_width(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, mainAlpha, c_black, 3)
					with (rightHand)
						draw_outline_width(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, mainAlpha, c_black, 3)
	
					with (leftHand)
						draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, c_white, mainAlpha)
					with (rightHand)
						draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, c_white, mainAlpha)
				}
				#endregion
			}
		}

	gpu_set_tex_filter(1)
}