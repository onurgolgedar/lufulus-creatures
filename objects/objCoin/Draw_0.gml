if (global.performanceMode != 0) {
	draw_sprite_ext(sprCoin_shadow, 0, x, y, image_xscale, image_yscale, image_angle, c_black, image_alpha*0.8)
	draw_sprite_ext(sprSparkle, currentFrame_sparkle, x, y, 1, 1, rotation_sparkle, c_white, 1)
}
	
draw_sprite_ext(sprite_index, chosen_image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)