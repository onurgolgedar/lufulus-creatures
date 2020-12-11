//Creating Particle Types
//Effect1
pt_Effect1 = part_type_create();
part_type_shape(pt_Effect1, pt_shape_smoke);
part_type_sprite(pt_Effect1, spr_pt_shape_smoke, 0, 0, 0);
part_type_size(pt_Effect1, 0.30, 0.60, 0, 0);
part_type_scale(pt_Effect1, 1, 1);
part_type_orientation(pt_Effect1, 0, 0, 0, 0, 0);
part_type_color3(pt_Effect1, efCol1, efCol2, efCol3);
part_type_alpha3(pt_Effect1, 0.77, 0.40, 0);
part_type_blend(pt_Effect1, 0);
part_type_life(pt_Effect1, 15, 20);
part_type_speed(pt_Effect1, 0.50, 1, 0, 0);
part_type_direction(pt_Effect1, 0, 360, 0, 0);
part_type_gravity(pt_Effect1, 0, 0);

//Creating Emitters
pe_Effect1 = part_emitter_create(ps);

//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(ps, pe_Effect1, xp-8, xp+8, yp-8, yp+8, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(ps, pe_Effect1, pt_Effect1, 4-2*(global.performanceMode == 0));