var cam = global.camera

part_emitter_stream(ps, pe_Effect1, pt_Effect1,
ceil(count/(room_width*room_height)
*camera_get_view_width(cam)*camera_get_view_height(cam)))

part_emitter_region(ps, pe_Effect1,
camera_get_view_x(cam)-150, camera_get_view_x(cam)+camera_get_view_width(cam)+150,
camera_get_view_y(cam)-150, camera_get_view_y(cam)+camera_get_view_height(cam)+150,
ps_shape_rectangle, ps_distr_linear)

alarm[1] = sec/1.5