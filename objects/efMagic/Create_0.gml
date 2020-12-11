//Generated for GMS2 in Geon FX v0.9.0
//Put this code in Create event

//Creating Particle System
ps = part_system_create();
part_system_position(ps, x, y)
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5);

//Creating Particle Types
//Effect1
pt_Effect1 = part_type_create();
part_type_shape(pt_Effect1, pt_shape_flare);
part_type_sprite(pt_Effect1, spr_pt_shape_flare, 0, 0, 0);
part_type_scale(pt_Effect1, 1, 1);
part_type_orientation(pt_Effect1, 0, 0, 0, 0, 0);
part_type_alpha3(pt_Effect1, 1, 0.61, 0);
part_type_blend(pt_Effect1, 1);
part_type_life(pt_Effect1, 8, 20);
part_type_speed(pt_Effect1, 0.50, 1.50, 0, 0);
part_type_direction(pt_Effect1, 0, 360, 0, 0);
part_type_gravity(pt_Effect1, 0, 1);

//Creating Emitters
pe_Effect1 = part_emitter_create(ps);

//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(ps, pe_Effect1, 
	-8, +8,
	-8, +8,
	ps_shape_rectangle, ps_distr_linear);
	
event_inherited()
	
alarm[0] = 1