//Generated for GMS2 in Geon FX v1.2.4

//Ice Burst Single Particle Types
//Effect1
pt_Effect1 = part_type_create();
part_type_shape(pt_Effect1, pt_shape_smoke);
part_type_size(pt_Effect1, 1.25*sizeFactor, 1.5*sizeFactor, -0.035, 0);
part_type_scale(pt_Effect1, 1, 1);
part_type_orientation(pt_Effect1, 0, 360, 7, 0, 0);
part_type_color3(pt_Effect1, 16777058, 16777215, 16777215);
part_type_alpha3(pt_Effect1, 1, 0.40, 0);
part_type_blend(pt_Effect1, 1);
part_type_life(pt_Effect1, 13, 16);
part_type_speed(pt_Effect1, 0, 0, 0.70, 0);
part_type_direction(pt_Effect1, 0, 360, 15, 0);
part_type_gravity(pt_Effect1, 0, 0);

//Ice Burst Single Emitters
pe_Effect1 = part_emitter_create(ps);

//Ice Burst Single emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_burst(ps, pe_Effect1, pt_Effect1, 4);
part_emitter_region(ps, pe_Effect1, xp-10, xp+10, yp-10, yp+10, ps_shape_ellipse, ps_distr_gaussian);