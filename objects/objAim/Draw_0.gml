if (global.mouseControl and !IS_MOBILE)
	image_angle = point_direction(objPlayer.x, objPlayer.y, mouse_x, mouse_y)
else
	image_angle = -objPlayer.phy_rotation

if (global.secondaryActive or (global.weaponType != wtype_crossbow and global.weaponType != wtype_bow)) {
	x = objPlayer.x+lengthdir_x(objPlayer.range, image_angle)
	y = objPlayer.y+lengthdir_y(objPlayer.range, image_angle)
}
else {
	image_blend = c_white
	
	if (global.gamepad_active or IS_MOBILE) {
		x = objPlayer.x+lengthdir_x(display_get_height()/2, image_angle)
		y = objPlayer.y+lengthdir_y(display_get_height()/2, image_angle)
	}
	else {
		x = mouse_x
		y = mouse_y
	}
}
	
if (global.showGUI) {
	if (objPlayer.stance != stBasicAttackBase_ohsword_calm and
	objPlayer.stance != stBasicAttackBase_shieldOnly and !objPlayer.death and !objPlayer.noArms) {
		var focus = sprite_index == sprAim_archery and (global.gamepad_active or IS_MOBILE or mouse_check_button(mb_right)) and (contPlayer.doingAttack or IS_MOBILE and contGUI.joystick2_hold)
		var remainingRatio = (1-objPlayer.attackTimer/(sec/global.attackSpeed)*0.4)
	
		if (image_index == 2 and global.weaponType != wtype_bow)
			draw_sprite_ext(sprAim, image_index,
			objPlayer.x+lengthdir_x(objPlayer.range*remainingRatio, image_angle),
			objPlayer.y+lengthdir_y(objPlayer.range*remainingRatio, image_angle),
			remainingRatio*image_xscale*0.8, remainingRatio*image_yscale*0.8,
			image_angle, image_blend, image_alpha/3)
		
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*0.8+focus*0.3, image_yscale*0.8+focus*0.3, image_angle, image_blend, image_alpha)

		if (focus) {
			draw_set_alpha(0.07+(objPlayer.attackTimer == 0)*0.2+IS_MOBILE*0.015) draw_set_color(c_white)
				draw_line_width(x, y, objPlayer.x, objPlayer.y, 3)

				if (test_effectbox(efboxSkill8, objPlayer.id)) {
					var dis = point_distance(x, y, objPlayer.x, objPlayer.y)+8
					var len = dsin(4)*dis
					var len2 = dsin(8)*dis
				
					draw_line_width(x+lengthdir_x(len, image_angle+90), y+lengthdir_y(len, image_angle+90), objPlayer.x, objPlayer.y, 2)
					draw_line_width(x+lengthdir_x(len, image_angle-90), y+lengthdir_y(len, image_angle-90), objPlayer.x, objPlayer.y, 2)
					draw_line_width(x+lengthdir_x(len2, image_angle+90), y+lengthdir_y(len2, image_angle+90), objPlayer.x, objPlayer.y, 2)
					draw_line_width(x+lengthdir_x(len2, image_angle-90), y+lengthdir_y(len2, image_angle-90), objPlayer.x, objPlayer.y, 2)
				}
			draw_set_alpha(1) draw_set_color(c_black)
		}
	}
}