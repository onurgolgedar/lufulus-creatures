// Extra awards

if (!isFailure) {
	fm_activate(7)
	fm_add(2, true)

	with (objScoutRoad_npc) {
		ai_set_lastseen_point(x, y)
		ai_goto_lastseen_point()
	}
}

event_inherited()