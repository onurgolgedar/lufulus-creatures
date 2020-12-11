event_inherited()

if (point_distance(x, y, objPlayer.x, objPlayer.y) < stopDis_citizen and angle_difference(point_direction(x, y, objPlayer.x, objPlayer.y), image_angle) < 50)
	stop_moving(irandom_range(0.5*sec, sec))