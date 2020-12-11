if (!death) {
	if (stopMoving) {
		var dt = delta()
		
		if (stopMovingTimer-dt <= 0) {
			stopMovingTimer = 0
			stopMoving = false
		}
		else
			stopMovingTimer -= dt
	}
}