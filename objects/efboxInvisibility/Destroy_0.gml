event_inherited()

with (efboxinvisibility)
	if (owner == objPlayer.id and id != other.id)
		exit

owner.invisibility = false