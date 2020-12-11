event_inherited()

blood_effect(c_red, 1)

if (inView and stopTick != -1) {
	if (stopTick == 0) {
		ai_set_lastseen_point(x, y)
		ai_goto_lastseen_point(1)
		stopTick = -1
	}
	else
		stopTick -= 1
}