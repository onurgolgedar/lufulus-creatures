if (phy_active) {
	var fromPlayer_v = fromPlayer
	
	var thisArrow = id
	with (parTarget) {
		if (!death
		and id != other.owner
		and (!fromPlayer_v or !other.damageLock or mode == md_attack)
		and (physics_test_overlap(x, y, phy_rotation, other.id) or (instance_exists(objShield_sdest) and is_in_shieldmode(objPlayer.id) and physics_test_overlap(x, y, phy_rotation, objShield_sdest)))
		and (fromPlayer_v or id == other.target or ai_protectors_exists(other.target))
		and (!fromPlayer_v or !are_they_friends(id, other.owner))
		and test_defencelock(id)) {
			var arrowInteractsShield = false
			with (thisArrow)
				var arrowInteractsShield = physics_test_overlap(x, y, phy_rotation, objShield_sdest)
			
			var is_ba = true
			
			var damage = 0
			var bonusDamage = 0
			
			var shellBlock = abilityShell and !body.destroyed and irandom(1) and hp != maxHp and !other.isMassiveArrow
			var shieldBlock = false
			
			if (abilityShell and irandom(4) == 0 and extension_exists(ext_shellcounter))
				shell_drop()
			
			#region Impulse etc.
			stop_moving(sec/7)
			
			var impulse
			if (fromPlayer_v) {
				impulse = (1+phy_mass*7/other.owner.attackSpeed)
				*(1+0.1*extension_exists(ext_arrowSpeed10))
			}
			else impulse = (1.4+phy_mass*6/other.owner.attackSpeed)
			
			if (shellBlock or shieldBlock)
				impulse /= 2
			
			physics_apply_impulse(phy_com_x, phy_com_y, 
			lengthdir_x(impulse, other.image_angle),
			lengthdir_y(impulse, other.image_angle))
			#endregion
	
			#region Graphical Effect
			if (other.isMassiveArrow) {
				var damageEffect = instance_create(x, y, efSkill9_burst)
				damageEffect.causedBy = other.owner
			}
			else {
				var damageEffect = instance_create(x, y, efCDamaged)
				damageEffect.c1 = efColor1
				damageEffect.c2 = efColor2
				damageEffect.c3 = efColor3
				damageEffect.causedBy = other.owner
			
				repeat(irandom_range(3, 5)) {
					var angle = point_direction(other.x, other.y, x, y)+irandom_range(-20, 20)
					var dis = irandom_range(25, 50)
					var blood = instance_create_layer(x+lengthdir_x(dis, angle), y+lengthdir_y(dis, angle), "lyFloor", objBloodEffect)
					blood.depth += 5
					blood.image_angle = angle+irandom_range(-10, 10)
				}
			}
			#endregion
		
			if (fromPlayer_v) {
				var critical = chance(other.owner.criticalChance, 100) and !shellBlock
				or (stunned and extension_exists(ext_stuncrit))
			}
			else
				critical = chance(other.owner.criticalChance, 100) and !shellBlock and !other.isPentaArrow
		
			#region Skill Effects (Overrides Basic DMG)
			#region Massive Shot
			if (other.isMassiveArrow) {
				var skillUpgrade = skill_get_upgrade(objSkill_9)
				damage = calculate_damagetaken(skill_get_value(objSkill_9, skillUpgrade, type_physicaldamage), 0)
				damage += calculate_damagetaken(skill_get_value(objSkill_9, skillUpgrade, type_magicaldamage), 1)
				damage *= (0.5+other.pwr*1.1)
				bonusDamage = 0
				
				if (critical) {
					damage *= 1+other.owner.criticalFactor
					
					add_effectbox(efboxSlow, 3, 2*sec)
				}
				
				attacked(0, thisArrow.owner, false, false)
				physics_apply_impulse(phy_com_x, phy_com_y, lengthdir_x(3+skillUpgrade/2, thisArrow.image_angle),lengthdir_y(3+skillUpgrade/2, thisArrow.image_angle))
				stop_moving(sec*1/2)
				burst_light(id, sec/2, 0.4+skillUpgrade*0.05, 2+skillUpgrade*0.1)
				
				var mainTarget = id
				var affecteds = get_affecteds(thisArrow.owner, id, 200+skillUpgrade*25)
				var ds_size = ds_list_size(affecteds)
				for (var i = 0; i < ds_size; i++) {
					with (ds_list_find_value(affecteds, i)) {
						if (mode == md_attack or !global.defenseLock) {						
							var angle = point_direction(mainTarget.x, mainTarget.y, phy_com_x, phy_com_y)+180
							if (id != mainTarget)
								physics_apply_impulse(phy_com_x, phy_com_y, lengthdir_x(9+skillUpgrade, angle),lengthdir_y(9+skillUpgrade, angle))
							stop_moving(sec*3/4)

							attacked(damage/2, thisArrow.owner, false)
						}
						else if (!death)
							slide_text(x, y, eng() ? "safety\nstate" : "güvenlik\ndurumu", c_yellow, 0)
					}
				}
				ds_list_destroy(affecteds)
				
				is_ba = false
			}
			#endregion
			#region Glacial Shot
			else if (other.isGlacialArrow) {
				var skillUpgrade = skill_get_upgrade(objSkill_9)
				damage = calculate_damagetaken(skill_get_value(objSkill_10, skillUpgrade, type_physicaldamage), 0)
				damage += calculate_damagetaken(skill_get_value(objSkill_10, skillUpgrade, type_magicaldamage), 1)
				damage *= (0.5+other.pwr*1.1)
				bonusDamage = 0
				
				var freezeTime = skill_get_value(objSkill_10, skillUpgrade, type_value)*sec
				
				attacked(0, thisArrow.owner, false, false)
				instance_create(x, y, efSkill10_burst)
				burst_light(id, sec/2, 0.5, 3)
				
				var mainTarget = id
				var affecteds = get_affecteds(thisArrow.owner, id, 200+skillUpgrade*25)
				var ds_size = ds_list_size(affecteds)
				for (var i = 0; i < ds_size; i++) {
					with (ds_list_find_value(affecteds, i)) {
						if (mode == md_attack or !global.defenseLock) {
							attacked(damage/2, thisArrow.owner, false)
							
							add_effectbox(efboxFreeze, -1, freezeTime)
						}
						else if (!death)
							slide_text(x, y, eng() ? "safety\nstate" : "güvenlik\ndurumu", c_yellow, 0)
					}
				}
				ds_list_destroy(affecteds)
				
				is_ba = false
			}
			#endregion
			#endregion
		
			#region Basic Attack
			if (is_ba) {
				damage = calculate_damagetaken(other.owner.physicalPower, 0)
				damage *= (0.45+other.pwr*1.1)
				bonusDamage = 0
				
				if (fromPlayer_v) {
					damage *= 1+critical*other.owner.criticalFactor
					+0.1*extension_exists(ext_basicDamage10)
					+0.12*extension_exists(ext_arrow_dmg12)
					+0.20*extension_exists(ext_arrow_dmg20)
					+0.30*(other.pwr > 0.9 and extension_exists(ext_bow_completeshot30))
				}
				else
					damage *= 1+critical*1.5
				
				if (fromPlayer_v) {
					#region BONUS DMG
					bonusDamage += extension_exists(ext_basicMagical20)*calculate_damagetaken(other.owner.physicalPower*2/10, 1)
					+extension_exists(ext_basicMagical30)*calculate_damagetaken(other.owner.physicalPower*3/10, 1)
					+extension_exists(ext_basicMagical40)*calculate_damagetaken(other.owner.physicalPower*4/10, 1)
					#endregion
				
					#region BONUS EFFECT
					if (extension_exists(ext_basicStun15) and chance(15, 100))
						add_effectbox(efboxStun)
					
					if (extension_exists(ext_energyRegen4)) {
						with (other.owner)
							change_energy(4)
					}
				
					if (extension_exists(ext_poison1600)) {
						if (chance(4, 25)) {
							var poison = add_effectbox(efboxPoison, -1, 5*sec)
							poison.creator = other.id
							poison.damage = 2300
						}
					} else if (extension_exists(ext_poison900)) {
						if (chance(9, 50)) {
							var poison = add_effectbox(efboxPoison, -1, 4*sec)
							poison.creator = other.id
							poison.damage = 1400
						}
					} else if (extension_exists(ext_poison500)) {
						if (chance(1, 5)) {
							var poison = add_effectbox(efboxPoison, -1, 3*sec)
							poison.creator = other.id
							poison.damage = 500
						}
					}
					
					if (other.isPentaArrow) {
						for (var i = 0; i < 4; i++) {
							if (global.selectedSkill[i] == objSkill_8) {
								var decrease = floor(global.selectedSkillMaxRem[i]*7/100)
								if (global.selectedSkillRem[i]-decrease > 0)
									global.selectedSkillRem[i] -= decrease
								else
									global.selectedSkillRem[i] = 0
							}
						}
					}
				
					if (other.pwr < 0.33 and extension_exists(ext_bow_quickshot_slow)) {
						add_effectbox(efboxSlow, 1.75)
					}
					#endregion
				}
			}
			#endregion
			
			#region Post Damage Reduction
				damage *= max(1-shellBlock*0.75, 0)
				
				if (!fromPlayer_v and object_index == objPlayer and is_in_shieldmode(objPlayer.id) and arrowInteractsShield) {
					damage /= 2
					shieldBlock = true
				}
			#endregion
			
			#region Sound Effect
				if (shellBlock or shieldBlock) {
					var sound = sound_play_at(sndAttackMetalic, x, y, false)
					
					var shellText
					if (shellBlock)
						shellText = eng() ? "shell" : "kabuk"
					else
						shellText = eng() ? "shield" : "kalkan"
					slide_text(x, y, shellText, c_nicepurple, false, true)
				}
				else
					var sound = sound_play_at(sndAttack, x, y, false)
			
				audio_sound_pitch(sound, random_range(0.8, 1.2))
			#endregion
			
			if (fromPlayer_v) {
				#region Post Damage Increase
					damage *= 1+extension_exists(ext_med_archblue)*0.1+test_effectbox(efboxCriticalBoost)*0.25-other.isPentaArrow*skill_get_value(objSkill_8, -1, type_value)
				#endregion
			
				with (other.owner) {
					change_hp(damage*(0
					+(extension_exists(ext_basicLifeSteal3))*3/100
					+(extension_exists(ext_basicLifeSteal6))*6/100
					+(contPlayer.upgSk3 > 0)*skill_get_value(objSkill_3, contPlayer.upgSk3, type_value2)/100
					))
				
					if (critical) {
						if (extension_exists(ext_criticalboost))
							add_effectbox(efboxCriticalBoost)
					}
				}
			}
				
			#region AI Passives
			if (abilityFury and !furious)
				fury_change(sv_fury_increase)
			#endregion
			
			attacked(damage+bonusDamage, other.owner, critical)
			
			with (other) {
				stuckTarget = other.id
				delta_alarm(0, irandom_range(sec*3, sec*4))
				image_alpha = 1
			}
			
			if (fromPlayer_v) {
				with (objAim) {
					image_xscale = 1.2
					image_yscale = 1.2
					image_index = 2
				}
			}
		}
	}
	
	with (parStick) {
		if (physics_test_overlap(x, y, phy_rotation, other.id)) {
			with (other) {
				stuckTarget = other.id
				delta_alarm(0, irandom_range(sec*3, sec*4))
				image_alpha = 1
			}
		}
	}
	
	if (stuckTarget != pointer_null) {
		if (effect != pointer_null)
			instance_destroy(effect)
		
		phy_active = false

		angularDifference = angle_difference(image_angle, stuckTarget.image_angle)
		targetDistance = point_distance(stuckTarget.x, stuckTarget.y, x, y)
		targetDirection = point_direction(stuckTarget.x, stuckTarget.y, x, y)
		targetFirstAngle = stuckTarget.image_angle
		
		depth = stuckTarget.depth+3
		
		if (object_get_parent(stuckTarget.object_index) == parRock)
			delta_alarm(0, irandom_range(sec*0.2, sec*0.4))
	}
}
else if (!phy_active and stuckTarget != pointer_null) {
	phy_position_x = stuckTarget.x+lengthdir_x(targetDistance, targetDirection+stuckTarget.image_angle-targetFirstAngle)
	phy_position_y = stuckTarget.y+lengthdir_y(targetDistance, targetDirection+stuckTarget.image_angle-targetFirstAngle)
	phy_rotation = -(-stuckTarget.phy_rotation+angularDifference)
}