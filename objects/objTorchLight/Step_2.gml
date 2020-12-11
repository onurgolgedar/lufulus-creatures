if (sl_light_refresh) {
	if (owner != -1) {
		// ? optimization
		if (owner.object_index == objShieldControl) {
			x = objPlayer.leftHand.x+lengthdir_x(11, objPlayer.leftHand.image_angle)
			y = objPlayer.leftHand.y+lengthdir_y(11, objPlayer.leftHand.image_angle)
		}
		else {
			x = owner.leftHand.x+lengthdir_x(11, owner.leftHand.image_angle)
			y = owner.leftHand.y+lengthdir_y(11, owner.leftHand.image_angle)
		}
	}
	
	sl_light_x = x
	sl_light_y = y
}