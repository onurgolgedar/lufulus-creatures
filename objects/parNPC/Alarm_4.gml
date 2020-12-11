event_inherited()

if (hasTorch) {
	if (isRanged)
		hasTorch = false
	else if (leftHand != pointer_null) {
		tLight = instance_create_layer(leftHand.x, leftHand.y, "lyAir", objTorchLight)
		tLight.owner = id

		tFire = instance_create(tLight.x, tLight.y, efFireTiny)
		tFire.target = tLight
	}
}