var cam = global.camera

//Generated for GMS2 in Geon FX v0.9.0
//Put this code in Create event

//Creating Particle System
ps = part_system_create();
part_system_position(ps, 0, 0)
part_system_depth(ps, layer_get_depth("lyAir")-10);

//Creating Particle Types
//Effect1
pt_Effect1 = part_type_create();
part_type_shape(pt_Effect1, pt_shape_pixel);
part_type_sprite(pt_Effect1, spr_pt_shape_pixel, 0, 0, 0);
part_type_size(pt_Effect1, 3.8, 8, -0.025, 0);
part_type_scale(pt_Effect1, 1, 1);
part_type_orientation(pt_Effect1, 0, 0, 0, 0, 0);
part_type_color3(pt_Effect1, 16777215, 16777215, 16777215);
part_type_alpha3(pt_Effect1, 0, 1, 0);
part_type_blend(pt_Effect1, 1);
part_type_life(pt_Effect1, 68, 115);
part_type_speed(pt_Effect1, 0.018, 0.1, 0.03, 0);
part_type_direction(pt_Effect1, 0, 360, 0, 0);
part_type_gravity(pt_Effect1, 0, 0);

//Creating Emitters
pe_Effect1 = part_emitter_create(ps);
part_emitter_region(ps, pe_Effect1,
camera_get_view_x(cam)-150, camera_get_view_x(cam)+camera_get_view_width(cam)+150,
camera_get_view_y(cam)-150, camera_get_view_y(cam)+camera_get_view_height(cam)+150,
ps_shape_rectangle, ps_distr_linear)

count = 10

alarm[0] = 1
alarm[1] = sec/1.5

event_inherited()