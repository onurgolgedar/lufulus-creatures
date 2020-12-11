// ? same for all type poisonlike skills
with (owner) {
	var isPlayer = object_index == objPlayer
	
	if (!isPlayer or !test_effectbox(efboxBroccoli, objPlayer.id)) {
		var damage = other.damage/(other.maxTime/(sec/4))*(1-0.5*extension_exists(ext_poisonresist)*isPlayer+0.3*extension_exists(ext_poisonp30)*!isPlayer)
		attacked(damage, pointer_null, 0, 0)
	
		var damageEffect = instance_create(x, y, efCDamaged)
		damageEffect.c1 = c_green
		damageEffect.c2 = c_lime
		damageEffect.c3 = c_green
	}
}

delta_alarm(11, sec/4)