//Generated for GMS2 in Geon FX v0.9.0
//Put this code in Create event

//Creating Particle System
ps = part_system_create();
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5);

//Creating Particle Types
//Effect1
pt = part_type_create();
part_type_sprite(pt, spr_pt_shape_fire_soft, 0, 0, 0);
part_type_size(pt, 0.4, 0.5, -0.02, 0);
part_type_scale(pt, 1, 1);
part_type_orientation(pt, 0, 360, 3, 0, 0);
part_type_color3(pt, c_purple, c_fuchsia, c_lime);
part_type_alpha3(pt, 1, 0.5, 0);
part_type_blend(pt, 0);
part_type_life(pt, 20, 30);
part_type_speed(pt, 0.2, 0.5, 0.03, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_gravity(pt, 0, 0);

//Creating Emitters
pe_Effect1 = part_emitter_create(ps);
	
alarm[0] = 1

event_inherited()