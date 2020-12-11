/// @description Death Alpha

if (image_alpha > 0.1)
	image_alpha -= 0.1
else
	instance_destroy()
	
alarm[9] = 2