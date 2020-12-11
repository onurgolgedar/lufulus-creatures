dis = point_distance(x, y, objPlayer.x, objPlayer.y)

if (physics_test_overlap(x, y, phy_rotation, objPlayer)) {
	if (!audio_is_playing(sndCoin))
		sound_play_at(sndCoin, x, y, false)
		
	slide_text(x, y, ceil(value), c_gold)
	change_money(value)
	
	instance_destroy()
}

if (image_alpha < 1) {
	image_alpha += 0.8/5
	image_xscale -= 0.2
	image_yscale -= 0.2
}

delta_alarm(0, 5)