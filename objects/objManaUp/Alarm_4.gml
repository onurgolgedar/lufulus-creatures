if (inView) {
	if (objPlayer.mana != objPlayer.maxMana and usable) {
		if (physics_test_overlap(x, y, phy_rotation, objPlayer)) {
			with (objPlayer)
				change_mana(other.value)
		
		    audio_play_sound(sndHeal, 1, 0)
	
		    instance_destroy()
		}
	
		isNeeded = true
	}
	else
		isNeeded = false
}
	
delta_alarm(4, sec/6)