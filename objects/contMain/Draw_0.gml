if (global.debugMode) {
	draw_set_alpha(0.3)
		mp_grid_draw(global.mainGrid)
	draw_set_alpha(1)
	
	draw_rectangle_width(0, 0, room_width, room_height, 5)

	with (contPathFollower) {
		draw_sprite(sprSmallAimMask, -1, x, y)
		draw_path(path, x, y, true)
	}
		
	draw_set_alpha(0.3)
		physics_world_draw_debug(1)
	draw_set_alpha(1)
}

/*if (room == roomForceFactorTest) {
	with (parAi) {
		draw_text(x, y-80, forceFactor)
		draw_text(x, y-120, string(phy_speed)+"/"+string(activeSpeed))
	}
}*/

if (arrowDraw_isOn) {
	with (parArrow) {
		if (fromPlayer and stuckTarget == pointer_null) {
			draw_sprite_ext(sprArrow_indicator, -1, x, y, 1, 1, image_angle, image_blend, image_alpha)
			draw_sprite_ext(sprArrow_indicator, -1, (phy_position_x+xp)/2, (phy_position_y+yp)/2, 1, 1, image_angle, image_blend, image_alpha*0.65)
			draw_sprite_ext(sprArrow_indicator, -1, xp, yp, 1, 1, image_angle, image_blend, image_alpha*0.45)
		}
	}
}