image_speed = 0
image_index = irandom(image_number-1)

angle = 0
noOutline = false
inView = true

if (!position_meeting(x, y, objWallBuilder)) {
	var noSpawn_obj = instance_create_layer(x-image_xscale*sprite_width/2, y-image_yscale*sprite_height/2, "lyInvisible", contNoSpawn)
	noSpawn_obj.image_xscale = image_xscale
	noSpawn_obj.image_yscale = image_yscale
}

if (global.performanceMode >= 2 and !is_castle(room) and room != roomCave) {
	var dirt = instance_create_layer(x, y, "lyBelowFloor", objPath_env)
	dirt.image_blend = c_gray
}

alarm[0] = 1