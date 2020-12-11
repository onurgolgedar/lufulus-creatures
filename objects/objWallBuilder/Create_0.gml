var hor = image_xscale
var ver = image_yscale
var wall

var caster = instance_create_layer(x-3, y-3, "lyInvisible", objCaster)
caster.image_xscale = image_xscale+0.06
caster.image_yscale = image_yscale+0.06

var noSpawn_obj = instance_create_layer(x-3, y-3, "lyInvisible", contNoSpawn)
noSpawn_obj.image_xscale = image_xscale+0.06
noSpawn_obj.image_yscale = image_yscale+0.06

if (room == roomCastle2_area or room == roomCreature6) {
	if (image_blend == c_yellow)
		wall = objSmoothRockGrid_snow // ? snow
	else
		wall = objRockGrid_snow
}
else {
	if (image_blend == c_fuchsia)
		wall = objSmoothRockGrid_pinky
	else if (image_blend == c_red)
		wall = objRockGrid_brown
	else if (image_blend == c_yellow)
		wall = objSmoothRockGrid
	else
		wall = objRockGrid
}

for (var i = -abs(hor); i < abs(hor); i++) {
	for (var j = -abs(ver); j < abs(ver); j++) {
		var xx = x+i*50+25
		var yy = y+j*50+25
		
		if (!position_meeting(xx, yy, id))
			continue
	
		if (!position_meeting(xx, yy, parSolid))
			instance_create_layer(xx, yy, "lyBelowPlayer", wall)
	}
}

alarm[0] = 2