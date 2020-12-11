mouseOnBody = device_mouse_x_to_gui(0) > x
and device_mouse_x_to_gui(0) < x+horizontalBoxCount*(boxEdge+boxBetween)-boxBetween+offset_x*2-cut_right and
device_mouse_y_to_gui(0) > y
and device_mouse_y_to_gui(0) < y+verticalBoxCount*(boxEdge+boxBetween+boxBetween_additionalV)-(boxBetween+boxBetween_additionalV)+offset_yTop+offset_yDown