var mouseOnWindow = false
with (parWindow)
	if (mouseOnBody)
		mouseOnWindow = true

if ((room == roomMenu and position_meeting(mouse_x, mouse_y, id) or (abs(mouse_x-x+lengthdir_x(22, image_angle)) < 108) and abs(mouse_y-y) < 25) and !mouseOnWindow) {
	/*if (!mouseOn and usable)
		audio_play_sound(sndWindowTick, 1, 0)*/
	
	mouseOn = true
}
else
	mouseOn = false
	
turn(startDir, 30)

if (room == roomOptions and no == 6)
	usable = global.quality != 1.2 or global.gui_size != 1.2 or global.manualRefreshRate_mode or global.lightActive == objMainMenuDraw.showGPUWarning or global.verticalSync or global.performanceMode != 2 or global.audio_gain_music != 0.75 or audio_get_master_gain(0) != 1 or global.audio_gain_nonmusic != 1