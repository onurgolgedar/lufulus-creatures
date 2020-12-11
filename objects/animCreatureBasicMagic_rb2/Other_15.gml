/// @description Animation's Return

with (owner) {	
	var time = (sec/attackSpeed
			-(sec/15+other.delay)
			-(sec/15+other.delay)
			)
	
	rigidbody_set_baBase(time)
}