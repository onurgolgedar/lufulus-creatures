var mainAlpha = objMainMenuDraw.image_alpha
gpu_set_tex_filter(0)

var breath = contMain.period/(320+!usable*400)

if (room == roomMenu) {
	draw_sprite_ext(sprShadow, -1, x, y, 7, 3, image_angle, c_white, mainAlpha)
	
	draw_sprite_ext(sprite_index, !usable, x, y, image_xscale+0.02+breath/2, image_yscale+0.02+breath, image_angle, c_black, mainAlpha/1.8)
	draw_outline_width(sprite_index, -1, x, y, image_xscale+breath/2, image_yscale+breath, image_angle, mainAlpha/(1+(!mouseOn and IS_MOBILE)), c_black, 2)

	draw_sprite_ext(sprite_index, !usable, x, y, image_xscale+breath/2, image_yscale+breath, image_angle, image_blend, mainAlpha)
	
	if (usable and mouseOn and !IS_MOBILE) {
		shader_set(shBright)
		var sh_alpha = contMain.uni_bright_alpha
		shader_set_uniform_f(sh_alpha, (0.7+contMain.period/17)*mainAlpha)

		draw_sprite_ext(sprite_index, 0, x, y, image_xscale+breath/2, image_yscale+breath, image_angle, c_white, 0)
		shader_reset()
	}
	else
		draw_sprite_ext(sprite_index, 0, x, y, image_xscale+breath/2, image_yscale+breath, image_angle, c_black, 0.09*mainAlpha)
}
else if (IS_MOBILE and usable and (text == "Default" or text == "Varsayılan")) {
	draw_set_halign(fa_center) draw_set_valign(fa_center) draw_set_font(fontBeautiful) draw_set_alpha(mainAlpha) draw_set_color(c_yellow)
		draw_text_outline(room_width/2, y-67, eng() ? "General Recommendation: Default (30FPS)" : "Genel Tavsiye Edilen: Varsayılan (30FPS)", 2, c_black, 7, (1+mainAlpha*0.2)*image_xscale, (1+mainAlpha*0.2)*image_xscale, 0)
	draw_set_default() draw_set_alpha(1)
}
	
draw_sprite_ext(sprMainMenuButton_tape, 0, x, y, image_xscale+0.038, image_yscale+0.08, image_angle, c_black, mainAlpha/1.2)
draw_sprite_ext(sprMainMenuButton_tape, usable ? (mouseOn and !IS_MOBILE ? 2 : 0) : 1, x, y, image_xscale, image_yscale, image_angle, (usable and mouseOn and !IS_MOBILE) ? c_white : c_ltgray, mainAlpha)

gpu_set_tex_filter(1)

draw_set_halign(fa_center) draw_set_valign(fa_center) draw_set_font(fontMenuButton) draw_set_alpha(mainAlpha) draw_set_color(usable ? cl : c_gray)
	draw_text_outline(room_width/2/*-141*/, y+2, text, 2, c_black, 7, (0.8+mainAlpha*0.2+contMain.period/320)*image_xscale, (0.8+mainAlpha*0.2+contMain.period/320)*image_xscale, 0)
draw_set_default() draw_set_alpha(1)