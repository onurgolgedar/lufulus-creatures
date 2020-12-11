var decrease = IS_MOBILE ? 0.08 : 0.06
if (image_alpha+decrease < 1)
	image_alpha += decrease
else
	image_alpha = 1
	
delta_alarm(1, IS_MOBILE ? 3 : 2)