function physics_update_iterations() {
	physics_world_update_iterations(35+global.performanceMode*2+round((max(40, game_get_fps())-60)*1/4)+max(0, room_speed-fps))


}
