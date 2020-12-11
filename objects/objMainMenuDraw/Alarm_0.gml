var value = 0.1*delta()
if (image_alpha+value < 1) {
	if (blackScreenAlpha == 0)
		image_alpha += value
		
	alarm[0] = 1
}
else
	image_alpha = 1