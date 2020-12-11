/// @param room
function room_get_level() {

	if (argument[0] == roomCreature0)
		return 1
	else if (argument[0] == roomCreature)
		return 2
	else if (argument[0] == roomCreature2)
		return 3
	else if (argument[0] == roomCreature3)
		return 5
	else if (argument[0] == roomCreature4)
		return 6
	else if (argument[0] == roomCreature5)
		return 9
	else if (argument[0] == roomCreature6)
		return 12
	else if (argument[0] == roomCreature7)
		return 14
	else if (argument[0] == roomCreature8)
		return 16
	else if (argument[0] == roomCreature9)
		return 18
	else if (argument[0] == roomCreature10)
		return 20
	else if (argument[0] == roomWave)
		return 4
	else if (argument[0] == roomWave2)
		return 11
	else if (argument[0] == roomWave3)
		return 16
	else if (argument[0] == roomWave4)
		return 19
	else if (argument[0] == roomCastle2_area)
		return 17
	else if (argument[0] == roomLufulus)
		return 25
	else
		return 1


}
