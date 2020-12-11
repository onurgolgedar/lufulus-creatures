contPlayer.broccoliMode = true
with (objPlayer) {
	image_xscale = 1+contPlayer.broccoliMode*0.07
	image_yscale = image_xscale
	image_blend = contPlayer.broccoliMode ? c_broccoli : c_white
}

playerLight = follow_light(objPlayer.id, 0.6, 1, false)
playerLight.sl_light_color = c_lime