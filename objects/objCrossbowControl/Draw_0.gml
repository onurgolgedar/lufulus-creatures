if (owner.noArms or !owner.inView)
	exit

if (instance_exists(owner) and !owner.death) {
	var aalpha = owner.weaponAlpha*image_alpha/(1+2*owner.invisibility)
	
	var blowbackDistance = 5-springTension/maxSpringTension*5

	var bowX = owner.x+lengthdir_x(40-blowbackDistance, owner.image_angle)
	var bowY = owner.y+lengthdir_y(40-blowbackDistance, owner.image_angle)

	draw_outline(weaponSprite, -1, bowX, bowY, image_xscale, image_yscale, owner.image_angle, aalpha)

	draw_sprite_ext(weaponSprite, -1, bowX, bowY, image_xscale, image_yscale, owner.image_angle, image_blend, aalpha)
	
	if (shiningPower) {
		shader_set(shBright)
		var sh_alpha = contMain.uni_bright_alpha
		shader_set_uniform_f(sh_alpha, (0.18+contMain.period/(30-shiningPower*10))*aalpha)

		draw_sprite_ext(weaponSprite, -1, bowX, bowY, image_xscale, image_yscale, owner.image_angle, c_white, 0)
		shader_reset()
	}

	#region Draw Rope
	var dis = lengthdir_x(75+addRopeDis, 35)
	
	var lx1 = lengthdir_x(blowbackDistance, owner.image_angle)
	var ly1 = lengthdir_y(blowbackDistance, owner.image_angle)
	
	var lx2 = lengthdir_x(dis-springTension, owner.image_angle)
	var ly2 = lengthdir_y(dis-springTension, owner.image_angle)
	
	var tx = owner.x+lx2-lx1
	var ty = owner.y+ly2-ly1
	
	var xxx = 75+addRopeDis
	var yyy = 35+owner.image_angle
	draw_rope(owner.x+lengthdir_x(xxx, yyy)-lx1,
	owner.y+lengthdir_y(xxx, yyy)-ly1,
	tx, ty, aalpha)

	draw_rope(tx, ty, 
	owner.x+lengthdir_x(xxx, yyy-70)-lx1, 
	owner.y+lengthdir_y(xxx, yyy-70)-ly1, aalpha)
	#endregion

	arrowX = owner.x+lengthdir_x(100+addRopeDis-springTension-blowbackDistance, owner.image_angle)
	arrowY = owner.y+lengthdir_y(100+addRopeDis-springTension-blowbackDistance, owner.image_angle)
	
	if (springTension > 20) {
		var c_alpha = aalpha/15*(springTension-20)
	    draw_sprite_ext(arrowSprite, -1, arrowX, arrowY, image_xscale, image_yscale, owner.image_angle, image_blend, c_alpha)
		
		if (tripleArrow) {
			draw_sprite_ext(sprArrow, -1, arrowX, arrowY, image_xscale, image_yscale, owner.image_angle+6, image_blend, c_alpha)
			draw_sprite_ext(sprArrow, -1, arrowX, arrowY, image_xscale, image_yscale, owner.image_angle-6, image_blend, c_alpha)
		}
	}
}