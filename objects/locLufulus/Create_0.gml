name = loc_lufulus
roomIndex = roomLufulus
cost = 0

isBig = true
point_index = 4

level = room_get_level(roomIndex)
addCondition_text = ""
unlocked = global.level >= level

event_inherited()

description = eng() ? "Lufulus' Area" : "Lufulus'un Bölgesi"

symbol = -1