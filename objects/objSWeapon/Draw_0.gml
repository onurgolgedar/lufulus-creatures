if (!objPlayer.noArms and !objPlayer.sWeaponAlpha_calm == 1) {
	var aalpha = objPlayer.weaponAlpha*image_alpha/(1+2*objPlayer.invisibility)*(1-objPlayer.sWeaponAlpha_calm)

	draw_outline(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, aalpha)
	draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, aalpha)

	if (shiningPower) {
		shader_set(shBright)
		var sh_alpha = contMain.uni_bright_alpha
		shader_set_uniform_f(sh_alpha, (0.18+contMain.period/(30-shiningPower*10))*aalpha)

		draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, c_white, 1)
		shader_reset()
	}
}