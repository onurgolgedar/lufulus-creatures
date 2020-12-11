if (maxTime != -1) {
	var decrease = delta()
    if (time-decrease > 0)
        time -= decrease
    else if (!stackable or directDestroy)
        instance_destroy()
    else {
        stack -= 1
		event_perform(ev_other, ev_user0)
        time = maxTime
    }
}

if (stackable and stack == 0)
    instance_destroy()

if (maxTime != -1 or stackable)
    alarm[0] = 1