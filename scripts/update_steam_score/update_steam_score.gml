function update_steam_score() {
	with (contMain) {
		var finishedChallenges_count = check_finished_challenges(-1, true)
		recalculate_game_score(finishedChallenges_count)
	
		steam_leaderboard_upload_id = steam_upload_score_ext(steam_leaderboard_name, global.game_score, global.game_score < 0)
	}


}
