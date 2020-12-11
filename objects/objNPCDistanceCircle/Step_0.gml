image_alpha -= 0.7/30*fpsFactor
image_angle += 7

if (image_alpha <= 0)
	instance_destroy()