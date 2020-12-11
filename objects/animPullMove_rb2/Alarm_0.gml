with (owner) {
	rigidbody_set_definedstance(stPull2, sec/10)
	
	pull_change(-100)
}
	
if (owner.target != pointer_null) {
	with (owner.target) {
		if (other.owner.pullPower >= 20)
			add_effectbox(efboxStun, -1, 0.08+other.owner.pullPower/170*sec)
			
		var dir = point_direction(x, y, other.owner.x, other.owner.y)
		var dir_circular = irandom(360)
		physics_apply_impulse(phy_com_x+lengthdir_x(10, dir_circular), phy_com_y+lengthdir_y(10, dir_circular),
		lengthdir_x(other.owner.pullPower, dir), lengthdir_y(other.owner.pullPower, dir))
		
		sound_play_at(sndPulse, x, y, false)
	}
}

destroy_effect(pullEffect, sec/3)
pullEffect = pointer_null

destroy_effect(pullEffect2, sec/3)
pullEffect2 = pointer_null
	
delta_alarm(1, sec/10+delay)