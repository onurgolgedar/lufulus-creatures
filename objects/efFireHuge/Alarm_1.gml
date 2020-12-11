part_type_shape(pt_Sharp, pt_shape_smoke);
part_type_size(pt_Sharp, 0.65, 0.74, 0.02, 0);
part_type_scale(pt_Sharp, 1, 1);
part_type_orientation(pt_Sharp, 0, 360, 1.50, 0, 0);
part_type_color3(pt_Sharp, 255, 65535, 255);
part_type_alpha3(pt_Sharp, 0.14, 0.20, 0);
part_type_blend(pt_Sharp, 1);
part_type_life(pt_Sharp, 27, 30);
part_type_speed(pt_Sharp, 0, 0, 0.12, 0);
part_type_direction(pt_Sharp, 0, 360, 3, 0);
part_type_gravity(pt_Sharp, 0, 0);

part_type_shape(pt_Soft, pt_shape_star);
part_type_sprite(pt_Soft, spr_pt_shape_fire_soft, 0, 0, 0);
part_type_size(pt_Soft, 0.65, 0.70, 0.05, 0);
part_type_scale(pt_Soft, 1, 1);
part_type_orientation(pt_Soft, 0, 360, 2, 0, 0);
part_type_color3(pt_Soft, 65535, 46079, 255);
part_type_alpha3(pt_Soft, 0, 0.36, 0.10);
part_type_blend(pt_Soft, 0);
part_type_life(pt_Soft, 27, 30);
part_type_speed(pt_Soft, 0.12, 0.25, 0.08, 0);
part_type_direction(pt_Soft, 0, 360, 3, 0);
part_type_gravity(pt_Soft, 0, 0);

part_emitter_region(ps, pe_Soft, -120*size, 120*size, -120*size, 120*size, ps_shape_ellipse, ps_distr_linear);
part_emitter_region(ps, pe_Sharp, -120*size, 120*size, -120*size, 120*size, ps_shape_ellipse, ps_distr_linear);