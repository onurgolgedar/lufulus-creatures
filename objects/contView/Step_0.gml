if (!contMain.isRoomOut and !global.pause) {
	if (is_outfight()) {
		if (global.viewCircle > 0)
			global.viewCircle -= 0.5
	} 
	else {
		if (global.viewCircle < VIEWCIRCLE_MAX)
			global.viewCircle += 0.5
	}
	
	var dis = global.viewCircle
	x = objPlayer.x+lengthdir_x(dis, objPlayer.image_angle)
	y = objPlayer.y+lengthdir_y(dis, objPlayer.image_angle)
}

if (window_get_fullscreen())
	window_set_fullscreen(true)