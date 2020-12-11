if (is_castle(room) and is_outfight())
	delta_alarm(8, sec/13)
else
	event_perform(ev_alarm, 8)