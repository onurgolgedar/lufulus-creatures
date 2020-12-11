event_inherited()

with (efboxFire) {
	if (owner == other.owner and id != other.id) {
		if (other.damage/other.time > damage/maxTime)
			instance_destroy()
		else
			instance_destroy(other)
	}
}

fireEffect = instance_create(x, y, efFireSmall)
fireEffect.target = owner