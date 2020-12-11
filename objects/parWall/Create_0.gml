inView = true

alarm[0] = 1

if (!position_meeting(x, y, objWallBuilder)) {
	var noSpawn_obj = instance_create_layer(x-image_xscale*sprite_width/2, y-image_yscale*sprite_height/2, "lyInvisible", contNoSpawn)
	noSpawn_obj.image_xscale = image_xscale
	noSpawn_obj.image_yscale = image_yscale
}