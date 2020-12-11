/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rotation
/// @param alpha*
/// @param color*
function draw_outline_origin() {

	var do_aalpha = image_alpha
	var do_width = 1
	var color = c_black

	if (argument_count > 7)
		do_aalpha = argument[7]*argument[7]
		
	if (argument_count > 8)
		color = argument[8]

	draw_sprite_origin_ext(argument[0], argument[1], argument[2], argument[3]-do_width, argument[4], argument[5], argument[6], color, do_aalpha)
	draw_sprite_origin_ext(argument[0], argument[1], argument[2], argument[3]+do_width, argument[4], argument[5], argument[6], color, do_aalpha)
	draw_sprite_origin_ext(argument[0], argument[1], argument[2]-do_width, argument[3], argument[4], argument[5], argument[6], color, do_aalpha)
	draw_sprite_origin_ext(argument[0], argument[1], argument[2]+do_width, argument[3], argument[4], argument[5], argument[6], color, do_aalpha)

	if (global.performanceMode == 3) {
		var sqrt2over2 = 0.7*do_width
		draw_sprite_origin_ext(argument[0], argument[1], argument[2]-sqrt2over2, argument[3]-sqrt2over2, argument[4], argument[5], argument[6], c_black, do_aalpha)
		draw_sprite_origin_ext(argument[0], argument[1], argument[2]+sqrt2over2, argument[3]+sqrt2over2, argument[4], argument[5], argument[6], c_black, do_aalpha)
		draw_sprite_origin_ext(argument[0], argument[1], argument[2]-sqrt2over2, argument[3]+sqrt2over2, argument[4], argument[5], argument[6], c_black, do_aalpha)
		draw_sprite_origin_ext(argument[0], argument[1], argument[2]+sqrt2over2, argument[3]-sqrt2over2, argument[4], argument[5], argument[6], c_black, do_aalpha)
	}


}
