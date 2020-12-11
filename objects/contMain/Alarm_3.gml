var cam = global.camera

if (!isRoomOut and !global.pause) {
	if (global.gamepad_active) {		
		if (gamepad_button_check(global.gamepad, gp_padd)) {
			gamepad_down += 7
			if (gamepad_down == 28) {
				show_dialoguebox(400, 400, "", eng() ? "Which window do you\nwant to open?" : "Hangi pencereye erişmek\nistersin?", id, 3,
				eng () ? "Items" : "Eşyalar", eng() ? "Character" : "Karakter", eng() ? "Quests" : "Görevler", eng() ? "Skills" : "Beceriler", eng() ? "Map" : "Harita", "Cancel")
			}
		}
		else
			gamepad_down = 0
	}
	
	/*instance_activate_object(parRock)
	instance_activate_object(parWall)*/
	
	#region Update Minimap Surface	
	var _miniMap_width = miniMap_width
	var _miniMap_height = miniMap_height
	
	if (!surface_exists(global.minimapSurface))
		global.minimapSurface = create_surface(_miniMap_width+10, _miniMap_height+10)

	surface_set_target(global.minimapSurface)
		draw_clear_alpha(c_black, 0)
		draw_set_alpha(0.85)
			draw_roundrect_ext(0, 0, _miniMap_width+10, _miniMap_height+10, 32, 32, 0)
		
		if (global.performanceMode > IS_MOBILE*2) {
			gpu_set_blendmode(bm_subtract) draw_set_alpha(1)
				draw_roundrect_ext(7, 7, _miniMap_width+3, _miniMap_height+3, 28, 28, 0)
			gpu_set_blendmode(bm_normal) draw_set_alpha(0.75)
				draw_roundrect_ext(0, 0, _miniMap_width+10, _miniMap_height+10, 28, 28, 0)
		}
		draw_set_alpha(1)
		
		with (objInvisibleWall)
			draw_sprite_ext(sprNoWalk, 0, 5+x/room_width*_miniMap_width, 5+y/room_height*_miniMap_height, 1/room_width*_miniMap_width*image_xscale, 1/room_height*_miniMap_height*image_yscale, image_angle, c_red, 1)
		
		with (parAI) {
			if (death) {
				if (hasDropList and ds_list_size(droppedList) > 0) {
					draw_set_color(c_blue) draw_set_alpha(0.2+(contMain.period > 3 and contMain.period < 9)*0.6)
						draw_circle(5+x/room_width*_miniMap_width, 5+y/room_height*_miniMap_height, 4+IS_MOBILE, 0)
					draw_set_alpha(1)
				}
			}
			else if (teamNo == team_neutralFriend) {
				draw_sprite_ext(sprPlayer_minimap, 1, 5+x/room_width*_miniMap_width, 5+y/room_height*_miniMap_height, 0.93+contMain.period/110+IS_MOBILE*0.17, 0.93+contMain.period/110+IS_MOBILE*0.17, 90+image_angle, c_white, 1)
			}
			else if (isLeader_hard) {
				draw_set_color(c_dkorange)
					draw_circle(5+x/room_width*_miniMap_width, 5+y/room_height*_miniMap_height, 4+IS_MOBILE, 0)
			}
			else if (boss) {
				draw_set_color(object_index == objLufulusWisdom ? c_aqua : c_red)
					draw_circle(5+x/room_width*_miniMap_width, 5+y/room_height*_miniMap_height, 5+IS_MOBILE, 0)
					draw_circle_width(5+x/room_width*_miniMap_width+1, 5+y/room_height*_miniMap_height+1, 7+IS_MOBILE, 9+IS_MOBILE, 15)
			}
			else {
				draw_set_color(c_niceblue)
					draw_circle(5+x/room_width*_miniMap_width, 5+y/room_height*_miniMap_height, 3+IS_MOBILE, 0)
			}
			
			if (!death and (isQuestTarget or isQuestTarget_direct)) {
				draw_set_color(c_yellow) draw_set_alpha(0.23+(contMain.period > 3 and contMain.period < 9)*0.63)
					draw_circle(5+x/room_width*_miniMap_width, 5+y/room_height*_miniMap_height, 6+IS_MOBILE, 0)
				draw_set_alpha(1)
			}
		}
		
		if (instance_exists(contGUI)) {
			var ds_size_yellow = ds_list_size(contGUI.yellowDirectionArrows)
			for (var i = 0; i < ds_size_yellow; i++) {
				var dirObj = ds_list_find_value(contGUI.yellowDirectionArrows, i)
	
				if (instance_exists(dirObj)) {
					draw_set_color(c_yellow) draw_set_alpha(0.4+(contMain.period > 3 and contMain.period < 9)*0.4)
						draw_circle(5+dirObj.x/room_width*_miniMap_width, 5+dirObj.y/room_height*_miniMap_height, 5+IS_MOBILE, 0)
					draw_set_alpha(1)
				}
			}
		}
		
		with (parNPC) {
			if (excMark > 0)
				draw_sprite_ext(sprExcMark, excMark, 5+x/room_width*_miniMap_width+6, 5+y/room_height*_miniMap_height, 0.5+contMain.period/150+IS_MOBILE*0.1, 0.5+contMain.period/150+IS_MOBILE*0.1, 0, c_white, 1)
		}
		
		with (objPlayer) {
			/*draw_set_color(c_ltpink)
				draw_circle(5+x/room_width*_miniMap_width, 5+y/room_height*_miniMap_height, 4, 0)
			draw_circle_width(5+x/room_width*_miniMap_width+1, 5+y/room_height*_miniMap_height+1, 6, 7, 15)*/
			draw_sprite_ext(sprPlayer_minimap, 0, 5+x/room_width*_miniMap_width, 5+y/room_height*_miniMap_height, 0.96+contMain.period/90+IS_MOBILE*0.21, 0.96+contMain.period/90+IS_MOBILE*0.21, 90+image_angle, c_white, 1)
		}
		draw_set_color(c_black) draw_set_alpha(1)
	surface_reset_target()
	#endregion
	
	instance_deactivate_object(parWall)
	instance_deactivate_object(parTree)
	instance_deactivate_object(objTreeBody_env)
	instance_deactivate_object(parRock)
	if (global.performanceMode == 0)
		instance_deactivate_object(parNormalLight)
	instance_deactivate_object(objRock_nonSolid_env)
	instance_deactivate_object(objPath_env)
	instance_deactivate_object(objFixShadow_env)
	instance_deactivate_object(parPlant)
	//instance_deactivate_object(objFollowLight)
	instance_deactivate_object(objCoin)

	instance_activate_region(camera_get_view_x(cam)-50, camera_get_view_y(cam)-50,
	camera_get_view_x(cam)+camera_get_view_width(cam)+50,
	camera_get_view_y(cam)+camera_get_view_height(cam)+50, true)
	
	#region Update Shadow Surface
	if (!IS_MOBILE) {
		if (!surface_exists(global.shadowSurface_wall))
			global.shadowSurface_wall = create_surface(room_width, room_height)
		
		surface_set_target(global.shadowSurface_wall)
			draw_clear_alpha(c_black, 0) gpu_set_tex_filter(0)		
			with (objRock_nonSolid_env)
				draw_sprite_ext(sprite_index, -1, x, y, image_xscale+0.07, image_yscale+0.07, image_angle, c_black, 0.8)
	
			with (parRock) {
				if (!noOutline and inView) {
					draw_sprite_ext(sprite_index, -1, x, y, image_xscale+0.09, image_yscale+0.09, angle, c_black, 0.8)
					if (global.performanceMode > 2)
						draw_sprite_ext(sprite_index, -1, x, y, image_xscale+0.16, image_yscale+0.16, angle, c_black, 0.8)
				}
			}
		surface_reset_target() gpu_set_tex_filter(1)
	}
	#endregion
	
	with (parAI) {
		if (is_in_view(x, y)) {
			inView = true
			
			if (!death and hasDropList) {
				if (isDropEnrichment_needed == true)
					enrich_droplist(boss)
				else if (isDrop_needed == true)
					drop_items()
			}
		}
		else 		
			inView = false
	}
	
	with (parPlant)
		inView = is_in_view(x, y)
		
	with (parWall)
		inView = is_in_view(x, y)
		
	with (parRock)
		inView = is_in_view(x, y)
	
	with (objTutorialBox)
		inView = is_in_gui(x, y)
	
	with (objLootbox)
		inView = is_in_view(x, y)
		
	with (parViewCheck)
		inView = is_in_view(x, y)
	
	/*var distance_to_center = point_distance(objPlayer.x, objPlayer.y, camera_get_view_x(cam)+camera_get_view_width(cam)/2, camera_get_view_y(cam)+camera_get_view_height(cam)/2)
	var extraSpeed_percentage = (distance_to_center > 15)*0.1+(distance_to_center > 30)*0.2+(distance_to_center > 60)*0.1+(distance_to_center > 100)*0.2+(distance_to_center > 140)*0.3+(distance_to_center > 200)*0.5
	var spd = global.movementSpeed*(0.95+extraSpeed_percentage)*delta()
	camera_set_view_speed(cam, spd, spd)*/
}

delta_alarm(3, 8+IS_MOBILE-global.performanceMode)