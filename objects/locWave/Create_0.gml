name = loc_wave1
roomIndex = roomWave
cost = 0

isBig = false
point_index = 1

level = room_get_level(roomIndex)
addCondition_text = ""
unlocked = global.level >= level

event_inherited()

description = eng() ? "Wave Area" : "Dalga Bölgesi"