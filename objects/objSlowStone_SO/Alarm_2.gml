if (target == objPlayer.id and
is_in_shieldmode(objPlayer)) {
	if (physics_test_overlap(x, y, phy_rotation, objShield_sdest)) {	
		with (objPlayer) {
			var damage = calculate_damagetaken(other.trueDamage/2, 0)
			attacked(damage, other.owner, false)
			add_effectbox(efboxSlow, 2)
		}
	
		event_perform(ev_other, ev_user0)
		instance_destroy()
		exit
	}
}

if (physics_test_overlap(x, y, phy_rotation, target)) {
	with (target) {
		var damage = calculate_damagetaken(other.trueDamage, 0)
		attacked(damage, other.owner, false)
		add_effectbox(efboxSlow, 2)
	}
	
	event_perform(ev_other, ev_user0)
	instance_destroy()
}

alarm[2] = 2