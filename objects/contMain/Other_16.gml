var focus = window_has_focus()

if (!windowHasFocus and focus and os_type == os_windows)
	free_all_surfaces()
	
if ((period mod 3) == 0 and global.fastPhysicsSync_mode
or period == 10 and global.physics_world_speed != physics_get_optimal_speed()
or game_get_fps() == fps_free)
	physics_world_sync(physics_get_optimal_speed())

if (window_get_fullscreen())
	display_mouse_set(clamp(display_mouse_get_x(), 0, display_get_width()-4), clamp(display_mouse_get_y(), 0, display_get_height()-4))
	
windowHasFocus = focus
isActive_skills = global.selectedSkill[4] == objMainBS

#region contGUi Optimizations
if (instance_exists(contGUi)) {
	// ? CPU
	var _showFPS = false
	if (abs(room_speed-fps) > 2 and !global.debugMode and game_get_fps() != 0)
		_showFPS = true
	contGUi.showFPS = _showFPS
	
	var _showArrows = true
	var _ds_size_green, _ds_size_red, _ds_size_yellow
	var _greenDirectionArrows, _redDirectionArrows, _yellowDirectionArrows
	with (contGUi) {
		_ds_size_green = ds_list_size(greenDirectionArrows)
		_ds_size_red = ds_list_size(redDirectionArrows)
		_ds_size_yellow = ds_list_size(yellowDirectionArrows)
	
		_greenDirectionArrows = greenDirectionArrows
		_redDirectionArrows = redDirectionArrows
		_yellowDirectionArrows = yellowDirectionArrows
	}
	for (var i = 0; i < _ds_size_green; i++) {
		var arrowTarget = ds_list_find_value(_greenDirectionArrows, i)
		if (instance_exists(arrowTarget) and point_distance(objPlayer.x, objPlayer.y, arrowTarget.x, arrowTarget.y) < 170)
			_showArrows = false
	}
	for (var i = 0; i < _ds_size_red; i++) {
		var arrowTarget = ds_list_find_value(_redDirectionArrows, i)
		if (instance_exists(arrowTarget) and point_distance(objPlayer.x, objPlayer.y, arrowTarget.x, arrowTarget.y) < 170)
			_showArrows = false
	}
	for (var i = 0; i < _ds_size_yellow; i++) {
		var arrowTarget = ds_list_find_value(_yellowDirectionArrows, i)
		if (instance_exists(arrowTarget) and point_distance(objPlayer.x, objPlayer.y, arrowTarget.x, arrowTarget.y) < 170)
			_showArrows = false
	}
	contGUi.showArrows = _showArrows
}
#endregion

with (parTree) {
	if (place_meeting(x, y, objPlayer)) {
		if (image_alpha != 0.4) {
			var amount = 0.05*delta()
		
			if (image_alpha-amount > 0.4)
				image_alpha -= amount
			else
				image_alpha = 0.4
		}
	}
	else {
		if (image_alpha != 1) {
			var amount = 0.05*delta()
		
			if (image_alpha+amount < 1)
				image_alpha += amount
			else
				image_alpha = 1
		}
	}
}

if (!global.pause and !isRoomOut) {
	if (objPlayer.shiftMode and contPlayer.shiftHeal_extension) {
		with (objPlayer) {
			change_hp(maxHp*25/1000*shiftMode*1/2)
		
			if (global.performanceMode > 0)
				instance_create(x, y, efSmallHeal)
		}
	}

	if (!is_outfight()) {
		if (contGUi.outFight_alpha-0.07 > 0)
			contGUi.outFight_alpha -= 0.07
		else
			contGUi.outFight_alpha = 0
	}
	else {
		if (contGUi.outFight_alpha+0.07 < 1)
			contGUi.outFight_alpha += 0.07
		else
			contGUi.outFight_alpha = 1
	}

	x = objPlayer.x
	y = objPlayer.y
	audio_listener_position(x, y, 0)
	
	with (objPlayer) {
		if (scale_factor != 1) {
			if (scale_factor+0.015 < 1)
				scale_factor += 0.015
			else
				scale_factor = 1
		}
	}
}

if (steam_is_overlay_activated()) {
	if (!global.pause)
		event_perform(ev_keypress, ord("P"))
}