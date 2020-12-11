if (no < 15+global.level*2) {
	var newOne = instance_create_layer(objPlayer.x, objPlayer.y, "lyAbovePlayer", objLevelUpEffect)
	newOne.no = no+1
	with (newOne) {
		delta_alarm(0, 3)
			
		image_xscale *= 0.75+no/40
		image_yscale *= 0.75+no/40
	}
}