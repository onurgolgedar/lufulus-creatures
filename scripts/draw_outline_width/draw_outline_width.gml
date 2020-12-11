/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rotation
/// @param alpha
/// @param color
/// @param width
function draw_outline_width() {

	var do_aalpha = image_alpha
	var do_width = argument[9]
	var color = c_black
	
	do_aalpha = argument[7]*argument[7]
	color = argument[8]

	draw_sprite_ext(argument[0], argument[1], argument[2], argument[3]-do_width, argument[4], argument[5], argument[6], color, do_aalpha)
	draw_sprite_ext(argument[0], argument[1], argument[2], argument[3]+do_width, argument[4], argument[5], argument[6], color, do_aalpha)
	draw_sprite_ext(argument[0], argument[1], argument[2]-do_width, argument[3], argument[4], argument[5], argument[6], color, do_aalpha)
	draw_sprite_ext(argument[0], argument[1], argument[2]+do_width, argument[3], argument[4], argument[5], argument[6], color, do_aalpha)

	// Extra CPU
	if (global.performanceMode > 1+IS_MOBILE) {
		var sqrt2over2 = sqrt(2)/2*do_width
		draw_sprite_ext(argument[0], argument[1], argument[2]-sqrt2over2, argument[3]-sqrt2over2, argument[4], argument[5], argument[6], color, do_aalpha)
		draw_sprite_ext(argument[0], argument[1], argument[2]+sqrt2over2, argument[3]+sqrt2over2, argument[4], argument[5], argument[6], color, do_aalpha)
		draw_sprite_ext(argument[0], argument[1], argument[2]-sqrt2over2, argument[3]+sqrt2over2, argument[4], argument[5], argument[6], color, do_aalpha)
		draw_sprite_ext(argument[0], argument[1], argument[2]+sqrt2over2, argument[3]-sqrt2over2, argument[4], argument[5], argument[6], color, do_aalpha)
	}


}
