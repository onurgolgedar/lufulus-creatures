depth -= 10
image_speed = 0

if (!unlocked)
	image_blend = c_black
	
mouseOn = false
clickedBefore = false
hasQuest = false
hasFinished = false
hasPossibleQuest = false
description = ""
isReady = false
isDestroyed = false
global_double_tap = false
global_tap = false

draw_set_font(fontLocation)
tbT = "[c="+string(c_black)+"]"+name+"[/c]"
draw_set_alpha(0)
tbW = string_width(draw_text_colortags(0, 0, tbT))
tbH = string_height(draw_text_colortags(0, 0, tbT))
draw_set_alpha(1)
tbT_desc = ""
tbW_desc = 0
tbH_desc = 0
draw_set_default()

infoText = ""

symbol = -1

alarm[0] = 1