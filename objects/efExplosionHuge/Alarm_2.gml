if (permanentFire) {
	var _permanentFire = instance_create(x, y, efFireHuge)
	with (_permanentFire) {
		size = other.size
		delta_alarm(9, other.permanentFireLife)
	}
}