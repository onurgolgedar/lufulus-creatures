draw_texture_flush()

startTime = global.gameTime

isRoomOut = is_room_out()
isRoomShadowy = is_room_shadowy()
roomName = get_location(room)
	
global.itemSelected = -1

if (current_time > 5000 and os_type == os_windows and !global.refreshRateLogger_started) {
	execute_shell(@'"' + working_directory + @'RefreshRateLogger.exe"', false)
	global.refreshRateLogger_started = true
}

totalDFPS = 0
totalDFPS_count = 0
alarm[2] = sec

ini_open("display.ini")
	ini_write_real("Display", "refreshRate", IS_MOBILE ? 30 : 60)
ini_close()

with (contGUi)
	outFight_alpha = 1

audio_resume_all()

global.performanceOutFidelty = 7+global.performanceMode-IS_MOBILE*3

if (is_castle(room) and !audio_is_playing(sndMusicCastle) and !audio_is_playing(sndMusicClassic_calm))
	if (!global.musicStopped)
		audio_play_sound(sndMusicCastle, 10, true)

if (player_goto_x != unique_number) {
	objPlayer.phy_position_x = player_goto_x
	objPlayer.phy_position_y = player_goto_y
	objPlayer.x = player_goto_x
	objPlayer.y = player_goto_y
}

player_goto_x = unique_number
player_goto_y = unique_number

alarm[2] = sec
alarm[9] = 1

camera_set_view_speed(global.camera, -1, -1)
delta_alarm(3, 6)

if (gameTime_start == 0)
	gameTime_start = global.gameTime

define_quest_targets()

if (isRoomOut) {	
	instance_deactivate_object(contPlayer)
	instance_deactivate_object(contGUi)
	instance_deactivate_object(contLight)
	instance_deactivate_object(contFloor)
	instance_deactivate_object(contRoomRuler)
}

if (room == roomMenu or room == roomOptions)
	alarm[8] = sec/20

var isWaveRoom = instance_exists(contWaveSpawn)

ini_open("display.ini")
	global.displayRefreshRate = ini_read_real("Display", "refreshRate", IS_MOBILE ? 30 : 60)
	if (!global.manualRefreshRate_mode)
		global.refreshRate = global.displayRefreshRate
ini_close()

if (room != roomFPS) {
	if (!global.verticalSync)
		game_set_fps(global.refreshRate)
}
	
delta_alarm(11, sec)
physics_world_sync(global.physics_world_speed)
physics_world_update_iterations(120)

global.mainGrid = mp_grid_create(-100-isWaveRoom*8*50, -100-isWaveRoom*8*50, room_width/50+4+isWaveRoom*16, room_height/50+4+isWaveRoom*16, 50, 50)
mp_grid_add_instances(global.mainGrid, parSolid, true)
mp_grid_add_instances(global.mainGrid, contGridBlock, true)

global.calmGrid = mp_grid_create(-100-isWaveRoom*8*50, -100-isWaveRoom*8*50, room_width/50+4+isWaveRoom*16, room_height/50+4+isWaveRoom*16, 50, 50)
mp_grid_add_instances(global.calmGrid, contNoWalk, true)
mp_grid_add_instances(global.calmGrid, parSolid, true)
mp_grid_add_instances(global.calmGrid, contGridBlock, true)

miniMap_width = 215
miniMap_height = miniMap_width*room_height/room_width

if (!surface_exists(global.minimapSurface))
	global.minimapSurface = create_surface(other.miniMap_width+10, other.miniMap_height+10)

fm_update_all()

global.availableQuestsCount = 0
var ds_size = ds_list_size(global.allQuests)
for (var i = 0; i < ds_size; i++) {
	var q = ds_list_find_value(global.allQuests, i)
	
	if (is_quest_available(q, false)) {
		var qInstance = instance_create(0, 0, q)
			
		if (!qInstance.isSimpleQuest and !qInstance.isPrepQuest)
			global.availableQuestsCount++
				
		instance_destroy(qInstance)
	}
}
	
if (!is_room_out()) {
	#region Outwall
	var outWall = instance_create(-50/*-100*/, 0, isWaveRoom ? contOutsideWall_onlyPlayer : contOutsideWall)
	with (outWall) {
		outWall.image_yscale = room_height/50
		var box_fixture = physics_fixture_create()
		physics_fixture_set_density(box_fixture, 0)
		physics_fixture_set_awake(box_fixture, true)
		physics_fixture_set_box_shape(box_fixture, sprite_width/2, sprite_height/2)
		physics_fixture_bind_ext(box_fixture, id, -sprite_width/2, -sprite_height/2)
		physics_fixture_delete(box_fixture)
		phy_active = true
	}

	outWall = instance_create(room_width/*+100*/, 0, isWaveRoom ? contOutsideWall_onlyPlayer : contOutsideWall)
	with (outWall) {
		outWall.image_yscale = room_height/50
		var box_fixture = physics_fixture_create()
		physics_fixture_set_density(box_fixture, 0)
		physics_fixture_set_awake(box_fixture, true)
		physics_fixture_set_box_shape(box_fixture, sprite_width/2, sprite_height/2)
		physics_fixture_bind_ext(box_fixture, id, -sprite_width/2, -sprite_height/2)
		physics_fixture_delete(box_fixture)
		phy_active = true
	}

	outWall = instance_create(0, -50/*-100*/, isWaveRoom ? contOutsideWall_onlyPlayer : contOutsideWall)
	with (outWall) {
		outWall.image_xscale = room_width/50
		var box_fixture = physics_fixture_create()
		physics_fixture_set_density(box_fixture, 0)
		physics_fixture_set_awake(box_fixture, true)
		physics_fixture_set_box_shape(box_fixture, sprite_width/2, sprite_height/2)
		physics_fixture_bind_ext(box_fixture, id, -sprite_width/2, -sprite_height/2)
		physics_fixture_delete(box_fixture)
		phy_active = true
	}

	outWall = instance_create(0, room_height/*+100*/, isWaveRoom ? contOutsideWall_onlyPlayer : contOutsideWall)
	with (outWall) {
		outWall.image_xscale = room_width/50
		var box_fixture = physics_fixture_create()
		physics_fixture_set_density(box_fixture, 0)
		physics_fixture_set_awake(box_fixture, true)
		physics_fixture_set_box_shape(box_fixture, sprite_width/2, sprite_height/2)
		physics_fixture_bind_ext(box_fixture, id, -sprite_width/2, -sprite_height/2)
		physics_fixture_delete(box_fixture)
		phy_active = true
	}
	#endregion
}

if (is_castle(room)) {
	#region Transporters
	transporter = instance_create(room_width/2, 0, objRoomChanger)
	transporter.image_xscale = room_width/transporter.sprite_width
	transporter.opensMap = true
	transporter.image_alpha = 0.65
	transporter.image_blend = c_ltgray
	
	var transporter = instance_create(room_width/2, room_height, objRoomChanger)
	transporter.image_xscale = room_width/transporter.sprite_width
	transporter.image_yscale = -1
	transporter.opensMap = true
	transporter.image_alpha = 0.65
	transporter.image_blend = c_ltgray

	transporter = instance_create(0, room_height/2, objRoomChanger)
	transporter.image_xscale = -room_width/sprite_get_width(transporter.sprite_index)
	transporter.image_angle = 90
	transporter.opensMap = true
	transporter.image_alpha = 0.65
	transporter.image_blend = c_ltgray
	
	transporter = instance_create(room_width, room_height/2, objRoomChanger)
	transporter.image_xscale = -room_width/sprite_get_width(transporter.sprite_index)
	transporter.image_yscale = -1
	transporter.image_angle = 90
	transporter.opensMap = true
	transporter.image_alpha = 0.65
	transporter.image_blend = c_ltgray
	#endregion
}