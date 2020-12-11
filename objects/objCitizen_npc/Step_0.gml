if (stopMoving and stopMovingTimer < 5 and point_distance(x, y, objPlayer.x, objPlayer.y) < stopDis_citizen and angle_difference(point_direction(x, y, objPlayer.x, objPlayer.y), image_angle) < 50)
	stop_moving(sec/12)
	
event_inherited()