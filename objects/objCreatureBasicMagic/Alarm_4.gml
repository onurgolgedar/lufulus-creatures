if (image_alpha < 1 and alarm[0] > 1) {
	image_alpha += 1/8
	part_type_alpha3(pt_magic_Effect1, 0.6*image_alpha, 0.4*image_alpha, 0)
	
	if (image_alpha > 1)
		image_alpha = 1
	
	delta_alarm(4, 1)
}
else if (alarm[0] > 1)
	delta_alarm(4, 1)