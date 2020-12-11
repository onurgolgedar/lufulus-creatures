//draw_outline(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_alpha*image_alpha)

if (global.performanceMode > 1+IS_MOBILE)
	draw_sprite_ext(sprite_index, -1, x, y, image_xscale+0.042, image_yscale+0.042, image_angle+1, c_black, image_alpha*image_alpha/2)
		
draw_sprite_ext(sprite_index, -1, x, y, image_xscale+0.035, image_yscale+0.035, image_angle, c_black, image_alpha*image_alpha)
draw_self()