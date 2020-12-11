/// @description Animation's Return

with (owner) {
	rigidbody_set_baBase()
}

if (owner.target != pointer_null) {
	with (owner.target) {
		if (object_index == objPlayer)
			viewLock = false
	}
}