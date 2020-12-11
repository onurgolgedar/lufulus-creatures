var mouseOnWindow = false
with (parWindow)
	if (mouseOnBody)
		mouseOnWindow = true

if (position_meeting(mouse_x, mouse_y, id) and !mouseOnWindow) {
	/*if (!mouseOn and usable)
		audio_play_sound(sndWindowTick, 1, 0)*/
	
	mouseOn = true
}
else
	mouseOn = false