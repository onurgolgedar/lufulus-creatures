/// @description hp <= 0

if (!abilitySoul or soulMode)
	death = true

var ds_size = ai_protectors_size()
if (ds_size != 0) {
	for (var i = 0; i < ds_size; i++)
		with (ai_protectors_get(i))
			ai_protectors_remove(other.id)
			
	if (isLeader) {
		var newLeader = ai_protectors_get(irandom(ds_size-1))
			
		for (var i = 0; i < ds_size; i++)
			with (ai_protectors_get(i)) {
				if (id != newLeader)
					leader = newLeader
				else {
					isLeader = true
					leadColor = other.leadColor
					leader = pointer_null
				}
			}
				
		ai_protectors_clear()
	}
}

// Clear the all moves
ai_moves_clear()
ai_reset_passives()
extraBasicTry = false
attacktimer_set_max()
if (animationController != pointer_null)
	instance_destroy(animationController)
	
if (mode == md_attack)
	rigidbody_set_baBase()

#region "PLAYER KILLED IT" REWARDS
if (playerKilledMe and (!abilitySoul or !soulMode)) {
	if (boss and type != type_wisdom and !steam_get_achievement("boss_hunter"))
		steam_set_achievement("boss_hunter")
		
	if (object_index == objLufulus and !steam_get_achievement("lufulus"))
		steam_set_achievement("lufulus")
		
	if (level >= global.level+7 and !steam_get_achievement("courageous"))
		steam_set_achievement("courageous")
	
	/*var goldTaken_creature = ds_map_find_value(global.goldTaken_creature, object_get_name(object_index))
	if (goldTaken_creature == undefined)
		goldTaken_creature = 0*/
		
	var creatureScore = level*15*(1+isLeader_hard*1.25)*(1+3*boss)
	if (creatureScore > global.maxCreatureScore) {
		global.maxCreatureScore = creatureScore
		save_maxcreturescore(global.saveNo)
	}
	
	if (money > 0 and (boss or chance(6/*-min(floor(goldTaken_creature)/15, 6)*/, 10))) {
		var moneyCount = 1
			
		moneyCount += clamp(floor((global.performanceMode > 1)*money/(16+5*IS_MOBILE)), 0, 30-IS_MOBILE*5+boss*15+(object_index == objLufulus)*20)
		
		/*if (goldTaken_creature == 0)
			ds_map_set(global.goldTaken_creature, object_get_name(object_index), 0)
		ds_map_replace(global.goldTaken_creature, object_get_name(object_index), goldTaken_creature+1)*/
		
		var _dir = point_direction(objPlayer.x, objPlayer.y, x, y)
		repeat (moneyCount) {			
		    var moneyObj = instance_create(x+irandom_range(-10-moneyCount*3, 10+moneyCount*3), y+irandom_range(-10-moneyCount*3, 10+moneyCount*3), objCoin)
			with (moneyObj) {				
				if (other.at_from != pointer_null) {
					var _dir2 = _dir+irandom_range(-5, 5)
					var pow = random_range(1.3, 3)
					physics_apply_impulse(phy_com_x, phy_com_y, lengthdir_x(pow, _dir2), lengthdir_y(pow, _dir2))
				}
				
				value = ceil(other.money/moneyCount)
				
				var moneyScale = 0.9+min(value/70, 0.32)
				image_xscale *= moneyScale
				image_yscale *= moneyScale
			}
		}
	}
	
	var experienceReward = ceil(experience)
	global.collectedExperience += experienceReward
	
	if (global.performanceMode != 0) {
		change_exp(experienceReward)
		global.collectedExperience -= experienceReward
	}
	
	global.comboBaseExperience += experience/3
	global.comboCount++
	global.comboExperience = calculate_comboexperience()
	
	if (global.comboCount > 1) {
		//slide_text(x, y, "x"+string(global.comboCount), c_aqua, global.comboCount > 3)
		
		if (global.comboExperience > global.targetExperience/500) {
			#region SHOW EXP BAR
			contGUi.expBarAlpha = 1+min(global.comboCount*0.15, 0.6)
			delta_alarm(1, 1, contGUi)
			#endregion
		}
	}
		
	delta_alarm(5, 1.5*sec, contPlayer)
	
	/*if (global.level > 2 and global.level < 5 and global.sWeaponSprite == sprSw_000 and !item_exists(objSw_001) and instance_exists(contCreatureSpawn) and irandom(7) == 0)
		drop_item_direct(objSw_001, 1, -1, -1)*/
}
#endregion

if (extension_exists(ext_fearofdeath)) {
	with (parAi) {
		if (!boss and point_distance(x, y, other.x, other.y) < 400) {
			combatExperience = clamp(combatExperience-10, 0, 100)
		}
	}
}

try_bonus_object()

if (abilityEarthMove)
	with (objEarthMove_SO)
		if (owner == other.id)
			instance_destroy()
			
if (abilityBrainAttack)
	with (objBrainAttack)
		if (owner == other.id)
			instance_destroy()
			
if (abilityRofux)
	with (objRofux)
		if (owner == other.id)
			instance_destroy()
			
combatExperience = min(8, combatExperience)

if (death) {		
	// Real Death
	mask_index = sprDrop
	if (global.selectedTarget == id)
		global.selectedTarget = pointer_null
	
	if (abilitySoul and manaEffect_soul != pointer_null)
		destroy_effect(manaEffect_soul, 60)
		
	if (boss) {
		audio_stop_sound(sndMusicBoss)
		if (ds_list_find_index(global.takenBosses, object_get_name(object_index)) == -1)
			ds_list_add(global.takenBosses, object_get_name(object_index))
	}
		
	if (abilityShock)
		with (objShock_SO)
			if (owner == other.id)
				instance_destroy()
				
	with (efboxLaser)
		if (target == other.id or owner == other.id)
			instance_destroy()
		
	delta_alarm(3, sec/2, contPlayer) //handle_outfight()
					
	ai_delete_mypose()
	ai_target_destroy()
	
	with (parAi)
		if (target == other.id)
			ai_target_destroy()
	
	delta_alarm(9, (hasDropList and ds_list_size(droppedList) > 0)*300*sec+irandom_range(2*sec+1+(global.performanceMode-IS_MOBILE)*sec, 2.5*sec+(global.performanceMode-IS_MOBILE)*1.25*sec))
	
	// Alarm Deactivation
	alarm[7] = -1
	
	if (type != type_npc) {
		if (type == type_wisdom) {
			ds_list_add(global.destroyedMaps, level)
			save_general(global.saveNo)
		}
		
		if (rigidbodyParts != pointer_null/* and !(hasDropList and ds_list_size(droppedList) > 0)*/) {
			var ds_size = ds_list_size(rigidbodyParts)
			for (var rb = 0; rb < ds_size; rb++) {
				with (ds_list_find_value(rigidbodyParts, rb)) {
					if (breakable and
					((!other.playerKilledMe and irandom(2) == 0)
					or irandom(clamp(7+other.level-global.level, 3, 10)) == 0)) {
						if (joint != pointer_null) {
							physics_joint_delete(joint)
							joint = pointer_null
						}
						
						if (irandom(0) == 0 and (other.rigidbodyType != 1 or rb != 6)) {
							var angle = irandom(359)
							physics_apply_impulse(x, y, lengthdir_x(phy_mass*10, angle), lengthdir_y(phy_mass*10, angle))
						}
					}
					else if (joint != pointer_null) {
						physics_joint_set_value(joint, phy_joint_angle_limits, false)
						joint = pointer_null
					}
				
					active = false
			
					delta_alarm(0, irandom_range(0.5*sec+global.performanceMode*sec-0.5*sec*IS_MOBILE, 1.5*sec+global.performanceMode*sec*1.5-0.8*sec*IS_MOBILE))
				}
			}
		}
	}
}
else if (abilitySoul) {
	soulMode = true
	hp = maxHp
	
	spd /= 2
	
	slide_text(x, y, "soul", c_nicepurple, false, true)
		
	manaEffect_soul = instance_create(target.x, target.y, efSoulSteal)
	manaEffect_soul.owner = id
	manaEffect_soul.target = target
		
	with (parJoint)
		if (root == other.id and name != "Body")
			image_alpha = 0.5
		
	delta_alarm(8, sec/10)
}