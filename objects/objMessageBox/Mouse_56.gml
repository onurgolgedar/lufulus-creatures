drag = false

if (IS_MOBILE and !global_tab)
	exit
global_tab = false

if (!destroy and leftPressedOnBody == true and image_alpha > 0.3) {
	event_perform(ev_other, ev_user1)
    
    if (mouseOnBody) {
        event_perform(ev_other, ev_user2)
        
        // Return
        if (mouseOnButton != -1) {
			pressedButtonClipped = buttonClipped[mouseOnButton]
			
            if (owner != -1) {
				with (owner) {
					other.answer = other.buttonNo[other.i]
					give_answer(other.answer, other.qKey)
				}
            }
        
            destroy = true
            alarm[2] = 1
        }
    }
}