drawPaths = true

if (surface_exists(global.shadowSurface_wall)) {
	surface_resize(global.shadowSurface_wall, room_width, room_height)

	surface_set_target(global.shadowSurface_wall)
		draw_clear_alpha(c_black, 0)
	surface_reset_target()
}
else
	global.shadowSurface_wall = create_surface(room_width, room_height)
