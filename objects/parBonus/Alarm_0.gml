alarm[0] = 3

if (image_alpha-0.05 > 0) {
	image_alpha -= 0.05
	light.sl_light_power *= 0.8
}
else
	instance_destroy()