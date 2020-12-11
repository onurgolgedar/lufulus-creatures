var isDialogue = (dialogueID != -1)

mouseOnBody = device_mouse_x_to_gui(relatedMouseDevice) > x and device_mouse_x_to_gui(relatedMouseDevice) < x+width+textHOffset*2 and
device_mouse_y_to_gui(relatedMouseDevice) > y and device_mouse_y_to_gui(relatedMouseDevice) < y+height+textVOffset*2+ceil(buttonCount/(1+!isDialogue))*(buttonHeight+7)+5
and image_alpha > 0.5