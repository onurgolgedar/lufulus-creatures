/// @description Animation's Return

with (owner) {
	var time = (sec/attackSpeed
				-(sec/8+other.delay)
				)
	
	rigidbody_set_definedstance_type1(stBasicAttackBase_crossbow, time)
}