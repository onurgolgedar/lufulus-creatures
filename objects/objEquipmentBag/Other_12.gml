mouseOnBox = false
mouseOnBox_i = -1
mouseOnBox_j = -1

for (var m = horizontalBoxCount*(page-1); m < horizontalBoxCount*page; m++) {
    for (var n = 0; n < verticalBoxCount; n++) {
        if (!(m%(horizontalBoxCount-1) == 0 and n%(verticalBoxCount-1) == 0) and device_mouse_x_to_gui(0) > x+box_x[m , n]-boxEdge/2 and device_mouse_x_to_gui(0) < x+box_x[m, n]+boxEdge/2 and
        device_mouse_y_to_gui(0) > y+box_y[m, n]-boxEdge/2 and device_mouse_y_to_gui(0) < y+box_y[m, n]+boxEdge/2) {
            mouseOnBox_i = m
            mouseOnBox_j = n
            mouseOnBox = true
        }
    }
}