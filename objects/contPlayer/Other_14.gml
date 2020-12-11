var beforeMode = global.mode

if (!is_room_out())
	global.mode = (!objPlayer.noArms and (global.sWeaponSprite != sprNothingness or !(global.weaponSprite == sprTorch or global.weaponSprite == sprNothingness))) ? md_attack : md_calm

with (contGUI) {
	if (beforeMode != global.mode) {
		if (colorScreenAlpha == 0) {
			audio_play_sound(global.mode == md_attack ? sndWeaponUp : sndWeaponDown, 1, 0)
			/*if (global.gamepad_active) {
				colorScreenAlpha = 0.6
				colorScreenColor = c_ltorange
				alarm[1] = 1
			}*/
		}
	}
	
	event_user(9)
}