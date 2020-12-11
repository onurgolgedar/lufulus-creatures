if (inView and point_distance(x, y, objPlayer.x, objPlayer.y) < 120) {
	with (objPlayer)
		add_effectbox(efboxBurn)
}

delta_alarm(0, 6)