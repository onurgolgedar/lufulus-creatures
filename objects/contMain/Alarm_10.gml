with(parTarget) {
	var mainOther = id
	with (parTarget) {
		if (inView and isAggressive and target == pointer_null and teamNo != mainOther.teamNo
		and (mainOther.type == type_player or object_get_parent(mainOther.object_index) == object_get_parent(object_index))) {
			var dis = point_distance(x, y, mainOther.x, mainOther.y)
			var angleDiff = abs(angle_difference(image_angle, point_direction(x, y, mainOther.x, mainOther.y)))
		
			if (ai_can_see(mainOther, angleDiff, dis) and dis < 488 and angleDiff < 46 or dis < 120)
				ai_reaction(mainOther, true)
			else
				target = pointer_null
		}
	}
}

delta_alarm(10, sec/(3+(global.performanceMode > 1)))