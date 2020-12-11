delta_alarm(0, sec /*sec/4*/)

if (!global.showGUI)
	controlled_window_set_cursor_sprite(sprNothingness, 0)
else if (global.gamepad_active) {
	if (contMain.isRoomOut or !instance_exists(contPlayer)) {
		if (!global.mouseControl) {
			global.mouseControl = true
			controlled_window_set_cursor_sprite(sprCursor, 0)
			image_xscale = 1
			image_yscale = 1
			image_blend = c_white
			image_alpha = 1
		}
	}
	else if (instance_exists(objMap) or instance_exists(parWindow) and is_outfight()) {
		if (!global.mouseControl) {
			global.mouseControl = true
			controlled_window_set_cursor_sprite(sprCursor, 0)
			image_xscale = 1
			image_yscale = 1
			image_blend = c_white
			image_alpha = 1
		}
	}
	else if (test_effectbox(efboxSkill12, objPlayer.id) and efboxSkill12.maxTime == -1) {
		if (!global.mouseControl) {
			global.mouseControl = true
			controlled_window_set_cursor_sprite(sprCursor, 0)
			image_xscale = 1
			image_yscale = 1
			image_blend = c_white
			image_alpha = 1
		}
	}
	else {	
		if (!global.mouseControl and global.mode != md_attack and is_outfight()) {
			global.mouseControl = true
			controlled_window_set_cursor_sprite(sprCursor, 0)
			image_xscale = 1
			image_yscale = 1
			image_blend = c_white
			image_alpha = 1
		}
		else if (global.mouseControl and (global.mode == md_attack or !is_outfight())) {
			global.mouseControl = false
			controlled_window_set_cursor_sprite_ext(sprCursor, 0, 1, 1, c_red, 0.5)
			image_xscale = 0.85
			image_yscale = 0.85
			image_blend = c_red
			image_alpha = 0.5
		}
	}
}