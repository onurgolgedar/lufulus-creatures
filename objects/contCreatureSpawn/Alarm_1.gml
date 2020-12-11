if (ds_list_find_index(global.destroyedMaps, room) != -1) {
	isDestroyedMap = true
	
	with (parCreature) {
		if (mode == md_calm)
			ai_direct_delete()
	}
	
	with (contCreatureSpawn) {
		if (team)
			limit += count*4
	}
}

// Correction
if (team)
	limit = (limit div count)*count

if (team) {
	repeat (2)
		event_perform(ev_alarm, 0)
}
else {
	repeat (5)
		event_perform(ev_alarm, 0)
}