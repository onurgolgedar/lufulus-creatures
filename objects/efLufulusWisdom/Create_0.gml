//Generated for GMS2 in Geon FX v1.2.4
//Put this code in Create event

//NewEffect Particle System
ps = part_system_create();
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5);

//NewEffect Particle Types
//Effect1
pt_Effect1 = part_type_create();
part_type_sprite(pt_Effect1, spr_pt_shape_explosion, 0, 0, 0);
part_type_size(pt_Effect1, 1, 1.05, 0.015, 0);
part_type_scale(pt_Effect1, 1, 1);
part_type_orientation(pt_Effect1, 0, 360, 0, 0, 0);
part_type_color3(pt_Effect1, c_purple, c_aqua, c_broccoli);
part_type_alpha3(pt_Effect1, 0.1, 0.20, 0);
part_type_blend(pt_Effect1, 1);
part_type_life(pt_Effect1, 12, 20);
part_type_speed(pt_Effect1, 0, 0, 0, 0);
part_type_direction(pt_Effect1, 0, 360, 0, 0);
part_type_gravity(pt_Effect1, 0, 0);

//Effect2
pt_Effect2 = part_type_create();
part_type_sprite(pt_Effect2, spr_pt_shape_flare, 0, 0, 0);
part_type_size(pt_Effect2, 0.1, 0.2, 0.015, 0);
part_type_scale(pt_Effect2, 1, 1);
part_type_orientation(pt_Effect2, 0, 360, 0, 0, 0);
part_type_color3(pt_Effect2, 65280, 8388863, 16711935);
part_type_alpha3(pt_Effect2, 0.2, 0.6, 0);
part_type_blend(pt_Effect2, 1);
part_type_life(pt_Effect2, 22, 28);
part_type_speed(pt_Effect2, 0, 0, 0, 0);
part_type_direction(pt_Effect2, 0, 360, 0, 0);
part_type_gravity(pt_Effect2, 0, 90);

//Effect3
pt_Effect3 = part_type_create();
part_type_shape(pt_Effect3, pt_shape_circle);
part_type_size(pt_Effect3, 1.30, 1.50, 0, 0);
part_type_scale(pt_Effect3, 1, 1);
part_type_orientation(pt_Effect3, 0, 360, 0, 0, 0);
part_type_color3(pt_Effect3, 16776960, 4259584, 65280);
part_type_alpha3(pt_Effect3, 0, 0.22, 0);
part_type_blend(pt_Effect3, 1);
part_type_life(pt_Effect3, 7, 14);
part_type_speed(pt_Effect3, 0, 1, 0, 0);
part_type_direction(pt_Effect3, 0, 360, 0, 0);
part_type_gravity(pt_Effect3, 0, 0);

//Effect4
pt_Effect4 = part_type_create();
part_type_shape(pt_Effect4, pt_shape_circle);
part_type_size(pt_Effect4, 2.30, 2.50, 0, 0);
part_type_scale(pt_Effect4, 1, 1);
part_type_orientation(pt_Effect4, 0, 360, 0, 0, 0);
part_type_color3(pt_Effect4, c_purple, 4259584, c_purple);
part_type_alpha3(pt_Effect4, 0, 0.22, 0);
part_type_blend(pt_Effect4, 1);
part_type_life(pt_Effect4, 7, 14);
part_type_speed(pt_Effect4, 0, 1, 0, 0);
part_type_direction(pt_Effect4, 0, 360, 0, 0);
part_type_gravity(pt_Effect4, 0, 0);

//NewEffect Emitters
pe_Effect1 = part_emitter_create(ps);
pe_Effect2 = part_emitter_create(ps);
pe_Effect3 = part_emitter_create(ps);
pe_Effect4 = part_emitter_create(ps);

//NewEffect emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_stream(ps, pe_Effect2, pt_Effect2, 1);
part_emitter_region(ps, pe_Effect2, xp-40, xp+40, yp-40, yp+40, ps_shape_ellipse, ps_distr_invgaussian);
part_emitter_stream(ps, pe_Effect1, pt_Effect1, 1);
part_emitter_region(ps, pe_Effect1, xp, xp, yp, yp, ps_shape_ellipse, ps_distr_linear);
/*part_emitter_stream(ps, pe_Effect3, pt_Effect3, 1);
part_emitter_region(ps, pe_Effect3, xp, xp, yp, yp, ps_shape_rectangle, ps_distr_linear);*/
part_emitter_stream(ps, pe_Effect4, pt_Effect4, 1);
part_emitter_region(ps, pe_Effect4, xp, xp, yp, yp, ps_shape_rectangle, ps_distr_linear);

event_inherited()