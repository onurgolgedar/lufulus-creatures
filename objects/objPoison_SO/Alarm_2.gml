var _delta = delta()*0.1
if (image_alpha+_delta < 1) {
	image_alpha += _delta
	alarm[2] = 1
}
else
	image_alpha = 1