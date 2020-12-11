//Generated for GMS2 in Geon FX v1.2.4
//Put this code in Create event

//Fire Big Particle System
ps = part_system_create();
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5);

//Fire Big Particle Types
//Sharp
pt_Sharp = part_type_create();
part_type_shape(pt_Sharp, pt_shape_smoke);
part_type_size(pt_Sharp, 0.72, 0.78, 0.01, 0);
part_type_scale(pt_Sharp, 1, 1);
part_type_orientation(pt_Sharp, 0, 360, 1.50, 0, 0);
part_type_color3(pt_Sharp, 255, 65535, 255);
part_type_alpha3(pt_Sharp, 0.09, 0.18, 0);
part_type_blend(pt_Sharp, 1);
part_type_life(pt_Sharp, 17, 18);
part_type_speed(pt_Sharp, 0.06, 0.07, 0.02, 0);
part_type_direction(pt_Sharp, 0, 360, 0, 0);
part_type_gravity(pt_Sharp, 0, 0);

//Soft
pt_Soft = part_type_create();
part_type_shape(pt_Soft, pt_shape_star);
part_type_sprite(pt_Soft, spr_pt_shape_fire_soft, 0, 0, 0);
part_type_size(pt_Soft, 0.70, 0.90, 0.03, 0);
part_type_scale(pt_Soft, 1, 1);
part_type_orientation(pt_Soft, 0, 360, 2, 0, 0);
part_type_color3(pt_Soft, 65535, 46079, 255);
part_type_alpha3(pt_Soft, 0, 0.34, 0.10);
part_type_blend(pt_Soft, 0);
part_type_life(pt_Soft, 17, 18);
part_type_speed(pt_Soft, 0, 0.30, 0.05, 0);
part_type_direction(pt_Soft, 0, 360, 5, 0);
part_type_gravity(pt_Soft, 0, 0);

//Fire Big Emitters
pe_Sharp = part_emitter_create(ps);
pe_Soft = part_emitter_create(ps);

//Fire Big emitter positions. Streaming or Bursting Particles.
part_emitter_region(ps, pe_Soft, -55, 55, -55, 55, ps_shape_ellipse, ps_distr_linear);
part_emitter_region(ps, pe_Sharp, -55, 55, -55, 55, ps_shape_ellipse, ps_distr_linear);

alarm[0] = 1

event_inherited()