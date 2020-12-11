if (phy_active or stuckTarget == pointer_null) {
	draw_self()
	draw_sprite_ext(sprite_index, -1, (phy_position_x+xp)/2, (phy_position_y+yp)/2, 1, 1, image_angle, image_blend, image_alpha*0.45)
	draw_sprite_ext(sprite_index, -1, xp, yp, 1, 1, image_angle, image_blend, image_alpha*0.25)
	xp = phy_position_x
	yp = phy_position_y
}
else {
	var dir = targetDirection+stuckTarget.image_angle-targetFirstAngle
	draw_sprite_ext(sprite_index, image_index,
	stuckTarget.x+lengthdir_x(targetDistance, dir),
	stuckTarget.y+lengthdir_y(targetDistance, dir), 
	image_xscale, image_yscale, -stuckTarget.phy_rotation+angularDifference, image_blend, image_alpha)
}