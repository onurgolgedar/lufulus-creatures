if (specialDesign) {
	buttonHeight -= 7
	buttonWidth -= 16
	textHOffset -= 2
	textVOffset -= 2
	
	if (owner.object_index == objTutorialBox)
		color = c_ltyellow
	
	if (!front)
		event_perform(ev_other, ev_user0)
}

if (menuBox)
	image_alpha = 1

if (blackBackground) {
	buttonWidth += 45
	buttonHeight += 3
}

if (time > 0) {
	ltext_stopTimer = eng() ? (IS_MOBILE ? "tap" : "click")+" to stop timer" : "sayacı durdurmak için "+(IS_MOBILE ? "dokun" : "tıkla")+""
	ltext_timerStopped = eng() ? "the timer is stopped" : "sayaç durduruldu"
}

var isDialogue = (dialogueID != -1)

if (isDialogue)
	contPlayer.onDialogue = true

draw_set_alpha(0)

for (var i = 0; i < buttonCount; i += 1) {
    for (var k = 1; k <= string_length(button[i]); k += 1) {
        if (string_width(string_copy(button[i], 0, k)) > 110+isDialogue*278+buttonWidth-143 or string_count("\n", string_copy(button[i], 0, k))) {
            buttonClipped[i] = string_copy(button[i], 0, k-1)+"..."
            break
        }
        else
			buttonClipped[i] = string_copy(button[i], 0, k)
    }
}

pureText = draw_text_colortags(x, y, text)
var additionDialogue = string_return("["+string(dialogueNo)+"/"+string(dialogueSize)+"] ", dialogueID != -1 and dialogueSize != 1)

if (draw_text_colortags(x, y, title) == title)
	title = "[c="+string(c_ltgray)+"]"+title+"[/c]"
	
title = string_return("[c="+string(c_yellow)+"]"+additionDialogue+"[/c]", additionDialogue != "")+title

pureTitle = draw_text_colortags(x, y, title)

draw_set_font(fontMessageTitle)
    titleWidth = string_width(pureTitle)
    titleHeight = string_height(pureTitle)
draw_set_font(fontMain)

draw_set_alpha(1)

// If it is dialogue
if (isDialogue) {
	titleWidth = max(420, titleWidth)
	titleHeight = titleHeight
	buttonWidth = 420
	
	if (buttonCount == 1 and buttonClipped[0] != button[0]) {
		buttonWidth = string_width(button[0])+17
		buttonHeight = string_height(button[0])+14
		buttonClipped[0] = button[0]
	}
}
else {
	with (parWindow) {
		if (id != other.id and object_index == objMessageBox and dialogueID != -1)
			event_perform(ev_other, ev_user0)
	}
}

width = max(titleWidth, string_width(pureText), /*textHOffset*2*(!isDialogue)*/+buttonWidth+(buttonCount > 1)*(buttonWidth+textHOffset)*(!isDialogue))
height = titleHeight+string_height(pureText)

with (objTutorialBox) {
	if (owner == other.id) {
		image_xscale = 0.75
		image_yscale = image_xscale
		owner_offset_x += other.width-12
		owner_offset_y += other.height+37
		offset_y += 14
	}
}

image_xscale = width+textHOffset*2
image_yscale = height+textVOffset*2

with (objMessageBox)
    if ((text == other.text and title == other.title or uniqueNo != -1 and uniqueNo == other.uniqueNo) and id != other.id and owner == other.owner)
        instance_destroy()
		
offY = height+textVOffset*2+ceil(buttonCount/(1+!isDialogue))*(buttonHeight+7)
offX = width+textHOffset*2

if (alignBottom) {
	if (y-offY-5 > 0)
		y -= offY+5
	else
		y = 0
}
		
for (i = 0; i < buttonCount; i++) {
	draw_set_valign(fa_center) draw_set_halign(fa_left) 
			
	buttonPosition_x[i] = textHOffset+(width-buttonWidth)*(i mod 2 == 1)*(!isDialogue)
	buttonPosition_y[i] = offY-textVOffset+floor(i/(1+!isDialogue))*(buttonHeight+5)-ceil(buttonCount/(1+!isDialogue))*(buttonHeight+5)
}

if (y+offY+5 > display_get_gui_height())
	y -= y+offY+5-display_get_gui_height()
	
if (x+offX+5 > display_get_gui_width())
	x -= x+offX+5-display_get_gui_width()
	
if (global.gamepad_active and gamepad_is_connected(global.gamepad) and !(buttonCount == 1 and time > 0)) {
	mouse_set_position(x+buttonPosition_x[0]+buttonWidth/2, y+buttonPosition_y[0]+buttonHeight/2)
	tab_index = 0
}

draw_set_default()