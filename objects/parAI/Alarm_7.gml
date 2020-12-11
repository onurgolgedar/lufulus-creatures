/// @description Loop Never Stops

if (!death) {
	if (room != roomForceFactorTest) {
		speedFactor = (boss or isLeader_hard) ? 1 : random_range(0.9, 1.1)

		var randomVar = irandom(4)

		if (!stunned and rigidbody_isonbase() and anim_end()) {	
			if (rigidbodyType == 2) {
				if (randomVar == 0)
					rigidbody_set_definedstance(stBase)
				else if (randomVar == 1)
					rigidbody_set_definedstance(stBase2)
				else if (randomVar == 2)
					rigidbody_set_definedstance(stBase3)
			}
	
			if (randomVar == 3)
				extraBasicTry = true and mode == md_attack
		}

		if (mode == md_attack) {
			/*if (!canSee and (boss or combatExperience >= 75)) {
				ai_set_lastseen_point(target.x, target.y)
				ai_goto_lastseen_point()
			}*/
	
			if (combatExperience < 80/* and hp < maxHp/5*4*/ and !stopMoving and pathFollower.pathEnd) {
				var rnd = irandom(3+ceil(combatExperience/10+hp/maxHp*6))
	
				if (rnd == 0 and combatExperience < 55)
					stop_moving(sec*(1.5-combatExperience+(randomVar == 0)*0.33))
				else if (rnd == 1) {
					stop_moving(sec/2)
		
					physics_apply_impulse(x, y,
					speedFactor*lengthdir_x(dashPower*forceFactor/1.5, targetPointDir+180),
					speedFactor*lengthdir_y(dashPower*forceFactor/1.5, targetPointDir+180))
				}
			}
		}
		else {
			if (hp < maxHp)
				change_hp(maxHp/20)
	
			if (isProtector and instance_exists(protection_owner) and !protection_owner.death) {
				if (!stunned and point_distance(x, y, protection_owner.x, protection_owner.y) > 330 and point_distance(protector_posX, protector_posY, protection_owner.x, protection_owner.y) > 250) {
					repeat(7) {
						var dir = point_direction(x, y, protection_owner.x, protection_owner.y)+irandom_range(-80, 80)
						var dis = irandom_range(100, 250)
		
						var posX = protection_owner.x+lengthdir_x(dis, dir)
						var posY = protection_owner.y+lengthdir_y(dis, dir)
		
						if (!collision_line(protection_owner.x, protection_owner.y, posX, posY, parSolid, false, false) and !position_meeting(posX, posY, parTarget)) {
							protector_posX = posX
							protector_posY = posY
						}
						else
							continue
		
						ai_set_lastseen_point(protector_posX, protector_posY)
						ai_goto_lastseen_point()
						break
					}
				}
			}
			else {
				if (lastPathNo == -1) {
					if (type != type_npc) {
						if (irandom(3) == 0)
							speedFactor = 0
						else if (speedFactor != 0 or irandom(3) == 0)
							speedFactor = choose(0.8, 1.2, 1)
					}
				
					if (isProtector) {
						isProtector = false
						protector_posX = 0
						protector_posY = 0
						protection_owner = pointer_null
					}
				}
			}
		}

		if (subtype == stype_gorkrim and randomVar == 2) {
			isRanged = !isRanged
			if (!isRanged) {
				range = rangeMelee
				activeRange = range
		
				alarm[6] = 1
			}
			else
				ai_delete_mypose()
		}

		if (isRanged) {
			range = range_base*random_range(0.9, 1.1)
			activeRange = range
		}

		if (irandom(2) != 0 and targetLock == 1)
			targetLock = 0
	
		ds_list_clear(targetsPotential)
		ds_list_clear(targetsPotential_points)

		if (!stunned and mode == md_attack) {
			with (parTarget) {
				var distance = point_distance(x, y, other.x, other.y)
				if (distance < (other.activeRange+120+other.isRanged*180)*(1.2+1.2*(object_index == objPlayer))
				and id != other.id and object_index != objLufulusWisdom) {
					var isAlly = ai_protectors_exists(other.id)
		
					if (!isAlly) {
						ds_list_add(other.targetsPotential, id)
		
						var vitalityPoints = -clamp(abs(hp/other.physicalPower), 0, 5)
						var armorPoints = -armor/10
						var resistancePoints = -resistance/15
						var distancePoints = -distance/35
						var playerPoints = (object_index == objPlayer)
						var bossPoints = -boss*3
						var enemyPoints = (target == other.id)*2
						var powerPoints = -clamp(abs(other.hp/physicalPower), 0, 5)
						var randomPoints = (randomVar == 0)*irandom(2)
						var specialPoints = -1.5*(object_index == objLufulusWisdom)
		
						var totalPoints = vitalityPoints+armorPoints+resistancePoints
						+distancePoints+playerPoints+enemyPoints+powerPoints+randomPoints+bossPoints+specialPoints
		
						ds_list_add(other.targetsPotential_points, totalPoints)
					}
				}
			}
	
			if (randomVar == 0)
				ai_set_target_auto()
	
			// ? Can be ignored for optimization
			//ai_protectors_attention()
		}

		if ((mode == md_calm or mode == md_waiting) and type != type_npc) {
			if (!stunned and point_distance(x, y, startX, startY) > roamRange or !is_in_view(x, y) or !is_in_room())
				roamRotation = point_direction(x, y, startX, startY)+irandom_range(-9, 9)
			else {
				if (leader == pointer_null)
					roamRotation = irandom(359)
				else
					roamRotation = leader.roamRotation+irandom_range(-6, 6)
			}
	
			delta_alarm(7, 1.9*sec+irandom(sec/2)+!inView*0.2*sec-(global.performanceMode-IS_MOBILE)*0.2*sec)
		}
		else {
			delta_alarm(7, 0.7*sec+irandom(sec/4)+!inView*0.1*sec-(global.performanceMode-IS_MOBILE)*0.1*sec)
	
			if (!stunned and lakeBetween and canSee) {
				ai_set_lastseen_point(target.x, target.y)
				ai_goto_lastseen_point()
			}
		}
	}
	else {
		spd = 0.9
		speedFactor = 1
		delta_alarm(7, sec/2)
	
		if (abs(phy_speed-activeSpeed) < 0.004)
			show_message(name+", force factor: "+string(forceFactor))
		
		forceFactor += phy_mass/7
	}
}