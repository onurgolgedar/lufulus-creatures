/// @description Animation's Return

with (owner) {
	var time = (sec/attackSpeed
			-(sec/20+other.delay)
			-(sec/20+other.delay)
			)
	
	rigidbody_set_baBase(time)
}