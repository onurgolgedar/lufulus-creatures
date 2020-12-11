event_inherited()

alarm[3] = 2

quest_progress(objQuest_wisdom, 1)

if (room == roomCreature5)
	quest_progress(objChallenge_wisdom, 1)

with (parCreature)
	if (!boss and target == objPlayer.id)
		ai_target_destroy(true)
	
if (room != roomLufulus)
	with (objBrainAttack)
		instance_destroy()
		
global.statPoints += 2
global.virtual_stat_points += 2

save_stats(global.saveNo)
global.anticheat_stats = recalculate_sha_stats()

if (!global.isCheated and !steam_get_achievement("wisdom_war"))
	steam_set_achievement("wisdom_war")