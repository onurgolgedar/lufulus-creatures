event_inherited()

height = 0
width = 0
titleWidth = 0
titleHeight = 0
textHOffset = 8
textVOffset = 4
buttonWidth = 139//142
buttonHeight = 36+IS_MOBILE*10//35//36//38

mouseOnBody = false
leftPressedOnBody = false
pressedButtonClipped = ""
front = true
destroy = false
mouseOnButton = -1
blackBackground = false
owner = -1
answer = -1
uniqueNo = -1
timeStopped = false
global_tab = false
time = -1
maxTime = -1
relatedMouseDevice = 0

dialogueNo = -1
dialogueID = -1
dialogueSize = -1

specialDesign = false
color = windowColor_main

soundPlayed = false
ltext_timerStopped = ""
ltext_stopTimer = ""

alignBottom = false

tab_index = -1

offY = -1
offX = -1
for (i = 0; i < 10; i++) {
	buttonPosition_x[i] = -1
	buttonPosition_y[i] = -1
}

image_alpha = 0

depth -= instance_number(parWindow)*2
event_perform(ev_other, ev_user0)

alarm[0] = 1
alarm[1] = 1

if (!is_room_out())
	alarm[7] = 1

if (global.gamepad_active)
	alarm[4] = 1
