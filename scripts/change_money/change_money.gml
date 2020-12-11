/// @param value
/// @param soundOn*
function change_money() {

	var snd = false
	if (argument_count == 2)
		snd = argument[1]
	
	if (snd) {
		if (argument[0] > 0)
			audio_play_sound(sndCashBag, 5, false)
		else if (argument[0] != 0)
			audio_play_sound(sndCash, 5, false)
	}

	global.money += argument[0]

	if (argument[0] < 0) {
		ini_open(string(global.steamID)+"\\save_"+global.saveNo+".lufsav")
			ini_write_real("442531a", "553a21", encyrpt(global.money))
		ini_close()
	}

	global.anticheat_ownings = recalculate_sha_ownings()


}
