function recalculate_sha_all() {
	global.anticheat_adds = recalculate_sha_adds()
	global.anticheat_stats = recalculate_sha_stats()
	global.anticheat_skillPoints = recalculate_sha_skillPoints()
	global.anticheat_resultValues = recalculate_sha_resultValues()
	global.anticheat_hour = recalculate_sha_time()
	global.anticheat_ownings = recalculate_sha_ownings()
	global.anticheat_game_score = recalculate_sha_game_score()


}
