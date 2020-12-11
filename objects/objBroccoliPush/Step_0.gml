image_alpha -= 0.5/30*fpsFactor
image_xscale -= 1/100*fpsFactor
image_yscale = image_xscale
image_angle += 14

if (image_alpha <= 0)
	instance_destroy()