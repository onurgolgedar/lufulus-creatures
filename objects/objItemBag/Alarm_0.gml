if (image_alpha < 1) {
    image_alpha += 1/6*delta()
    alarm[0] = 1
}
else if (!destroy)
	image_alpha = 1