alarm[11] = 60

//Generated for GMS2 in Geon FX v0.9.0
//Put this code in Create event

//Creating Particle System
ps = part_system_create();
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5);

//Creating Particle Types
//Effect1
pt_Effect1 = part_type_create()
part_type_shape(pt_Effect1, pt_shape_flare);
part_type_sprite(pt_Effect1, spr_pt_shape_flare, 0, 0, 0);
part_type_size(pt_Effect1, 0.30, 0.60, 0, 0);
part_type_scale(pt_Effect1, 1, 1);
part_type_orientation(pt_Effect1, 0, 0, 0, 0, 0);
part_type_color3(pt_Effect1, 4227072, 65280, 16777088);
part_type_alpha3(pt_Effect1, 0.58, 0.42, 0);
part_type_blend(pt_Effect1, 1);
part_type_life(pt_Effect1, 15, 25);
part_type_speed(pt_Effect1, 2, 3, 0, 0);
part_type_direction(pt_Effect1, 90, 90, 0, 0);
part_type_gravity(pt_Effect1, 0, 0);

//Creating Emitters
pe_Effect1 = part_emitter_create(ps);

//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(ps, pe_Effect1, xp-20, xp+20, yp-20, yp+20, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(ps, pe_Effect1, pt_Effect1, 16+global.performanceMode*2);

event_inherited()