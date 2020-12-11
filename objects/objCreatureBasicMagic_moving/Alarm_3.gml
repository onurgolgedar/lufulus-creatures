if (target == objPlayer.id and is_in_shieldmode(objPlayer) and physics_test_overlap(x, y, phy_rotation, objShield_sdest)) {
	with (objPlayer) {
		var damage = calculate_damagetaken(other.trueDamage/2, 1)
		var pw = 8*min(damage/maxHp, 1)
			
		attacked(damage, other.owner, false)
		
		var angle = point_direction(other.x, other.y, phy_com_x, phy_com_y)
		physics_apply_impulse(phy_com_x, phy_com_y, lengthdir_x(pw, angle), lengthdir_y(pw, angle))

		with (other) {
			event_user(1)
			exit
		}
	}
}

with (parTarget) {
	if (physics_test_overlap(x, y, phy_rotation, other) and (id == other.target or ai_protectors_exists(other.target))) {
		var damage = calculate_damagetaken(other.trueDamage, 1)
		var pw = 16*min(damage/maxHp, 1)
		
		attacked(damage, other.owner, false)
		
		add_effectbox(efboxStun, -1, sec/4)
		
		var angle = point_direction(other.x, other.y, phy_com_x, phy_com_y)
		physics_apply_impulse(phy_com_x, phy_com_y, lengthdir_x(pw, angle), lengthdir_y(pw, angle))
			
		with (other) {
			event_user(1)
			exit
		}
	}
}

delta_alarm(3, 3)