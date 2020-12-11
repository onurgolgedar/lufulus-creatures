if (!owner.noArms) {
	var aalpha = image_alpha/(1+2*owner.invisibility)

	rh_center_x = owner.rightHand.x+lengthdir_x(6, owner.rightHand.image_angle)
	rh_center_y = owner.rightHand.y+lengthdir_y(6, owner.rightHand.image_angle)
	lh_center_x = owner.leftHand.x+lengthdir_x(6, owner.leftHand.image_angle)
	lh_center_y = owner.leftHand.y+lengthdir_y(6, owner.leftHand.image_angle)

	var bowDis = 7
	var bowAngle = owner.leftHand.image_angle
	var bowX = lh_center_x+lengthdir_x(bowDis, bowAngle)
	var bowY = lh_center_y+lengthdir_y(bowDis, bowAngle)

	#region Draw Rope
	if (!ropeFree) {
		draw_rope(bowX+lengthdir_x(46, bowAngle-103),
		bowY+lengthdir_y(46, bowAngle-103),
		rh_center_x,
		rh_center_y, aalpha)

		draw_rope(rh_center_x, 
		rh_center_y, 
		bowX+lengthdir_x(46, bowAngle+103),
		bowY+lengthdir_y(46, bowAngle+103), aalpha)
	}
	else {
		var tx = bowX+lengthdir_x(11, bowAngle+180)
		var ty = bowY+lengthdir_y(11, bowAngle+180)
	
		draw_rope(bowX+lengthdir_x(46, bowAngle-103),
		bowY+lengthdir_y(46, bowAngle-103),
		tx, ty, aalpha)

		draw_rope(tx, ty,
		bowX+lengthdir_x(46, bowAngle+103),
		bowY+lengthdir_y(46, bowAngle+103), aalpha)
	}
	#endregion

	draw_outline(global.weaponSprite, -1, bowX, bowY, image_xscale, image_yscale, bowAngle, aalpha)
	draw_sprite_ext(global.weaponSprite, -1, bowX, bowY, image_xscale, image_yscale, bowAngle, image_blend, aalpha)

	if (shiningPower) {
		shader_set(shBright)
		var sh_alpha = contMain.uni_bright_alpha
		shader_set_uniform_f(sh_alpha, (0.18+contMain.period/(30-shiningPower*10))*aalpha)

		draw_sprite_ext(global.weaponSprite, -1, bowX, bowY, image_xscale, image_yscale, bowAngle, c_white, 0)
		shader_reset()
	}

	dir = point_direction(rh_center_x, rh_center_y, lh_center_x, lh_center_y)
	arrowX = rh_center_x+lengthdir_x(37, dir)
	arrowY = rh_center_y+lengthdir_y(37, dir)

	draw_sprite_ext(arrowSprite, -1, arrowX, arrowY, image_xscale, image_yscale, dir, image_blend, arrowVisibility)

	if (tripleArrow) {
		draw_sprite_ext(sprArrow, -1, arrowX, arrowY, image_xscale, image_yscale, dir+6, image_blend, arrowVisibility)
		draw_sprite_ext(sprArrow, -1, arrowX, arrowY, image_xscale, image_yscale, dir-6, image_blend, arrowVisibility)
	}
}