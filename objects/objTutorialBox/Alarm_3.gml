if (image_alpha < 1) {
	image_alpha += 0.1
	alarm[3] = 1
}
else if (IS_MOBILE) {
	image_xscale += 0.1
	image_yscale += 0.1
}