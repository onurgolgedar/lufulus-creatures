ai_set_aggressive()
name = (eng() ? "Bloody " : "Kanlı ")+creature_4
maxHp *= 1.15
physicalPower *= 0.8
hp = maxHp
spd += 1.7

follow_light(id, 0.85, 3.4)

if (is_quest_incomplete(objQuest_mineralCave))
	update_droplist(objBloodMineral, 0, -1, -1, 1000)
	
isQuestTarget_direct = true