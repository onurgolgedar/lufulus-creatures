delta_alarm(0, sec/6*5)
alarm_max[0] = alarm[0]

alarm[1] = 1
delta_alarm(2, 9)
delta_alarm(3, 3)
alarm[4] = 1

phy_rotation = -point_direction(0, 0, phy_speed_x, phy_speed_y)
image_alpha = 0

efCol1 = c_white
efCol2 = c_white
efCol3 = c_white

ps = part_system_create();
part_system_depth(ps, layer_get_depth("lyAir")-5);

pt_magic_Effect1 = part_type_create();
part_type_shape(pt_magic_Effect1, pt_shape_explosion);
part_type_size(pt_magic_Effect1, 0, 0, 0, 0);
part_type_scale(pt_magic_Effect1, 1, 1);
part_type_orientation(pt_magic_Effect1, 0, 360, 0, 0, 0);
part_type_alpha3(pt_magic_Effect1, 0, 0, 0);
part_type_blend(pt_magic_Effect1, 1);
part_type_life(pt_magic_Effect1, 8, 18);
part_type_speed(pt_magic_Effect1, 0, 0, 0, 0);
part_type_direction(pt_magic_Effect1, 0, 360, 0, 0);
part_type_gravity(pt_magic_Effect1, 0, 0);

pe_magicEffect1 = part_emitter_create(ps);
part_emitter_region(ps, pe_magicEffect1, -8, 8, -8, 8, pt_shape_circle, ps_distr_gaussian);
part_emitter_stream(ps, pe_magicEffect1, pt_magic_Effect1, 2);