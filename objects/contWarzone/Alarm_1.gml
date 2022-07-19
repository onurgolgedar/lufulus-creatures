var enemyCount = 0
with (parAi)
	enemyCount += teamNo == team_enemy
	
if (enemyCount > 0) {
	var randomEnemy = irandom(enemyCount-1)

	var enemyCounter = 0
	with (parAi) {
		if (teamNo == team_enemy) {
			if (enemyCounter == randomEnemy) {
				if (ai_reaction(objPlayer.id, true))
					targetLock = max(targetLock, 50)
				break
			}
			
			enemyCounter++
		}
	}
}

delta_alarm(1, 1.5*sec)