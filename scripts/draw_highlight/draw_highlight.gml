/// @param alpha*
function draw_highlight() {

	var v_alpha
	if (argument_count == 0)
		v_alpha = 0.3
	else
		v_alpha = argument[0]

	var ssize = (1+contMain.period/120)*image_xscale

	shader_set(shDraw_aqua)
	shader_set_uniform_f(contMain.uni_drawAqua_alpha, v_alpha)
	draw_sprite_ext(sprite_index, -1, x, y, ssize, ssize, image_angle, c_aqua, v_alpha)
	shader_reset()


}
