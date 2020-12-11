var dis = point_distance(owner.x, owner.y, target.x, target.y)

if (dis < 330 and !target.death) {
	image_xscale = dis/width
	image_alpha = min(1/image_xscale, 1)
	image_alpha *= image_alpha*ownerEfbox.time/ownerEfbox.maxTime
	
	if (dis < 100)
		dis = 100
		
	image_yscale = width/dis
}
else
	instance_destroy()
	
delta_alarm(0, sec/20)