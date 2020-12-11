text = ""
tW = 0
tH = 0

draw_set_font(fontTutorial)
	title = ""
	tH_title = string_height("|")+3
draw_set_font(fontMain)
alarm[2] = 1

image_alpha = -1
fixedAlpha = -1
image_speed = 0
alarm[3] = 1

owner = -1
relativeDepth = true

point_x = unique_number
point_y = unique_number

offset_x = 0
offset_y = 0
owner_offset_x = 0
owner_offset_y = 0
owner_onGUI = true

alphaFactor = 0

imageNumber = 0

mouseNear = false
mouse_ison_window = false
windows = ds_list_create()

tutorialNo = -1

inView = false
global_tab = false