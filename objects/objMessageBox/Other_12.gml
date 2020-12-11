// Button clicked
var isDialogue = (dialogueID != -1)

for (i = 0; i < buttonCount; i++) {
    var offY = height+textVOffset*2+ceil(buttonCount/(1+!isDialogue))*(buttonHeight+7)

    var xx = x+textHOffset+(width-buttonWidth)*(i mod 2 == 1)*(!isDialogue)
    var yy = y+offY+5-textVOffset+floor(i/(1+!isDialogue))*(buttonHeight+5)-ceil(buttonCount/(1+!isDialogue))*(buttonHeight+5)
	
    mouseOnButton = -1
    
    if (device_mouse_x_to_gui(relatedMouseDevice) > xx and device_mouse_x_to_gui(relatedMouseDevice) < xx+buttonWidth and
        device_mouse_y_to_gui(relatedMouseDevice) > yy and device_mouse_y_to_gui(relatedMouseDevice) < yy+buttonHeight and front) {
        mouseOnButton = i
        break
    }
}