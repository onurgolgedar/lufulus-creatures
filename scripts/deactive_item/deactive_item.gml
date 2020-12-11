/// @param type
function deactive_item() {

	if (argument[0] == type_mweapon and is_mweapon_onhand()) {
		change_active(argument[0], -1, -1)
	
		with (contPlayer) {
			if (has_active_sweapon()) {
				changeWeaponChoiceTo = 2
				event_perform(ev_keyrelease, ord("Q"))
			}
			else {
				changeWeaponChoiceTo = 0
				event_perform(ev_keyrelease, ord("Q"))
			}
		}
	}
	else if (argument[0] == type_sweapon and is_sweapon_onhand()) {
		change_active(argument[0], -1, -1)
	
		with (contPlayer) {
			if (has_active_mweapon())
				with (contPlayer) {
					changeWeaponChoiceTo = 1
					event_perform(ev_keyrelease, ord("Q"))
				}
			else
				with (contPlayer) {
					changeWeaponChoiceTo = 0
					event_perform(ev_keyrelease, ord("Q"))
				}
		}
	}
	else
		change_active(argument[0], -1, -1)


}
