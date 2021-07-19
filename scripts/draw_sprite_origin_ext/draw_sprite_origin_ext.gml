/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param sx
/// @param sy
/// @param rot
/// @param col
/// @param alpha
function draw_sprite_origin_ext() {
	var q = argument[0]
	var ox = sprite_get_width(q)/2-sprite_get_xoffset(q)//argument[2]-sprite_get_xoffset(q)
	var oy = sprite_get_height(q)/2-sprite_get_yoffset(q)//argument[3]-sprite_get_yoffset(q)
	var sx = argument[4]
	var sy = argument[5]
	var d = argument[6]

	draw_sprite_ext(q, argument[1],
	argument[2] - sx*lengthdir_x(ox, d)-sy*lengthdir_x(oy, d-90),
	argument[3] - sx*lengthdir_y(ox, d)-sy*lengthdir_y(oy, d-90),
	sx, sy, d, argument[7], argument[8])
}
