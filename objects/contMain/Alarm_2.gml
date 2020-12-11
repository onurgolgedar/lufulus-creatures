alarm[2] = 4

// ? Because there is no VSync option.
exit

if (room == roomMenu)
	exit

var dfps = global.freeFPS_mode ? fps : round(1/(delta_time/1000000))
var dfpsSpace = 30

if (totalDFPS_count < dfpsSpace*2) {
	if (dfps > 27 and dfps < 500) {
		if (totalDFPS_count >= dfpsSpace)
			totalDFPS += dfps
			
		totalDFPS_count++
	}
}
else {
	var ignore = false
	if (!window_has_focus()) {
		ignoreAverageFPS = true
		ignore = true
	}
	else {
		ignore = ignoreAverageFPS
		ignoreAverageFPS = false
	}
	
	if (!ignore) {
		var average = round(totalDFPS/dfpsSpace)
		average = clamp(average, 30, 240)
	
		global.averageFPS = get_nearest_standard_fps(average)
	
		if (!global.freeFPS_mode)
			performWell = abs(fps/room_speed-1) < 0.05
						  and (!global.verticalSync or abs(room_speed/global.refreshRate-1) < 0.04 or abs(room_speed/global.refreshRate-0.5) < 0.015)
				          and (!global.verticalSync or is_standard_fps(room_speed))
					  
		if (!performWell and abs(fps/room_speed-0.5) < 0.03 and abs(room_speed/global.refreshRate-1) < 0.03)
			global.halfFPS_warning = true
		else
			global.halfFPS_warning = false
	
		if (global.freeFPS_mode)
			game_set_fps(fps_average)
		else if (global.verticalSync and !performWell)
			game_set_fps(fps_free)
	}
	
	totalDFPS = 0
	totalDFPS_count = 0
}