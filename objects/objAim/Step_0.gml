if (image_index != 0) {
	if  (objPlayer.attackTimer == 0 and !mouse_check_button(mb_left)) {				
		image_index = 0
		image_xscale = 1
		image_yscale = 1
		image_alpha = 0.6
	}
}