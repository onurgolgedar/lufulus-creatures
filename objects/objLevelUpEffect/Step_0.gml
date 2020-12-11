var v_decrease = 1/25*delta()

image_alpha -= v_decrease
image_yscale -= v_decrease
image_xscale -= v_decrease

addY -= 2.5*delta()

if (image_alpha <= 0)
	instance_destroy()