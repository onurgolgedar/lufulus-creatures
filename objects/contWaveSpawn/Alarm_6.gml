if (room == roomLufulus) {
/*	lufulusRoom_creatureCount = 0
	with (parCreature)
		if (!death)
			other.lufulusRoom_creatureCount++*/
	if (instance_number(parCreature) < 10 or lufulusWave_counter < 6)
		lufulusWave_counter++
}

delta_alarm(6, sec)