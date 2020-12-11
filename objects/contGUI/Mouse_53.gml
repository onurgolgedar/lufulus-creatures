if (IS_MOBILE and !global_tab)
	exit
global_tab = false

if (instance_exists(objMap))
	exit

if (mouseOnArrow != -1 and !test_upperclick_window()) {
	arrowPath_color = c_white
	
	if (arrowPath == pointer_null)
		arrowPath = path_add()
	
	if (mouseOnArrow >= 400 and ds_list_size(blueDirectionArrows) > mouseOnArrow-400) {
		mp_grid_path(global.mainGrid, arrowPath, objPlayer.x, objPlayer.y, ds_list_find_value(blueDirectionArrows, mouseOnArrow-400).x,  ds_list_find_value(blueDirectionArrows, mouseOnArrow-400).y, true)
		arrowPath_color = c_challenge
	}
	else if (mouseOnArrow >= 300 and ds_list_size(redDirectionArrows) > mouseOnArrow-300) {
		mp_grid_path(global.mainGrid, arrowPath, objPlayer.x, objPlayer.y, ds_list_find_value(redDirectionArrows, mouseOnArrow-300).x,  ds_list_find_value(redDirectionArrows, mouseOnArrow-300).y, true)
		arrowPath_color = c_red
	}
	else if (mouseOnArrow >= 200 and ds_list_size(yellowDirectionArrows) > mouseOnArrow-200) {
		mp_grid_path(global.mainGrid, arrowPath, objPlayer.x, objPlayer.y, ds_list_find_value(yellowDirectionArrows, mouseOnArrow-200).x,  ds_list_find_value(yellowDirectionArrows, mouseOnArrow-200).y, true)
		arrowPath_color = c_yellow
	}
	else if (mouseOnArrow >= 100 and ds_list_size(greenDirectionArrows) > mouseOnArrow-100) {
		mp_grid_path(global.mainGrid, arrowPath, objPlayer.x, objPlayer.y, ds_list_find_value(greenDirectionArrows, mouseOnArrow-100).x,  ds_list_find_value(greenDirectionArrows, mouseOnArrow-100).y, true)
		arrowPath_color = c_lime
	}
	
	if (arrowPath_color != c_white) {
		arrowPath_alpha = 0.8
		arrowPath_x = objPlayer.x
		arrowPath_y = objPlayer.y

		delta_alarm(4, sec*1.5)
	}
}