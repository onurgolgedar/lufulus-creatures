if (bodyType == 1) {
	var down = instance_create(x, y, objTreeBody_env)
	down.image_xscale = random_range(0.9, 1.05)*(1+image_xscale)/2
	down.image_yscale = down.image_xscale
	down.image_angle = image_angle*2
}

var trail = instance_create_layer(x, y, "lyBelowFloor", objPath_env)
trail.image_xscale *= 1.3
trail.image_yscale *= 1.3
trail.image_alpha = 0.7

if (object_index == objTree4_env) {
	trail.image_blend = c_yellow
	trail.image_xscale *= 1.19
	trail.image_yscale *= 1.19
}

image_speed = 1.2