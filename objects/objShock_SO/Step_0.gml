if (image_alpha+0.15*delta() >= 1 and alarm[1] == -1) {
	alarm[1] = 1
	image_alpha = 1
}
else
	image_alpha += 0.15*delta()