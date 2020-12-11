/// @description Animation's Return

with (owner) {
	var time = (sec/attackSpeed
				-(sec/25+other.delay)
				-(sec/30+other.delay)
				)
	
	rigidbody_set_definedstance_type1((test_effectbox(efboxSkill2) and has_shield()) ? stShieldMode : stBasicAttackBase_ohsword,
	time
	/(1+0)) //(attackSpeed < 2.1)))
}