if (!global.pause) {
	if (isRoomOut or alarm[4] != -1 or alarm[5] != -1 or global.consoleMode)
		exit

	if (screenSave != pointer_null) {
		free_surface(screenSave)
		screenSave = pointer_null
	}
	
	if (!IS_MOBILE) {
		if (surface_exists(application_surface)) {
			screenSave = create_surface(surface_get_width(application_surface), surface_get_height(application_surface))
			surface_copy_part(screenSave, 0, 0, application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface))
			application_surface_draw_enable(false)
		}
	}
	else
		display_mouse_set/**/(display_get_width()*3/4, display_get_height()*3/4)
	
	save_all(global.saveNo)
		
	global.itemSelected = -1
	
	with (all) {
		if (object_index != contMain)
			instance_deactivate_object(id)
	}
	
	instance_activate_object(contLight)
	instance_activate_object(contCursor)
	instance_activate_object(contView)
	
	physics_pause_enable(true)
	
	var window = show_dialoguebox(15, 40, "", "[c="+string(c_white)+"]"+(eng() ? "Paused" : "Duraklatıldı")+"[/c]", id, 1, eng() ? "Main Menu" : "Ana Menü", string_return("[Hide]", IS_MOBILE), string_return(eng() ? "Exit Game" : "Oyunu Kapat", !IS_MOBILE), string_return(window_get_fullscreen() ? (eng() ? "Windowed Mode" : "Pencere Modu") : (eng() ? "Fullscreen Mode" : "Tam Ekran Modu"), !IS_MOBILE), eng() ? "Continue" : "Devam")
	window.blackBackground = true
	window.menuBox = true
	window.depth = depth-100
	
	global.pause = true
} else {
	with (objMessageBox) {
		visible = false
		close_window()
	}
		
	if (!IS_MOBILE)
		application_surface_draw_enable(true)
		
	gui_resize_special()
	global.pause = false
	instance_activate_all()
	physics_pause_enable(false)
	event_perform(ev_alarm, 3)
	if (screenSave != pointer_null) {
		free_surface(screenSave)
		screenSave = pointer_null
	}
}