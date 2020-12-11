if (target == objPlayer.id and is_in_shieldmode(objPlayer) and physics_test_overlap(x, y, phy_rotation, objShield_sdest)) {
	with (objPlayer) {
		var damage = calculate_damagetaken(other.trueDamage/2, 1)
		var pw = 4*min(damage/maxHp, 1)
			
		attacked(damage, other.owner, false)
		
		var angle = point_direction(other.x, other.y, phy_com_x, phy_com_y)
		physics_apply_impulse(phy_com_x, phy_com_y, lengthdir_x(pw, angle), lengthdir_y(pw, angle))

		with (other) {
			event_user(0)
			exit
		}
	}
}

with (parTarget) {
	if (physics_test_overlap(x, y, phy_rotation, other) and (id == other.target or ai_protectors_exists(other.target))) {
		var damage = calculate_damagetaken(other.trueDamage, 1)
		var pw = 8*min(damage/maxHp, 1)
		
			
		var dodge = type == type_player and extension_exists(ext_classics)*chance(8*global.classicItem_count, 100)
			
		#region Post Damage Reduction
		if (dodge)
			damage = 0
		#endregion
		
		attacked(damage, other.owner, false)
		
		var angle = point_direction(other.x, other.y, phy_com_x, phy_com_y)
		physics_apply_impulse(phy_com_x, phy_com_y, lengthdir_x(pw, angle), lengthdir_y(pw, angle))
			
		with (other) {
			event_user(0)
			exit
		}
	}
}

delta_alarm(3, 3)