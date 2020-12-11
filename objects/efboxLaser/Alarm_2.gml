ef_broccoli = contPlayer.broccoliMode

slowNeeded = true
with (objLaserConnection) {
	if (target == other.target)
		other.slowNeeded = false
}

if (slowNeeded and !ef_broccoli)
	target.slowFactor *= 1.75
	
if (target.object_index == objPlayer and extension_exists(ext_tenacity))
	time = round(time/2)

drawer = instance_create_layer(owner.x, owner.y, "lyBelowPlayer", objLaserConnection)
drawer.target = target
drawer.owner = owner
drawer.depth += 10
drawer.ownerEfbox = id