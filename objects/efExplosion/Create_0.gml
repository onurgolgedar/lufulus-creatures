//Generated for GMS2 in Geon FX v1.2.4
//Put this code in Create event

//Explosion Particle System
ps = part_system_create();
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5);

//Explosion Particle Types
//Soft
pt_Soft = part_type_create();
part_type_shape(pt_Soft, pt_shape_sphere);
//spr_Fire Particle (Soft) = sprite_add("Fire Particle (Soft).png", 1, 0, 0, 29, 17);
part_type_sprite(pt_Soft, spr_pt_shape_fire_soft, 0, 0, 0);
part_type_size(pt_Soft, 2, 2, 0, 0);
part_type_scale(pt_Soft, 1, 1);
part_type_orientation(pt_Soft, 0, 360, 2, 0, 0);
part_type_color3(pt_Soft, 16777215, 16777215, 16777215);
part_type_alpha3(pt_Soft, 0.58, 0.12, 0);
part_type_blend(pt_Soft, 1);
part_type_life(pt_Soft, 16, 16);
part_type_speed(pt_Soft, 0, 0, 0, 0);
part_type_direction(pt_Soft, 0, 360, 0, 0);
part_type_gravity(pt_Soft, 0, 0);

//Sharp
pt_Sharp = part_type_create();
part_type_shape(pt_Sharp, pt_shape_smoke);
part_type_size(pt_Sharp, 1.50, 1.54, -0.01, 0);
part_type_scale(pt_Sharp, 1, 1);
part_type_orientation(pt_Sharp, 0, 360, 4.50, 2, 0);
part_type_color3(pt_Sharp, 255, 33023, 255);
part_type_alpha3(pt_Sharp, 0.60, 0.40, 0);
part_type_blend(pt_Sharp, 1);
part_type_life(pt_Sharp, 15, 15);
part_type_speed(pt_Sharp, 8.10, 8.20, -1.25, 0);
part_type_direction(pt_Sharp, 0, 360, 5, 0);
part_type_gravity(pt_Sharp, 0, 0);

//Explosion Emitters
pe_Soft = part_emitter_create(ps);
pe_Sharp = part_emitter_create(ps);

//Explosion emitter positions. Streaming or Bursting Particles.
part_emitter_region(ps, pe_Sharp, -85, 85, -85, 85, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_region(ps, pe_Soft, -40, 40, -40, 40, ps_shape_ellipse, ps_distr_gaussian);

sound_play_at(sndFlameBurst, x, y, false)
	
alarm[0] = 1
alarm[11] = 80

event_inherited()