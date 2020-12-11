/// @description Attack Moment

if (target != pointer_null) {
	if (!isRanged) {
		var damage = 0
		
		with (target) {
			if (!death) {
				var dir = point_direction(other.x, other.y, x, y)
				var activeRange = other.range+5
				var dodge = (object_index == objPlayer)*extension_exists(ext_classics)*chance(8*global.classicItem_count, 100)
		
				if ((collision_line(other.x, other.y, other.x+lengthdir_x(activeRange, dir), other.y+lengthdir_y(activeRange, dir), id, 1, 0))
				and other.angleDiff < 30) {	
					if (other.abilityFury and !other.furious)
						other.fury = 0
					
					var shellBlock = abilityShell and !body.destroyed and irandom(1)
				
					repeat(irandom_range(3, 5)) {
						var angle = point_direction(other.x, other.y, x, y)+irandom_range(-20, 20)
						var dis = irandom_range(25, 50)
						var blood = instance_create_layer(x+lengthdir_x(dis, angle), y+lengthdir_y(dis, angle), "lyFloor", objBloodEffect)
						blood.depth += 5
						blood.image_angle = angle+irandom_range(-10, 10)
					}
			
					var damageEffect = instance_create(x, y, efCDamaged)
					damageEffect.c1 = efColor1
					damageEffect.c2 = efColor2
					damageEffect.c3 = efColor3
					damageEffect.causedBy = other.id
		
					var critical = chance(other.criticalChance, 100) and !shellBlock
			
					damage = calculate_damagetaken(other.physicalPower, 0)
					damage *= 1+critical
				
					#region Post Damage Reduction
					damage *= 1-shellBlock*0.5
				
					if (dodge) {
						damage = 0
						slide_text(x, y, eng() ? "dodge" : "ıska", c_nicepurple, false, true)
					}
					#endregion
			
					var before_hp = hp
					attacked(damage, other.id, critical)
					
					#region Sound Effect
					if (shellBlock) {
						var sound = sound_play_at(sndAttackMetalic, x, y, false)
						slide_text(x, y, eng() ? "shell" : "kabuk", c_nicepurple, false, true)
					}
					else
						var sound = sound_play_at(sndAttack, x, y, false)
					audio_sound_pitch(sound, random_range(1.3, 1.4))
					audio_sound_gain(sound, 0.7, 0)
					#endregion
						
					#region Impulse etc.
						if (canSee)
							stop_moving(sec/10)
			
						var impulse = (0.04+phy_mass*3.5/other.attackSpeed)
						impulse *= max(1+(before_hp-hp)/maxHp*12, 1)
			
						physics_apply_impulse(phy_com_x, phy_com_y,
						lengthdir_x(impulse, other.image_angle),
						lengthdir_y(impulse, other.image_angle))
					#endregion
				}
			}
		}
		
		#region Life Steal
			var lifeSteal = round(damage*lifesteal/100)
			change_hp(lifeSteal)
		#endregion
	}
}