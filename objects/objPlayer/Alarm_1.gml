/// @description Alpha Up

var ds_size = ds_list_size(rigidbodyParts)
for (var rb = 0; rb < ds_size; rb++) {
	with (ds_list_find_value(rigidbodyParts, rb)) {
		if (id != other.shoulders) {
			if (image_alpha < 1)
				image_alpha += 0.25
		}
	}
}
				
if (weaponAlpha < 1) {
	weaponAlpha += 0.25
	alarm[1] = 1
}

if (stance == stBasicAttackBase_ohsword_calm)
	sWeaponAlpha_calm = 1
        
if (leftArm[0].image_alpha == 1) {
	if (noArms) {
	    noArms = false
		update_movementspeed()
		with (contPlayer)
			event_user(4)
	}
}
else
    alarm[1] = 1