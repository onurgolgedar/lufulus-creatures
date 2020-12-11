name = loc_spawn0
roomIndex = roomCreature0
cost = 0

isBig = false
point_index = 0

level = room_get_level(roomIndex)
addCondition_text = ""
unlocked = global.level >= level

event_inherited()

description = eng() ? "Spawn Area" : "Yaratık Bölgesi"