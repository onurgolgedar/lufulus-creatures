delta_alarm(1, sec/2)

if (target != -1 and instance_exists(target) and !target.death and point_distance(x, y, target.x, target.y) < 100)
	image_alpha = 0.5
else
	image_alpha = 0.8