isRed = false

//Generated for GMS2 in Geon FX v0.9.0
//Put this code in Create event

//Creating Particle System
ps = part_system_create();
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5);
size = 0.045

//Creating Particle Types
//Effect
pt_pullEffect = part_type_create();
part_type_shape(pt_pullEffect, pt_shape_ring);
part_type_sprite(pt_pullEffect, spr_pt_shape_explosion, 0, 0, 0);
part_type_size(pt_pullEffect, size, size+0.06, -0.068, 0);
part_type_scale(pt_pullEffect, 1.50, 1.20);
part_type_orientation(pt_pullEffect, 0, 360, 0, 0, 0);
part_type_color3(pt_pullEffect, 16744576, 16776960, 16776960);
part_type_alpha3(pt_pullEffect, 0.3, 0.18, 0);
part_type_blend(pt_pullEffect, 0);
part_type_life(pt_pullEffect, 12, 16);
part_type_speed(pt_pullEffect, 0, 0, 0, 0);
part_type_direction(pt_pullEffect, 0, 360, 0, 0);

//Creating Emitters
pe_pullEffect = part_emitter_create(ps);

//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(ps, pe_pullEffect, 0, 0, 0, 0, ps_shape_rectangle, ps_distr_linear);

event_inherited()

alarm[0] = 1