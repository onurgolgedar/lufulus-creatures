// Extra awards

if (!isFailure) {
	global.statPoints += statPoints
	global.virtual_stat_points += statPoints
	global.skillPoints += skillPoints
	save_stats(global.saveNo)
	save_skills(global.saveNo)

	global.anticheat_stats = recalculate_sha_stats()
	global.anticheat_skillPoints = recalculate_sha_skillPoints()
}
	
event_inherited()