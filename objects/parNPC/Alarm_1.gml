event_inherited()

var ds_size = ds_list_size(rigidbodyParts)
for (var rb = 0; rb < ds_size; rb++)
	with (ds_list_find_value(rigidbodyParts, rb))
		if (id != other.shoulders)
			if (image_alpha < 1)
				image_alpha += 0.25
        
if (leftArm[0].image_alpha == 1)
    noArms = false
else
    alarm[1] = 1