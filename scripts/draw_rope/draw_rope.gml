/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param alpha
function draw_rope() {

	var dis = point_distance(argument[0], argument[1], argument[2], argument[3])

	draw_sprite_ext(sprRope, -1, argument[0], argument[1]
	, dis/100, 0.7*100/dis
	, point_direction(argument[0], argument[1], argument[2], argument[3])
	, c_white, argument[4])


}
