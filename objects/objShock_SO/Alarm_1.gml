image_alpha -= 0.25*delta()

if (image_alpha <= 0)
	instance_destroy()
	
alarm[1] = 1