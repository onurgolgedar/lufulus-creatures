function ai_set_target_auto() {
	var ds_size = ds_list_size(targetsPotential)
	var chosenTarget = pointer_null
	var chosenTarget_points = -9999
	for (var i = 0; i < ds_size; i++) {
		var targetPotential_points = ds_list_find_value(targetsPotential_points, i)
	
		if (targetPotential_points > chosenTarget_points) {
			var targetPotential = ds_list_find_value(targetsPotential, i) 
			if (instance_exists(targetPotential) and !targetPotential.death) {
				if ((target == pointer_null or target != targetPotential.target)
				and (!(teamNo == team_neutralFriend and targetPotential.teamNo == team_player) and (targetPotential.mode == md_attack or targetPotential.object_index == objPlayer))
				and ((targetPotential.target != pointer_null and ai_protectors_exists(targetPotential.target)) or targetPotential.object_index == objPlayer) and !ai_protectors_exists(targetPotential)) {
					var isFriend = false
					with (targetPotential)
						isFriend = ai_protectors_exists(other.id)
				
					if (!isFriend) {
						chosenTarget = targetPotential
						chosenTarget_points = targetPotential_points
					}
				}
			}
		}
	}

	if (chosenTarget != pointer_null)
		ai_reaction(chosenTarget)
	
	// ? New
	else {
		if (target == pointer_null and isAggressive) {
			var nearestEnemy = pointer_null
			var nearestDistance = 99999
			with (parTarget) {
				if (!death and teamNo != -1 and other.teamNo != -1
				and (object_index != objLufulusWisdom or other.type != type_player)
				and teamNo != other.teamNo
				and !(other.teamNo == team_neutralFriend and teamNo == team_player)
				and ai_can_see(other.id, 0, 0)) {
					var dis = point_distance(x, y, other.x, other.y)
					if (dis < nearestDistance) {
						nearestEnemy = id
						nearestDistance = dis
					}
				}
			}
	
			if (nearestEnemy != pointer_null)
				ai_reaction(nearestEnemy)
		}
	}


}
