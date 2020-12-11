isRed = false
isBig = false
isPurple = false

//Generated for GMS2 in Geon FX v0.9.0
//Put this code in Create event

//Creating Particle System
ps = part_system_create();
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5);

//Creating Particle Types
//Effect1
pt = part_type_create();
part_type_shape(pt, pt_shape_disk);
part_type_size(pt, 1, 1.4, -0.05, 0.03);
part_type_scale(pt, 1, 1);
part_type_orientation(pt, 0, 360, 3, 0, 0);
part_type_color3(pt, c_black, c_aqua, c_black);
part_type_alpha3(pt, 1, 0.5, 0)
part_type_blend(pt, 0);
part_type_life(pt, 28, 35);
part_type_speed(pt, 1, 2, 0, 2);
part_type_direction(pt, 0, 360, 0, 0);
part_type_gravity(pt, 0, 0);

//Creating Emitters
pe_Effect1 = part_emitter_create(ps);
	
alarm[0] = 1
alarm[11] = 80

event_inherited()