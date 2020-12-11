// ? same for all type poisonlike skills
with (owner) {
	attacked(other.damage/(other.maxTime/(sec/4)), other.creator, 0, 0)
	
	/*var damageEffect = instance_create(x, y, efCDamaged)
	damageEffect.c1 = c_red
	damageEffect.c2 = c_red
	damageEffect.c3 = c_red
	damageEffect.up = false*/

	blood_effect(c_red, (1+sprite_width*sprite_height/2500)/2)
}

delta_alarm(11, sec/4)