var _delta = delta()

if (image_alpha-_delta > 0) {
	image_alpha -= _delta
	alarm[1] = 1
}
else
	instance_destroy()