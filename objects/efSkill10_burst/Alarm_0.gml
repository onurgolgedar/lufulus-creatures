
//Creating Particle Types
//Effect1
pt_blood_Effect1 = part_type_create();
part_type_sprite(pt_blood_Effect1, spr_pt_shape_smoke, 0, 0, 0);
part_type_size(pt_blood_Effect1, 2.1, 2.5, -0.03, 0);
part_type_scale(pt_blood_Effect1, 1, 1);
part_type_orientation(pt_blood_Effect1, 0, 360, choose(1, -1), 0, 0);
part_type_color3(pt_blood_Effect1, c_white, c_white, c_white);
part_type_alpha3(pt_blood_Effect1, 0.5, 0.25, 0);
part_type_blend(pt_blood_Effect1, 0);
part_type_life(pt_blood_Effect1, 44, 50);
part_type_speed(pt_blood_Effect1, 0.4, 0.8, 0.02, 0);
part_type_direction(pt_blood_Effect1, 0, 360, 0, 0);
part_type_gravity(pt_blood_Effect1, 0, 0);

//Creating Emitters
pe_Effect1 = part_emitter_create(ps);

//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(ps, pe_Effect1, xp-120, xp+120, yp-120, yp+120, ps_shape_ellipse, ps_distr_linear);

part_emitter_burst(ps, pe_Effect1, pt_blood_Effect1, 14+global.performanceMode*2);