var _delta = 0.025*delta()
if (image_xscale+_delta < targetScale) {
	image_xscale += _delta
	image_yscale = image_xscale
	alarm[4] = 1
}