mouseOnBox = false
mouseOnBox_i = -1
mouseOnBox_j = -1
mouseOnBox_forUpgrade = false

for (var m = horizontalBoxCount*(page-1); m < horizontalBoxCount*page; m++) {
    for (var n = 0; n < verticalBoxCount; n++) {
		if (item[m, n] != -1) {
			var upgradeButton = device_mouse_x_to_gui(0) > x+box_x[m, n]+boxEdge/2+upgradePart_offset_x-(item[m, n].upgrade == 0)*90
			and device_mouse_x_to_gui(0) < x+box_x[m, n]+boxEdge/2+upgradePart_offset_x+upgradePart_length-(item[m, n].upgrade == 0)*90
			and device_mouse_y_to_gui(0) > y+box_y[m , n]
			and device_mouse_y_to_gui(0) < y+box_y[m , n]+20
			and item[m, n].condition and item[m, n].upgrade < item[m, n].maxUpgrade
			
	        if (upgradeButton or device_mouse_x_to_gui(0) > x+box_x[m , n]-boxEdge/2-5/*SPECIAL*/ and device_mouse_x_to_gui(0) < x+box_x[m , n]+boxEdge/2+10/*SPECIAL*/ and
	        device_mouse_y_to_gui(0) > y+box_y[m , n]-boxEdge/2 and device_mouse_y_to_gui(0) < y+box_y[m , n]+boxEdge/2) {								
				if (!((mouseOnBox_forUpgrade == upgradeButton) and mouseOnBox_i == m and mouseOnBox_j == n)) {
					if (upgradeButton)
						mouseOnBox_forUpgrade = true
					
					with (item[m, n])
						event_perform(ev_other, ev_user2)
				
		            mouseOnBox_i = m
		            mouseOnBox_j = n
		            mouseOnBox = true
				}
	        }
		}
    }
}

