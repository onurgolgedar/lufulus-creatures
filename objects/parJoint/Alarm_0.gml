var decrease = 0.07*delta()

active = false

if (image_alpha-decrease > 0)
	image_alpha -= decrease
else {
	instance_destroy()
	image_alpha = 0
}
	
alarm[0] = 2