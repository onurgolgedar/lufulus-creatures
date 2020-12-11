/// @description After Death

death = false

global.comboExperience = 0
global.comboBaseExperience = 0
global.comboCount = 0
global.collectedExperience = 0

if (instance_exists(contWarzone))
	change_location(roomCastle_area, loc_hawmgrad)
else if (room == roomLufulus)
	change_location(roomCastle_area, loc_belingfur)
else
	change_location(room, global.locationName, 1)