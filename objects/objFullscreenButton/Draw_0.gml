if (os_type == os_windows) {
	gpu_set_tex_filter(0)

	var mainAlpha = objMainMenuDraw.image_alpha*!IS_MOBILE

	var breath = contMain.period/(320+!usable*400)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale+breath+0.12, image_yscale+breath+0.12, image_angle, c_black, mainAlpha/1.8)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale+breath, image_yscale+breath, image_angle, c_white, mainAlpha)

	if (usable and mouseOn) {
		shader_set(shBright)
		var sh_alpha = contMain.uni_bright_alpha
		shader_set_uniform_f(sh_alpha, (0.7+contMain.period/17)*mainAlpha)

		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale+breath, image_yscale+breath, image_angle, c_white, mainAlpha)
		shader_reset()
	}
	else
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale+breath, image_yscale+breath, image_angle, c_white, 0.09*mainAlpha)
	
	draw_set_center() draw_set_color(cl) draw_set_font(fontMenuButton) draw_set_alpha(mainAlpha)
		draw_text_outline(x, y+54, image_index == 0 ? (eng() ? "Fullscreen\nMode" : "Tam\nEkran") : (eng() ? "Windowed\nMode" : "Pencere\nGörünümü"), 3, c_black, 7, 0.53, 0.53, 0)
		draw_text_outline(x, y-42, "<F11>", 3, c_black, 7, 0.53, 0.53, 0)
	draw_set_default() draw_set_alpha(1)
	
	gpu_set_tex_filter(1)
}