if (image_alpha > 0) {
	image_alpha -= 0.1
	part_type_alpha3(pt_magic_Effect1, 0.6*image_alpha, 0.4*image_alpha, 0)
	
	alarm[0] = 1
}
else
	event_user(1)