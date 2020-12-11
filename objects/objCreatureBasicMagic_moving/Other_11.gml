event_user(0)

isDestroyed = true
alarm[2] = -1
alarm[3] = -1
alarm[4] = -1

part_emitter_stream(ps, pe_magicEffect1, pt_shape_disk, 0);

if (light != pointer_null) {
	instance_destroy(light)
	light = pointer_null
}
	
delta_alarm(5, sec)