angle += xImpulse*1.8
xscale += 0.025-short*0.015
yscale = xscale

var decrease = 0.15+short*0.024-global.performanceMode*0.025

if (image_alpha > decrease)
	image_alpha -= decrease
else
	instance_destroy()
	
alarm[0] = floor(2/delta())+1