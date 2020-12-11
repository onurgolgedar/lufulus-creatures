if (image_alpha < 1 and !destroy) {
    image_alpha += 1/4*delta()//*(time <= maxTime+sec/4)
	
	if (image_alpha > 1)
		image_alpha = 1
	
    alarm[1] = 1
}
else if (!destroy)
	image_alpha = 1