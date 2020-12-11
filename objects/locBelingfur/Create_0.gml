name = loc_belingfur
roomIndex = roomCastle2_area
cost = 0

isBig = true
point_index = 0

level = room_get_level(roomIndex)
addCondition_text = ""
unlocked = global.level >= level
	
event_inherited()
symbol = sprBelingfur

description = ""

hasChoices = false // old: true
#region Question Init
qKey = 0

targetAngle = image_angle
#endregion