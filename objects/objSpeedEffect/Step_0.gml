image_alpha -= 0.15/30*fpsFactor
image_xscale -= 1/30*fpsFactor
image_yscale = image_xscale

if (image_alpha <= 0)
	instance_destroy()