if (IS_MOBILE and !global_tab)
	exit
global_tab = false

var button_clicked = false

if (contView.fullscreenLock or blackScreenAlpha > 0.5)
	exit

if (mouseOn_light) {
	global.lightActive = !global.lightActive
	button_clicked = true
}
else if (mouseOn_fullscreen) {
	with (contView)
		event_perform(ev_keypress, vk_f11)
	button_clicked = true
}
else if (mouseOn_pixelQuality[0]) {
	global.quality = 1
	surface_resize_special()
	button_clicked = true
}
else if (mouseOn_pixelQuality[1]) {
	global.quality = 1.2
	surface_resize_special()
	button_clicked = true
}
else if (mouseOn_pixelQuality[2]) {
	global.quality = 1.4
	surface_resize_special()
	button_clicked = true
}
else if (mouseOn_performanceMode[0]) {
	global.performanceMode = 0
	button_clicked = true
}
else if (mouseOn_performanceMode[1]) {
	global.performanceMode = 1
	button_clicked = true
}
else if (mouseOn_performanceMode[2]) {
	global.performanceMode = 2
	button_clicked = true
}
else if (mouseOn_performanceMode[3]) {
	global.performanceMode = 3
	button_clicked = true
}
else if (mouseOn_guiSize[0]) {
	global.gui_size = 1.4
	button_clicked = true
}
else if (mouseOn_guiSize[1]) {
	global.gui_size = 1.3
	button_clicked = true
}
else if (mouseOn_guiSize[2]) {
	global.gui_size = 1.2
	button_clicked = true
}
else if (mouseOn_guiSize[3] and !IS_MOBILE) {
	global.gui_size = 1.1
	button_clicked = true
}
else if (mouseOn_turkish) {
	global.language = eng() ? lang_turkish : lang_english
	
	with (objMainMenuButton)
		event_perform(ev_other, ev_user11)
		
	event_perform(ev_other, ev_user0)
		
	button_clicked = true
}
else if (mouseOn_vs) {
	change_verticalSync(!global.verticalSync)
	
	button_clicked = true
}
else {
	for (var i = 0; i < 7; i++){
		if (mouseOn_fpsChoice[i]) {
			set_manual_fps(global.fpsValue[i])

			button_clicked = true
		}
	}
}

if (button_clicked)
	save_options()