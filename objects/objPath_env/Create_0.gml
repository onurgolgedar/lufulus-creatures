image_angle = irandom(359)
image_alpha = random_range(0.22, 0.33)

if (abs(abs(image_xscale)-1) < 0.4) {
	image_xscale = random_range(0.8, 1.4)+0.5
	image_yscale = random_range(0.8, 1.4)+0.5
}

if (image_blend == c_white) {
	var c = irandom_range(230, 255)
	image_blend = make_color_rgb(c, c, c)
}