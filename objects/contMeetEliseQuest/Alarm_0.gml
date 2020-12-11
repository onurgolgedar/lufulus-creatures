if (quest_exists(objQuest_meetElise)) {
	with (objPlayer) {
		var elise = target_spawn_protectors(objElise_npc, 300)
		elise.isExlMarkActive = false
		elise.mode = md_calm
		elise.teamNo = team_player
	}
		
	delta_alarm(1, 2*sec)
	
	drawCircle = true
}