/// @param fps
function game_set_fps() {
	var gameSpeed = game_get_speed(gamespeed_fps)
	var wantedGameSpeed = argument[0] == fps_free ? 300 : (argument[0] == fps_average ? global.averageFPS : argument[0])

	if (argument[0] == fps_free) {
		global.freeFPS_mode = true
	
		var worldSpeed = physics_get_optimial_speed()
		if (global.physics_world_speed != worldSpeed and abs(1-global.physics_world_speed/worldSpeed) > 0.97 or (get_nearest_standard_fps(global.physics_world_speed/2.3) != global.physics_world_speed/2.3))
			physics_world_sync(worldSpeed)
	}

	if (gameSpeed != wantedGameSpeed)
		game_set_speed(wantedGameSpeed, gamespeed_fps)

	if (argument[0] != fps_free) {
		global.freeFPS_mode = false
	
		var worldSpeed = physics_get_optimial_speed()
		if (global.physics_world_speed != worldSpeed and abs(1-global.physics_world_speed/worldSpeed) > 0.97 or (get_nearest_standard_fps(global.physics_world_speed/2.3) != global.physics_world_speed/2.3))
			physics_world_sync(worldSpeed)
	}


}
