function gui_resize_special() {
	var gui_size = (global.gui_size-IS_MOBILE*0.3)*global.portHeight_real/view_get_hport(0)
	display_set_gui_size(view_get_wport(0)*(contMain.isRoomOut ? 1.3 : gui_size),
						 view_get_hport(0)*(contMain.isRoomOut ? 1.3 : gui_size))
}
