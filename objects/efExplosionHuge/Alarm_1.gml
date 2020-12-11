part_type_shape(pt_Soft, pt_shape_sphere);
part_type_sprite(pt_Soft, spr_pt_shape_fire_soft, 0, 0, 0);
part_type_size(pt_Soft, 4.10+upgrade/10, 4.30+upgrade/10, 0, 0);
part_type_scale(pt_Soft, 1, 1);
part_type_orientation(pt_Soft, 0, 360, 2, 0, 0);
part_type_color3(pt_Soft, 16777215, 16777215, 16777215);
part_type_alpha3(pt_Soft, 0.16, 0.04, 0);
part_type_blend(pt_Soft, 1);
part_type_life(pt_Soft, 17+upgrade, 17+upgrade);
part_type_speed(pt_Soft, 0, 0, 0, 0);
part_type_direction(pt_Soft, 0, 360, 0, 0);
part_type_gravity(pt_Soft, 0, 0);

part_type_shape(pt_Sharp, pt_shape_smoke);
part_type_size(pt_Sharp, 2.30+upgrade/20, 2.35+upgrade/20, -0.04, 0.15);
part_type_scale(pt_Sharp, 1, 1);
part_type_orientation(pt_Sharp, 0, 360, 4, 0, 0);
part_type_color3(pt_Sharp, upgrade > 2 ? c_fuchsia : 255, 33023, 255);
part_type_alpha3(pt_Sharp, 0.70, 0.36, 0);
part_type_blend(pt_Sharp, 1);
part_type_life(pt_Sharp, 18+upgrade, 18+upgrade);
part_type_speed(pt_Sharp, 8.80, 9.10, -0.22, 0);
part_type_direction(pt_Sharp, 0, 360, 14, 0);
part_type_gravity(pt_Sharp, 0, 0);

part_emitter_region(ps, pe_Sharp, -115*size, +115*size, -115*size, +115*size, ps_shape_ellipse, ps_distr_linear);
part_emitter_region(ps, pe_Soft, -80*size, +80*size, -80*size, +80*size, ps_shape_ellipse, ps_distr_gaussian);