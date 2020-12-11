event_inherited()

with (efboxPoison) {
	if (owner == other.owner and id != other.id) {
		if (other.damage/other.time > damage/maxTime)
			instance_destroy()
		else
			instance_destroy(other)
	}
}