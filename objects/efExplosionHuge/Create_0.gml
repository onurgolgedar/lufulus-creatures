ps = part_system_create();
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5);

pt_Soft = part_type_create();
pt_Sharp = part_type_create();

pe_Soft = part_emitter_create(ps);
pe_Sharp = part_emitter_create(ps);

size = 1
permanentFire = false
permanentFireLife = -1
upgrade = 0
alarm[0] = 2
alarm[1] = 1
delta_alarm(11, sec*1.5)
delta_alarm(2, sec/20)

event_inherited()