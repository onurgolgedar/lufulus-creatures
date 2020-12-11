var hor = image_xscale
var ver = image_yscale

for (var i = -abs(hor); i < abs(hor); i++) {
	for (var j = -abs(ver); j < abs(ver); j++) {
		var xx = x+i*50+25
		var yy = y+j*50+25
		
		if (!position_meeting(xx, yy, id))
			continue
	
		if (position_meeting(xx, yy, parRock))
			instance_destroy(instance_position(xx+5, yy+5, parRock))
	}
}