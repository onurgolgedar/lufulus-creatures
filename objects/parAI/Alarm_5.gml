/// @description Main Alarm

if (scale_factor != 1) {
	if (scale_factor+0.03 < 1)
		scale_factor += 0.03
	else
		scale_factor = 1
}

if (!death) {
	var _targetPointDirection, dis_to_target
	if (target != pointer_null) {
		_targetPointDirection = point_direction(x, y, target.x, target.y)
		angleDiff =  abs(angle_difference(image_angle, _targetPointDirection))
		dis_to_target = point_distance(x, y, target.x, target.y)
	}
	else {
		_targetPointDirection = 0
		angleDiff =  180
		dis_to_target = 9999
	}

	var isFurious = abilityFury and furious
	
	activeRange = range
	activeAttackSpeed = attackSpeed/(1+0.5*isRanged)

	#region SPEED CALCULATION
	if (mode != md_attack)
		activeSpeed = spd
	else
		activeSpeed = spd
		/slowFactor
		/(1+isRanged*0.25)
		*(1+(!canSee or lakeBetween)*0.15)
		*(1+isFurious*0.5)
		*(1-1.5*(abilityTurtle and turtleMode))
		*(1+0.3*(abilitySoul and soulMode))
		*(1-0.33*(abilityShell and !body.destroyed))
		*(1-0.25*(abilityStrike and strikeMode))
		*(1+(stance == stEarthMove1)*0.8)
	#endregion

	#region EYE
	if ((mode == md_attack or isAggressive) and ai_can_see(target, angleDiff, dis_to_target)) {
		// Finding View Moment
		if (!canSee)
			alarm[10] = -1

		canSee = true
		
		var extendedRange = min(dis_to_target, activeRange+5)
		if (!lakeBetween) {
			if (pose != -1 and !freePoseMode) {
				targetPosX = target.x+lengthdir_x(extendedRange, myPose*60)
				targetPosY = target.y+lengthdir_y(extendedRange, myPose*60)
			}
			else {
				targetPosX = target.x
				targetPosY = target.y
			}
		}
		
		if (ai_lake_between(target, angleDiff, dis_to_target)) {
			targetPointDir = point_direction(x, y, pathFollower.x, pathFollower.y)
			posDir = targetPointDir
			targetPointInRange = point_distance(x, y, xLastSeen, yLastSeen) <= activeRange
			
			if (!lakeBetween) {
				ai_set_lastseen_point(target.x, target.y)
				ai_goto_lastseen_point()
			}
			
			lakeBetween = true
		}
		else {
			lakeBetween = false
			
			targetPointDir = _targetPointDirection
			posDir = point_direction(x, y, targetPosX, targetPosY)
			targetPointInRange = dis_to_target <= extendedRange
		}
	}
	else {
		// Losing View Moment
		if (canSee and target != pointer_null) {
			if (!stunned) {
				physics_apply_impulse(x, y, lengthdir_x(dashPower*forceFactor, targetPointDir),
				lengthdir_y(dashPower*forceFactor, targetPointDir))
			}
		
			ai_set_lastseen_point(target.x, target.y)
			ai_goto_lastseen_point()
		}
		
		canSee = false
		
		targetPointDir = point_direction(x, y, pathFollower.x, pathFollower.y)//point_direction(x, y, xLastSeen, yLastSeen)
		posDir = targetPointDir
		targetPointInRange = point_distance(x, y, xLastSeen, yLastSeen) <= activeRange//point_distance(x, y, xLastSeen, yLastSeen) <= range
	}
	#endregion

	// Is it searching for the target known?
	isSearching = !canSee and target != pointer_null and pathFollower.pathEnd
	directionLast += isSearching*searchingRotation*targetPointInRange*searchingSpeed

	#region MOVES
	var ds_size = ds_list_size(moves)
	for (var moveIndex = 0; moveIndex < ds_size; moveIndex++) {
		var move = ds_list_find_value(moves, moveIndex)
		
		#region MOVE STRIKE
		#region MOVE STRIKE BEGIN
		if (move == move_strike_begin) {
			if (ai_has_basic_conditions() and rigidbody_isonbase() and !lakeBetween) {
				ds_list_delete(moves, moveIndex)
				moveIndex--
				
				healthBar_blend = c_fuchsia
				slide_text(x, y, eng() ? "strike" : "atıl", c_nicepurple, false, true)
		
				rigidbody_set_definedstance(stStrikeMode)
				strikeMode = true
				strikeDis = irandom_range(220, 260)
				strikeCharge_alpha = 1
			
				ds_list_add(moves, move_strike)
		
				if (abilityFury)
					fury_change(-33)
			}
		}
		#endregion
		
		#region MOVE STRIKE MAIN
		else if (move == move_strike) {
			if (strikePoints < 50) {
				if (ai_has_basic_conditions() and !strikeMove
				and (strikePoints < 25 or point_distance(x, y, target.x, target.y) < strikeDis or point_distance(x, y, target.x, target.y) > strikeDis*2)) {
					ds_list_delete(moves, moveIndex)
					moveIndex--
				
					var addAngle = random_range(-7, 7)
					
					physics_apply_impulse(x, y,
					lengthdir_x(speedFactor*strikePower*forceFactor, targetPointDir+addAngle),
					lengthdir_y(speedFactor*strikePower*forceFactor, targetPointDir+addAngle))
					
					strikeMove = 8 // Move duration
					strike_change(-100)
					
					rigidbody_set_baBase()
				}
			}
		}
		#endregion
		#endregion
		
		#region MOVE TURTLE
		else if (move == move_turtle) {
			if (ai_has_basic_conditions() and rigidbody_isonbase()) {
				ds_list_delete(moves, moveIndex)
				moveIndex--
				
				healthBar_blend = c_fuchsia
				slide_text(x, y, eng() ? "defense" : "savunma", c_nicepurple, false, true)
		
				turtleMode = true
				rigidbody_set_definedstance(stTurtleMode)
			}
		}
		#endregion
		
		#region MOVE SLOW STONE
		else if (move == move_slowstone) {
			if (ai_has_basic_conditions() and rigidbody_isonbase()) {
				ds_list_delete(moves, moveIndex)
				moveIndex--
				
				healthBar_blend = c_fuchsia
				slide_text(x, y, eng() ? "stone" : "taş", c_nicepurple, false, true)
		
				animationController = instance_create(0, 0, animSlowStoneMove_rb2)
				animationController.owner = id
			    with (animationController)
			        event_perform(ev_other, ev_user0)
			
				slowStoneMove = true
				slowStonePoints = 0
			}
		}
		#endregion
		
		#region MOVE SPRAY POISON
		else if (move == move_sprayPoison) {
			if (ai_has_basic_conditions() and rigidbody_isonbase()) {
				ds_list_delete(moves, moveIndex)
				moveIndex--
			
				poisonPoints = 0
				
				healthBar_blend = c_fuchsia
				slide_text(x, y, eng() ? "poison" : "zehir", c_nicepurple, false, true)
			
				repeat (1+boss) {
					var poisonObject = instance_create_layer(x, y, "lyBelowPlayer", objPoison_SO)
					poisonObject.owner = id
					poisonObject.duration = poisonDuration
					poisonObject.damage = poisonDamage
					poisonObject.target = target
					poisonObject.image_index = poisonIndex
			
					with (poisonObject) {
						var addAngle = irandom_range(-25, 25)
						var impulsePower = irandom_range(5, 13)
				
						physics_apply_impulse(phy_com_x, phy_com_y, lengthdir_x(impulsePower, other.targetPointDir+addAngle),
						lengthdir_y(impulsePower, other.targetPointDir+addAngle))
					}
				}
			}
		}
		#endregion
		
		#region MOVE EARTHMOVE
		#region MOVE EARTHMOVE READY
		else if (move == move_earthmove_1) {
			if (ai_has_basic_conditions() and rigidbody_isonbase()) {
				ds_list_delete(moves, moveIndex)
				moveIndex--	
				
				healthBar_blend = c_fuchsia
				slide_text(x, y, eng() ? "earth" : "toprak", c_nicepurple, false, true)
			
				ds_list_add(moves, move_earthmove_2)
				rigidbody_set_definedstance(stEarthMove1)
			}
		}
		#endregion
		
		#region MOVE EARTHMOVE TRIGGERED
		else if (move == move_earthmove_2) {
			if (ai_has_basic_conditions() and (earthMovePoints < 10 or point_distance(x, y, target.x, target.y) < 150)) {
				ds_list_delete(moves, moveIndex)
				moveIndex--	
			
				earthMovePoints = 100
			
				var earthMove_SO = instance_create_layer(x, y, "lyFloor", objEarthMove_SO)
				earthMove_SO.alarm[0] = sec*0.75
				earthMove_SO.maxTime = earthMove_SO.alarm[0]
				earthMove_SO.owner = id
			
				stop_moving(sec*0.75)
			
				animationController = instance_create(0, 0, animEarthMove_rb2)
				animationController.owner = id
			    with (animationController)
			        event_perform(ev_other, ev_user0)
			}
		}
		#endregion
		#endregion
		
		#region MOVE BASIC HEAL
		else if (move == move_basicHeal) {
			if (ai_has_basic_conditions() and rigidbody_isonbase()) {
				ds_list_delete(moves, moveIndex)
				moveIndex--
				
				slide_text(x, y, eng() ? "heal" : "tedavi", c_nicepurple, false, true)
				healthBar_blend = c_aqua
				
				animationController = instance_create(0, 0, animBasicHealMove_rb2)
				animationController.owner = id
			    with (animationController)
			        event_perform(ev_other, ev_user0)
			}
		}
		#endregion
		
		#region MOVE PULL
		else if (move == move_pull) {
			if (ai_has_basic_conditions() and rigidbody_isonbase() and (dis_to_target > 500 or pullPower > 30) and dis_to_target > 150) {
				ds_list_delete(moves, moveIndex)
				moveIndex--
				
				healthBar_blend = c_fuchsia
				slide_text(x, y, eng() ? "pull" : "çekim", c_nicepurple, false, true)
				
				animationController = instance_create(0, 0, animPullMove_rb2)
				animationController.owner = id
			    with (animationController)
			        event_perform(ev_other, ev_user0)
			}
		}
		#endregion
		
		#region MOVE BRAIN ATTACK
		else if (move == move_brainAttack) {
			if (ai_has_basic_conditions() and rigidbody_isonbase()) {
				ds_list_delete(moves, moveIndex)
				moveIndex--
				
				//slide_text(x, y, eng() ? "brain" : "beyin", c_nicepurple, false, true)
				healthBar_blend = c_fuchsia
				
				animationController = instance_create(0, 0, animBrainAttack_rb2)
				animationController.owner = id
			    with (animationController)
			        event_perform(ev_other, ev_user0)
			}
		}
		#endregion
		
		#region MOVE BASIC ATTACK
		else if (move == move_basicAttack) {
			if ((targetPointInRange or extraBasicTry
			or (isRanged and canSee and dis_to_target < activeRange*1.5)) // ?
			and (rigidbodyType == 2 or weapon != pointer_null)
			and ai_has_basic_conditions() and rigidbody_isonbase()) {
				ds_list_delete(moves, moveIndex)
				moveIndex--	
				
				if (!isRanged) {
					if (canSee)
						stop_moving(sec/7)

					if (rigidbodyType == 2)
						animationController = instance_create(0, 0, animBasicAttackNormal_rb2)
					else
						animationController = instance_create(0, 0, animOneHandedSword_ba)
					animationController.owner = id
					with (animationController)
					    event_perform(ev_other, ev_user0)
	
					var addDir = irandom_range(-extraBasicTry*9, extraBasicTry*9)
					var wrongSide = extraBasicTry*choose(-60, 60, 0, 0, 0)
					
					if (target.phy_speed > 2*60/room_speed or irandom(3) == 0) {
						var randomStrike = target.phy_speed <= 2*60/room_speed
						physics_apply_impulse(x, y,
						speedFactor*lengthdir_x(dashPower*(1+extraBasicTry*0.25+(wrongSide > 0)*0.12+randomStrike*0.2)*forceFactor, targetPointDir+addDir+wrongSide),
						speedFactor*lengthdir_y(dashPower*(1+extraBasicTry*0.25+(wrongSide > 0)*0.12+randomStrike*0.2)*forceFactor, targetPointDir+addDir+wrongSide))
					}
				}
				else {
					if (rigidbodyType == 2)
						animationController = instance_create(0, 0, animCreatureBasicMagic_rb2)
					else {
						animationController = instance_create(0, 0, animCrossbow_ba)
						
						var weaponControl = -1
						with (objCrossbowControl)
							if (owner == other.id)
								weaponControl = id
		
						if (weaponControl != -1) {
					        weaponControl.alarm[0] = 1
					        weaponControl.springTension = 0
		
							sound_play_at(choose(sndBow2, sndBow2/*sndBow*/, sndBow2, sndBow3), x, y, false)
							#region Arrow Creation
					        var arrow = instance_create_layer(weaponControl.arrowX, weaponControl.arrowY, "lyBelowPlayer", objArrow)
					        arrow.depth += 5
							arrow.phy_rotation = -image_angle+irandom_range(-precisionError/2, precisionError/2)
		
							var arrowSpd = 49
							arrow.phy_speed_x = (lengthdir_x(arrowSpd, -arrow.phy_rotation)+phy_speed_x/2)*delta()
					        arrow.phy_speed_y = (lengthdir_y(arrowSpd, -arrow.phy_rotation)+phy_speed_y/2)*delta()
		
							arrow.owner = id
							arrow.target = target
							#endregion
						}
					}
					
					animationController.owner = id
					with (animationController)
						event_perform(ev_other, ev_user0)
					
					if (canSee)
						stop_moving(sec/3)
					
					if (irandom(1) == 0 or
					(target != pointer_null and point_distance(x, y, target.x, target.y) < activeRange/2)) {
						var addDir = irandom_range(-extraBasicTry*9, extraBasicTry*9)
						var wrongSide = extraBasicTry*choose(-60, 60, 0, 0, 0)
						var leftRight = choose(90, -90)
						
						physics_apply_impulse(x, y,
						speedFactor*lengthdir_x(dashPower*(1+extraBasicTry*0.25+(wrongSide > 0)*0.12)*forceFactor, targetPointDir+addDir+wrongSide+leftRight),
						speedFactor*lengthdir_y(dashPower*(1+extraBasicTry*0.25+(wrongSide > 0)*0.12)*forceFactor, targetPointDir+addDir+wrongSide+leftRight))
					}
					
					if (extraBasicTry)
						ds_list_add(moves, move_basicAttack)
				}
				
				extraBasicTry = false
				attacktimer_set_max()
			} 
		}
		#endregion
	}
	#endregion
}

delta_alarm(5, 8+IS_MOBILE-global.performanceMode)