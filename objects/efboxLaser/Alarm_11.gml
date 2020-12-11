// ? same for all type poisonlike skills
with (target) {
	var damage = calculate_damagetaken(other.damage/(other.maxTime/(sec/4)), true)
	attacked(damage, other.owner, 0, 0)
	
	var damageEffect = instance_create(x, y, efCDamaged)
	damageEffect.c1 = c_dkgray
	damageEffect.c2 = c_gray
	damageEffect.c3 = c_black
}

if (drawer != pointer_null) {
	with (drawer)
		image_yscale += 0.55
}

delta_alarm(11, sec/4)