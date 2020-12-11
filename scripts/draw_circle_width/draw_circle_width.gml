/// @param x
/// @param y
/// @param rad1
/// @param rad2
/// @param segments
function draw_circle_width() {

	var _x = argument[0]
	var _y = argument[1]
	var r1 = argument[2]
	var r2 = argument[3]
	var sn = argument[4]

	var i = 0
	draw_primitive_begin(pr_trianglestrip)
	repeat (sn + 1) {
	    var d, dx, dy
	
	    d = i/sn*360
	
	    dx = lengthdir_x(1, d)
	    dy = lengthdir_y(1, d)
	
	    draw_vertex(_x+dx*r1, _y+dy*r1)
	    draw_vertex(_x+dx*r2, _y+dy*r2)
	
	    i += 1
	}
	draw_primitive_end()


}
