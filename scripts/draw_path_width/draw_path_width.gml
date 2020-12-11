function draw_path_width() {
	var v_path = argument[0]
	var current_x, current_y, previous_x, previous_y, previous_player_x, previous_player_y, circle_x, circle_y
	var beforeAlpha = draw_get_alpha()
	var color = c_orange
	var color2 = c_black

	if (argument_count > 3)
		color = argument[3]

	if (argument_count > 4)
		color2 = argument[4]

	var for_size = path_get_number(v_path)
	for (var i = 1; i < for_size; i++) {               
	    current_x = path_get_point_x(v_path, i)
	    current_y = path_get_point_y(v_path, i)
	    previous_x = path_get_point_x(v_path, i-1)
	    previous_y = path_get_point_y(v_path, i-1)
        
	    if (i == 1) {
	        previous_player_x = argument[1]
	        previous_player_y = argument[2]
	    }
            
	    circle_x = previous_player_x-(previous_x-current_x)
	    circle_y = previous_player_y-(previous_y-current_y)
      
		draw_circle_color(previous_player_x, previous_player_y, 2+contMain.period/4, color, color, false)
	    draw_line_width_color(previous_player_x, previous_player_y, circle_x, circle_y, 3+contMain.period/4, color, color)
		var isLast = (i+1 == for_size)
		draw_circle_color(circle_x, circle_y, 2+contMain.period/4, color, color, false)
	
		if (isLast) {
			draw_set_alpha(beforeAlpha/1.5)
		    draw_circle_color(circle_x, circle_y, 6+contMain.period/3, color2, color2, false)
			draw_set_alpha(beforeAlpha)
			draw_circle_color(circle_x, circle_y, 1+contMain.period/1.7, color, color, false)
		}
		else if (i == 1) {
			draw_set_alpha(beforeAlpha/1.5)
		    draw_circle_color(previous_player_x, previous_player_y, 6+contMain.period/3, color2, color2, false)
			draw_set_alpha(beforeAlpha)
			draw_circle_color(previous_player_x, previous_player_y, 1+contMain.period/1.7, color, color, false)
		}
        
	    previous_player_x = circle_x
	    previous_player_y = circle_y
	}


}
