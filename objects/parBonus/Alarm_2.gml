alarm[2] = 3

if (image_xscale+0.05 < base_scale) {
	image_xscale += 0.05
	image_yscale += 0.05
	
	alarm[2] = 3
} else {
	image_xscale = base_scale
	image_yscale = base_scale
}