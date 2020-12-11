delta_alarm(0, sec/10)
delta_alarm(1, sec*1.25)

if (quest_exists(objQuest_wisdom) and (room == roomCreature0 or room == roomCreature)
or quest_exists(objChallenge_wisdom) and room == roomCreature5)
	with (objLufulusWisdom)
		set_special_quest_target()

if (room == roomCave)
	beforeDefenseLock = global.defenseLock
else
	beforeDefenseLock = -1
	
if (room == roomCastle_area and quest_exists(objQuestRoad_scout2))
	fm_add(16)
	
broccoliQuest = is_quest_incomplete(objQuest_broccoli) and !instance_exists(contWaveSpawn) and global.level < 12