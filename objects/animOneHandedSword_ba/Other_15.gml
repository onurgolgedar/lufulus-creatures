/// @description Animation's Return

with (owner) {
	var time =	(sec/attackSpeed
				-(sec/24+other.delay)
				-(sec/20+other.delay*2)
				)
	
	rigidbody_set_definedstance_type1(
	(test_effectbox(efboxSkill2) and has_shield()) ? stShieldMode : stBasicAttackBase_ohsword,
	time
	/(1+0))//(attackSpeed < 2.1))) // not important
}