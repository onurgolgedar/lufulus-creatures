/// @param updateSpeed
function physics_world_sync() {

	var updateSpeed = round(argument[0])
	physics_world_update_speed(updateSpeed)
	global.physics_world_speed = updateSpeed

	if (contMain.alarm[11] == -1)
		physics_update_iterations()


}
