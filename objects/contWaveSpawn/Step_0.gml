event_user(1)

if (gamepad_button_check_pressed(global.gamepad, gp_face4) or (global_tab and mouseOn)) {
	with (contPlayer)
		event_perform(ev_keyrelease, ord("Q"))
}

global_tab = false

var isBreak_before = isBreak
isBreak = !wave_started and (is_outfight() or room == roomLufulus and lufulusWave_counter > 12/* and lufulusRoom_creatureCount == 1*/ and instance_number(objLufulus) > 0 and !objLufulus.death)

if (isBreak != isBreak_before and isBreak and wave_no != 0 and !areAllWavesFinished)
	event_user(0)