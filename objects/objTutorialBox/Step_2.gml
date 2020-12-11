var d_mx = device_mouse_x_to_gui(0)
var d_my = device_mouse_y_to_gui(0)

mouseNear = false
if (inView) {
	var dis = point_distance(x-offset_x, y-offset_y, d_mx, d_my)
	mouseNear = dis < sprite_width/2+3
	
	if (mouseNear and !mouse_ison_window) {
		var increase = 0.1*delta()
		if (alphaFactor+increase < 1)
			alphaFactor += increase
		else
			alphaFactor = 1
	}
	else {
		var decrease = 0.2*delta()
		if (alphaFactor-decrease > 0)
			alphaFactor -= decrease
		else
			alphaFactor = 0
	}
}
else
	alphaFactor = 0
	
mouse_ison_window = false
if (mouseNear) {
	with (parWindow) {
		event_user(1)
		if (mouseOnBody and depth < other.depth)
			other.mouse_ison_window = true
	}
	
	if (instance_exists(objMap) and depth > objMap.depth)
		mouse_ison_window = true
}

if (owner > -1) {
	if (instance_exists(owner)) {
		if (inView) {
			if (alarm[1] == -1)
				image_alpha = fixedAlpha == -1 ? owner.image_alpha : fixedAlpha
		
			if (relativeDepth and (!mouseNear or mouse_ison_window))
				depth = owner.depth-1
			else {
				if (ds_list_size(windows) == 0)
					depth = min(owner.depth-1, layer_get_depth("lyNirvana")+25)
				else {
					var window = ds_list_find_value(windows, 0)
					
					if (instance_exists(window))
						depth = window.depth+1
				}
			}
		}
	
		if (owner_onGUI) {
			x = owner.x+offset_x+owner_offset_x
			y = owner.y+offset_y+owner_offset_y
		}
		else {
			x = screen_point(owner.x, 0)+offset_x+owner_offset_x
			y = screen_point(owner.y, 1)+offset_y+owner_offset_y
		}
	}
	else if (owner != -2) {
		owner = -2
		alarm[1] = 2
	}
}
else {
	x = point_x+offset_x
	y = point_y+offset_y
}