event_inherited()

with (objBowControl)
	if (owner == other.owner) {
		massiveArrow = false
		arrowEffect = pointer_null
	}
		
with (objCrossbowControl)
	if (owner == other.owner) {
		massiveArrow = false
	}
	
if (effect != pointer_null and instance_exists(effect))
	instance_destroy(effect)