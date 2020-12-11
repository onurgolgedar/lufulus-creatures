/// @description Start

with (owner)
	rigidbody_set_definedstance(stPull, sec/2)
	
if (owner.target != pointer_null) {
	pullEffect = instance_create(owner.target.x, owner.target.y, efPull)
	pullEffect.owner = owner
	pullEffect.target = owner.target
	pullEffect.size = 0.13+owner.pullPower/90
	pullEffect.isRed = owner.object_index == objB2
	
	pullEffect2 = instance_create(owner.rightHand.x, owner.rightHand.y, efPull)
	pullEffect2.owner = owner.target
	pullEffect2.target = owner.rightHand
	pullEffect2.size = 0.04+owner.pullPower/180
	pullEffect2.isRed = owner.object_index == objB2
	
	with (pullEffect) {
		/*if (other.owner.pullPower > 30)
			part_type_color3(pt_pullEffect, c_aqua, c_aqua, c_aqua)*/
	}
	
	with (pullEffect2) {
		part_type_life(pt_pullEffect, 5, 8)
		
		/*if (other.owner.pullPower > 30)
			part_type_color3(pt_pullEffect, c_aqua, c_fuchsia, c_aqua)*/
	}
}
	
delta_alarm(0, sec/2+delay+sec)