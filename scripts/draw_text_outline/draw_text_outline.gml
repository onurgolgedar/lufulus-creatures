/// @param x
/// @param y
/// @param str
/// @param outwidth
/// @param outcol
/// @param outfidelity
/// @param xscale
/// @param yscale
/// @param angle
function draw_text_outline() {

	var dto_dcol = draw_get_color()
	var dto_dalpha = draw_get_alpha()
	draw_set_color(argument[4])

	draw_set_alpha(dto_dalpha > 0.1 ? dto_dalpha*dto_dalpha : 0)
	for (var dto_i = 45; dto_i < 405; dto_i += 360/argument[5])
	    draw_text_transformed(argument[0]+lengthdir_x(argument[3], dto_i), argument[1]+lengthdir_y(argument[3], dto_i), argument[2], argument[6], argument[7], argument[8])
	draw_set_alpha(dto_dalpha)

	draw_set_color(dto_dcol)
	draw_text_transformed(argument[0], argument[1], argument[2], argument[6], argument[7], argument[8])


}
