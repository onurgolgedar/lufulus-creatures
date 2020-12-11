/// @description Q Press Duration

qPressTime += delta()

if (keyboard_check(ord("Q")) or global.gamepad_active and gamepad_button_check(global.gamepad, gp_face4)) {
	if (qPressTime < 20 and qPressTime != unique_number)
		alarm[8] = 1
	else {
		if (is_outfight()) {
			with (objPlayer)
				rigidbody_noarms_type1()
			
			event_user(4)
			
			qPressTime = unique_number
		}
		else
			show_messagebox(200, 200, eng() ? "It is not allowed when you are in fight." : "Bu işlem savaş sırasında yapılamaz.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec)
	}
}