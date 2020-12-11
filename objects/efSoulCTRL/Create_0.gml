//Generated for GMS2 in Geon FX v0.9.0
//Put this code in Create event

//Creating Particle System
ps = part_system_create();
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5);

alpha = 0.007

//Creating Particle Types
//soulctrl
pt_soulctrl = part_type_create();
part_type_shape(pt_soulctrl, pt_shape_smoke);
part_type_sprite(pt_soulctrl, spr_pt_shape_smoke, 0, 0, 0);
part_type_size(pt_soulctrl, 0, 0.05, 0.03, 0.10);
part_type_scale(pt_soulctrl, 1, 1);
part_type_orientation(pt_soulctrl, 0, 360, 0, 0, 0);
part_type_color3(pt_soulctrl, 16711935, 16776960, 16777215);
part_type_alpha3(pt_soulctrl, 0, 0.24*alpha, 0);
part_type_blend(pt_soulctrl, 1);
part_type_life(pt_soulctrl, 5, 50);
part_type_speed(pt_soulctrl, 0, 0.05, 0.02, 1.50);
part_type_direction(pt_soulctrl, 0, 360, 0, 0);
part_type_gravity(pt_soulctrl, 0, 0);

//Creating Emitters
pe_soulctrl = part_emitter_create(ps);

//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
part_emitter_region(ps, pe_soulctrl, -90, 90, -90, 90, ps_shape_ellipse, ps_distr_invgaussian);
part_emitter_stream(ps, pe_soulctrl, pt_soulctrl, 15);

event_inherited()