if (inView) {
	if (objPlayer.hp != objPlayer.maxHp*(1-instance_exists(efboxDeath)*0.25) and usable) {
		if (physics_test_overlap(x, y, phy_rotation, objPlayer)) {
			with (objPlayer)
				change_hp(other.value)
		
		    audio_play_sound(sndHeal, 1, 0)
	
		    instance_destroy()
		}
	
		isNeeded = true
	}
	else
		isNeeded = false
}

delta_alarm(4, sec/6)