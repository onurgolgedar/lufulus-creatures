/// @description Attack Moment

/*var xx = x+lengthdir_x(range, image_angle)
var yy = y+lengthdir_y(range, image_angle)*/

var efboxSkill1_exists = test_effectbox(efboxSkill1)
var efboxSkill2_exists = test_effectbox(efboxSkill2)

var ba_success = false
var is_ba = true

var lifeSteal_max = 0
var lifeSteal_count = 0

var freeAllies = ds_list_create()

var ds_size = ai_protectors_size()
for (var i = 0; i < ds_size; i++) {
	var ally = ai_protectors_get(i)
	if (ally.target == pointer_null)
		ds_list_add(freeAllies, ally)
}

if (!death) {
	with (parTarget) {
		if (inView and !death and id != other.id and place_meeting(x, y, objAim)
		and !collision_line(other.x, other.y, x, y, parSolid, 0, 0)
		and !are_they_friends(id, other.id) and test_defencelock(id)) {
			ba_success = true
		
			var magicalDamage = 0
			var damage = 0
			
			var shellBlock = false
			if (abilityShell) {
				if (irandom(4) == 0 and extension_exists(ext_shellcounter))
					shell_drop()
				else if (!body.destroyed and irandom(1) and !efboxSkill1_exists and !efboxSkill2_exists and hp != maxHp)
					shellBlock = true
			}
			
			#region Impulse etc.
			stop_moving(sec/7)
			
			var impulse = (0.23+phy_mass*10/other.attackSpeed)
						  *(1+efboxSkill1_exists+(global.impulseRatio*WEAPON_MELEE_IMPULSE_RATIO-0.5))
			
			physics_apply_impulse(phy_com_x, phy_com_y,
			lengthdir_x(impulse, other.image_angle),
			lengthdir_y(impulse, other.image_angle))
			#endregion
			
			#region Sound Effect
			if (shellBlock) {
				var sound = sound_play_at(sndAttackMetalic, x, y, false)
				slide_text(x, y, eng() ? "shell" : "kabuk", c_nicepurple, false, true)
			}
			else
				var sound = sound_play_at(sndAttack, x, y, false)
			audio_sound_pitch(sound, random_range(0.8, 1.2))
			#endregion
			
			#region Graphical Effect		
			var damageEffect = instance_create(x, y, efCDamaged)
			damageEffect.c1 = efColor1
			damageEffect.c2 = efColor2
			damageEffect.c3 = efColor3
			damageEffect.causedBy = other.id
			#endregion
			
			var critical = other.oneTimeCritical or (chance(other.criticalChance, 100) and !shellBlock)
			or (stunned and extension_exists(ext_stuncrit))
			
			other.oneTimeCritical = false
			
			#region Skill Effects (Overrides Basic DMG)
			if (efboxSkill1_exists) {
				var damage_pure = skill_get_value(objSkill_1, -1, type_physicaldamage)
				damage_pure *= 1+(contPlayer.masterMage_extension*0.1+global.mp*0.005)
				
				damage = calculate_damagetaken(damage_pure*(1+critical*other.criticalFactor), 0)
				
				if (critical) {
					var bleeding = add_effectbox(efboxBleeding)
					bleeding.damage = damage_pure*sv_sk1_bleedingRatio*(1+global.str*0.01)
					bleeding.creator = other.id
				}
				
				if (irandom(3) == 0 and type != type_npc and extension_exists(ext_limb_sk0)) {
					var arm = isRightHanded ? leftArm[0] : rightArm[0]
					if (!boss and rigidbodyParts != pointer_null and arm != pointer_null) {
						with (arm) {
							active = false
							physics_joint_delete(joint)
							joint = pointer_null
						}
						
						if (isRightHanded)
							leftArm[0] = pointer_null
						else
							rightArm[0] =  pointer_null
						
						change_hp(-maxHp/10)
					}
				}
				
				is_ba = false
			}
			#endregion

			#region Basic Attack
			if (is_ba) {
				damage = calculate_damagetaken(other.physicalPower, 0)
				
				damage *= 1+critical*other.criticalFactor
				+0.1*extension_exists(ext_basicDamage10)
				+0.18*extension_exists(ext_basicDamage18)
				+0.26*extension_exists(ext_basicDamage26)
				
				#region BONUS DMG
				magicalDamage += extension_exists(ext_basicMagical20)*calculate_damagetaken(other.physicalPower*2/10, 1)
				+extension_exists(ext_basicMagical30)*calculate_damagetaken(other.physicalPower*3/10, 1)
				+extension_exists(ext_basicMagical40)*calculate_damagetaken(other.physicalPower*4/10, 1)
			
				damage += (efboxSkill2_exists and efboxSkill2.firstBonus)*calculate_damagetaken(skill_get_value(objSkill_2, -1, type_physicaldamage), 0)
				*(1+contPlayer.masterMage_extension*0.1+global.mp*0.005)
				#endregion
				
				#region BONUS EFFECT
				if (efboxSkill2_exists and efboxSkill2.firstBonus) {
					add_effectbox(efboxStun)
					efboxSkill2.alarm[11] = 1
				}
				
				if (extension_exists(ext_basicStun15) and chance(15, 100)) {
					add_effectbox(efboxStun)
				}
				
				if (extension_exists(ext_energyRegen4)) {
					with (other.id)
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
				#endregion
			}
			#endregion
			
			#region Post Damage Reduction
				damage *= 1-shellBlock*0.5
			#endregion
			
			#region Post Damage Increase
			damage *= 1+extension_exists(ext_med_wors)*0.06+test_effectbox(efboxCriticalBoost)*0.25
			#endregion
			
			#region Life Steal
			var lifeSteal = damage*(0
							+(contPlayer.upgSk3 > 0)*skill_get_value(objSkill_3, contPlayer.upgSk3, type_value2)/100
							+extension_exists(ext_basicLifeSteal3)*3/100
							+extension_exists(ext_med_wors)*3/100
							+extension_exists(ext_basicLifeSteal6)*6/100)
							*(1+critical*extension_exists(ext_critlife))
				
			if (lifeSteal > 0) {
				if (lifeSteal > lifeSteal_max)
					lifeSteal_max = lifeSteal
				
				lifeSteal_count++
			}
			#endregion
				
			#region AI Passives
			if (abilityFury and !furious)
				fury_change(sv_fury_increase)
			#endregion
			
			attacked(damage+magicalDamage, other.id, critical)
			
			if (critical and extension_exists(ext_critfire)) {
				with (efboxStun)
					if (owner == other.id)
						time = maxTime
						
				with (efboxFire)
					if (owner == other.id)
						time = maxTime
			}
		
			#region Free Allies Call
			if (object_index != objLufulusWisdom) {
				var ds_size = ds_list_size(freeAllies)
				for (var i = 0; i < ds_size; i++) {
					with (ds_list_find_value(freeAllies, i)) {
						if (!are_they_friends(id, other.id))
							ai_reaction(other.id, true)
					}
				}
			}
			#endregion
		}
	}
}

ds_list_destroy(freeAllies)
	
if (ba_success) {
	var lifeSteal_given = clamp(lifeSteal_max*(1+(lifeSteal_count-1)*0.1), lifeSteal_max, lifeSteal_max*1.3)
	change_hp(lifeSteal_given)
		
	with (objAim) {
		image_xscale = 1.2
		image_yscale = 1.2
		image_index = 2
	}
		
	if (critical) {
		if (extension_exists(ext_criticalboost))
			add_effectbox(efboxCriticalBoost)
	}
}