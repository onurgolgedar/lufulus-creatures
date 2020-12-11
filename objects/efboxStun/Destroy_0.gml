event_inherited()
owner.stunned = false

with (efboxFreeze)
	if (owner == other.owner and time > 10)
		time = 10