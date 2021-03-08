var isRoomOut = contMain.isRoomOut

var graphicsQuality = get_graphics_quality()
aspectRatio = display_get_width()/display_get_height()

view_set_wport(0, floor(graphicsQuality*aspectRatio))
view_set_hport(0, graphicsQuality)
	
camera_set_view_size(global.camera,
floor(graphicsQuality*aspectRatio*(isRoomOut ? global.portHeight_real/graphicsQuality : 1)),
floor(graphicsQuality*(isRoomOut ? global.portHeight_real/graphicsQuality : 1)))

if (room == roomFPS)
	set_window_size()
	
surface_resize_special()
gui_resize_special()

event_perform(ev_mouse, ev_global_middle_press)

// ? (no extension, but correct) window_set_topmost(window_get_fullscreen())

with (contCursor)
	event_perform(ev_other, ev_room_start)