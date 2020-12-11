function ai_set_aggressive() {
	if (!isAggressive) {
		mode = md_waiting
		isAggressive = true
		roamRange /= 2

		sight_light(id)
	}


}
