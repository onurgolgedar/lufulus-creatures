draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha/alphaBaseRatio)

if (upgSk5 > 0)
	draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, c_white, image_alpha/alpha5ratio)

if (upgSk7 > 0)
	draw_sprite_ext(sprite_index, 3, x, y, image_xscale, image_yscale, 0, c_white, image_alpha/alpha7ratio)
	
if (upgSk6 > 0)
	draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, 0, c_white, image_alpha/alpha6ratio)