fullscreenLock = false

global.camera = view_get_camera(0)

if (contMain.isRoomOut) {
	x = room_width/2
	y = room_height/2
	
	camera_set_view_target(global.camera, id)
	camera_set_view_speed(global.camera, -1, -1)
}

event_perform(ev_other, ev_user0)

viewH = camera_get_view_height(global.camera)
viewW = camera_get_view_width(global.camera)
camera_set_view_border(global.camera, floor(viewW/2), floor(viewH/2))

event_perform(ev_other, ev_user1)

with (contGUi) {
	var wPort = display_get_gui_width()
	qLogoX = wPort/2-200
	bLogoX = wPort/2-270
	cLogoX = wPort/2+200
	sLogoX = wPort/2+270
	mLogoX = /*IS_MOBILE ? 250 : */35
	pauseLogoX = mLogoX
	findButtonX = 130
}

delta_alarm(3, sec/15)