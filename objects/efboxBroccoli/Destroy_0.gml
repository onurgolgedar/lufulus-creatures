event_inherited()

contPlayer.broccoliMode = false
with (objPlayer) {
	image_xscale = 1+contPlayer.broccoliMode*0.07
	image_yscale = image_xscale
	image_blend = contPlayer.broccoliMode ? c_broccoli : c_white
}

if (playerLight != pointer_null)
	with (playerLight)
		instance_destroy()