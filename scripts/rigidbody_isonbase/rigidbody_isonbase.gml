function rigidbody_isonbase() {
	return (stance == stBase or
			stance == stBase2 or
			stance == stBase3 or
		
			stance == stBasicAttackBase_bow or
			stance == stBasicAttackBase_crossbow or
			stance == stBasicAttackBase_ohsword or
			stance == stBasicAttackBase_ohsword_calm or
			stance == stBasicAttackBase_shieldOnly or
			stance == stBasicAttackBase_staff)
			and anim_end()


}
