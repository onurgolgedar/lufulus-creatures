wave_no = 0
wave_cycle = 1
wave_started = false
areAllWavesFinished = false

experienceGiven = 0

if (room == roomCastle_area) {
	c_normal_1 = objC0
	c_normal_1_darkChance = 0
	c_normal_2 = objC1
	c_normal_2_darkChance = 0
	c_normal_3 = objC2
	c_normal_3_darkChance = 0
	
	c_ranged_1 = objC0
	c_ranged_2 = objC1
	
	c_hard_1 = objC2
	c_hard_1_isLeader = true
	
	c_hard_2 = objC3
	c_hard_2_isLeader = true
	
	c_hardest = objCW1
	
	wave_maxNo = 4
	
	level = loc_level_wave1
}
if (room == roomWave) {
	c_normal_1 = objC0
	c_normal_1_darkChance = 0
	c_normal_2 = objC1
	c_normal_2_darkChance = 0
	c_normal_3 = objC2
	c_normal_3_darkChance = 0
	
	c_ranged_1 = objC0
	c_ranged_2 = objC1
	
	c_hard_1 = objC2
	c_hard_1_isLeader = true
	
	c_hard_2 = objC3
	c_hard_2_isLeader = true
	
	c_hardest = objCW1
	
	wave_maxNo = 4
	
	level = loc_level_wave1
}
else if (room == roomWave2) {	
	c_normal_1 = objC1
	c_normal_1_darkChance = 5
	c_normal_2 = objC2
	c_normal_2_darkChance = 2
	c_normal_3 = objC4
	c_normal_3_darkChance = 0
	
	c_ranged_1 = objC1
	c_ranged_2 = objC0
	
	c_hard_1 = objC4
	c_hard_1_isLeader = true
	
	c_hard_2 = objC5
	c_hard_2_isLeader = true
	
	c_hardest = objCW2
	
	wave_maxNo = 5
	
	level = loc_level_wave2
}
else if (room == roomWave3) {
	
	c_normal_1 = objC2
	c_normal_1_darkChance = 5
	c_normal_2 = objC4
	c_normal_2_darkChance = 0
	c_normal_3 = objC5
	c_normal_3_darkChance = 0
	
	c_ranged_1 = objC3
	c_ranged_2 = objC3
	
	c_hard_1 = objC6
	c_hard_1_isLeader = true
	
	c_hard_2 = objCA1
	c_hard_2_isLeader = true
	
	c_hardest = objCW3
	
	wave_maxNo = 6
	
	level = loc_level_wave3
}
else if (room == roomWave4) {
	c_normal_1 = objCG1
	c_normal_1_darkChance = 0
	c_normal_2 = objCG2
	c_normal_2_darkChance = 0
	c_normal_3 = objC8
	c_normal_3_darkChance = 0
	
	c_ranged_1 = objC3
	c_ranged_2 = objC6
	
	c_hard_1 = objCG2
	c_hard_1_isLeader = false
	
	c_hard_2 = objC8
	c_hard_2_isLeader = true
	
	c_hardest = objCW4
	
	wave_maxNo = 6
	
	level = loc_level_wave4
}
else if (room == roomLufulus) {
	c_normal_1 = objC7
	c_normal_1_darkChance = 0
	c_normal_2 = objCG2
	c_normal_2_darkChance = 0
	c_normal_3 = objC7
	c_normal_3_darkChance = 0
	
	c_ranged_1 = objCA1
	c_ranged_2 = objC11
	
	c_hard_1 = objC12
	c_hard_1_isLeader = false
	
	c_hard_2 = objC13
	c_hard_2_isLeader = true
	
	c_hardest = objB2
	
	wave_maxNo = 6
	
	level = 25
}

//lufulusRoom_creatureCount = 0
lufulusWave_counter = false
isBreak = false
mouseOn = false
tW = 0
tH = 0
questionBox = pointer_null
blacksmithQuest_exists = is_quest_incomplete(objQuest_blacksmith)
blacksmithQuest_dropped = false
radius = floor(room_width/2*1.03)
isDestroyedMap = ds_list_find_index(global.destroyedMaps, room) != -1
global_tab = false

alarm[3] = 2
delta_alarm(5, sec/3)
if (room == roomLufulus)
	delta_alarm(6, sec)