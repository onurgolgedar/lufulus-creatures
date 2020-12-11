event_inherited()

if (!death) {
	var stopTurning = abilityEarthMove and stance == stEarthMove2
	var dis_to_target = target == pointer_null ? 9999 : point_distance(x, y, target.x, target.y)
	
	activeRange = range
	
	#region BASIC MOVEMENT/TURNING
	if (mode == md_attack) {
		var boostedActiveSpeed = activeSpeed
		#region SPEED BOOSTS
		if (dis_to_target > (5-isRanged*2)*activeRange)
			boostedActiveSpeed *= 1.2
		else
			boostedActiveSpeed *= 0.88+0.12*(myPose != -1)
		#endregion
		
		if (type == type_npc and weapon == pointer_null)
			boostedActiveSpeed *= -0.33

		#region MOVING/TURNING
		if (!stunned) {
			if (isSearching) {
				turn(directionLast, 40)
				activeSpeed = spd
				boostedActiveSpeed = activeSpeed
			}
			else if (!stopTurning) {
				if (pathFollower.pathEnd)
					turn(targetPointDir, 40)
				else if (point_distance(x, y, pathFollower.x, pathFollower.y) > 60)
					turn(targetPointDir, 50)
				else 
					turn(targetPointDir, 30)
			}
		
			// Main movement
			if (!(abilityStrike and strikeMove) and !stopMoving and phy_speed < abs(boostedActiveSpeed)*60/room_speed) {
				if (!isRanged) {
					if (!targetPointInRange)
						physics_apply_force(phy_com_x, phy_com_y,
						speedFactor*forceFactor*lengthdir_x(boostedActiveSpeed, posDir),
						speedFactor*forceFactor*lengthdir_y(boostedActiveSpeed, posDir))
					else if (myPose != -1)
						physics_apply_force(phy_com_x, phy_com_y,
						speedFactor*forceFactor*lengthdir_x(boostedActiveSpeed, posDir)/4,
						speedFactor*forceFactor*lengthdir_y(boostedActiveSpeed, posDir)/4)
				}
				else {
					if (target != pointer_null) { // ?
						if (dis_to_target > activeRange*3/2 or !canSee)
							physics_apply_force(phy_com_x, phy_com_y, speedFactor*forceFactor*lengthdir_x(boostedActiveSpeed, posDir),
							speedFactor*forceFactor*lengthdir_y(boostedActiveSpeed, posDir))
						else if (dis_to_target < activeRange/(2-isRanged*superDistance))
							physics_apply_force(phy_com_x, phy_com_y, speedFactor*forceFactor*lengthdir_x(boostedActiveSpeed, targetPointDir+180),
							speedFactor*forceFactor*lengthdir_y(boostedActiveSpeed, targetPointDir+180))
					}
				}
			}
		}
		#endregion
	}
	else if (mode == md_calm or mode == md_waiting) {
		if (!stunned and !stopMoving) {
			if (speedFactor != 0) {
				if (type != type_npc) {
					boostedActiveSpeed = 0.8/(1+(mode == md_waiting))
	
					#region CALM ROAM
					if (inView)
						turn(roamRotation, 25)
			
					physics_apply_force(phy_com_x, phy_com_y, speedFactor*forceFactor*lengthdir_x(boostedActiveSpeed, roamRotation),
					speedFactor*forceFactor*lengthdir_y(boostedActiveSpeed, roamRotation))
					#endregion
				}
				else if (point_distance(x, y, pathFollower.x, pathFollower.y) > 10) {
					turn(posDir, 12)
		
					boostedActiveSpeed = spd+min(point_distance(x, y, pathFollower.x, pathFollower.y)/80, 3)
		
					physics_apply_force(phy_com_x, phy_com_y, speedFactor*forceFactor*lengthdir_x(boostedActiveSpeed, posDir),
					speedFactor*forceFactor*lengthdir_y(boostedActiveSpeed, posDir))
				}
			}
		}
	}
	#endregion
	
	#region Strike ability control (after triggered)
	if (abilityStrike and strikeMove > 0) {
		if (phy_speed < 0.7*60/room_speed)
			strikeMove = 0
			// ? place_meeting
		if (target != pointer_null and
		(physics_test_overlap(phy_position_x, phy_position_y, phy_rotation, target) or place_meeting(phy_position_x, phy_position_y, target))) {
			strikeMove = 0
		
			with (target) {
				add_effectbox(efboxStun, -1, 9/25*sec)
				
				var damage = other.physicalPower
				attacked(damage, other.id, false)
			}
		}
	}
	#endregion
		
	#region Basic attack control
	if (attackTimer > 0) {
		if (!stunned)
			attackTimer -= delta()

		if (attackTimer <= 0) {
			ds_list_add(moves, move_basicAttack)
			attackTimer = 0
		}
	}
	#endregion
}
else {
	if (!is_in_room()) {
		var dirToCenter = point_direction(phy_com_x, phy_com_y, room_width/2, room_height/2)
		physics_apply_force(phy_com_x, phy_com_y, forceFactor*lengthdir_x(4, dirToCenter),
		forceFactor*lengthdir_y(4, dirToCenter))
	}
}