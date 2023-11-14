event_inherited()

with (efboxInvisibility)
	if (owner == objPlayer.id and id != other.id)
		exit

owner.invisibility = false