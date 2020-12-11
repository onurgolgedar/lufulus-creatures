event_inherited()

if (!death) {
	change_hp(maxHp/2500)
	
	if (tutorialBox != pointer_null and instance_exists(tutorialBox) and tutorialBox.image_alpha == 1)
		with (tutorialBox)
			alarm[1] = 1
}
	
if (hp > maxHp*0.95)  {
	fullHpCounter++
	
	if (fullHpCounter > 60) {
		ai_target_destroy(true)
		change_hp(maxHp)
		fullHpCounter = 0
	}
}
else {
	fullHpCounter = 0
	
	if (tauntTimer > 0 and target != pointer_null) {
		tauntTimer--
	
		if (tauntTimer <= 0) {
			var _target = target
			var activeCreatureCount = 0
			with (parCreature) {
				if (!death and target == _target and mode == md_attack and id != other.id)
					activeCreatureCount++
			}
				
			var neededCreatureCount = tauntCreatureCount-activeCreatureCount
			var distance = 250
			if (neededCreatureCount > 0) {
				repeat (17) {
					distance += 200		
				
					with (parCreature) {
						if (!death and point_distance(x, y, other.x, other.y) < distance
						and !isSpecial and mode == md_calm and type != type_wisdom and leader == pointer_null
						and !isLeader_hard and !isLeader and !boss and irandom(1) == 0) {
							ai_reaction(_target)
							neededCreatureCount--
					
							if (neededCreatureCount <= 0)
								break
						}
					}
				
					activeCreatureCount = 0
					with (parCreature) {
						if (!death and target == _target and mode == md_attack and id != other.id)
							activeCreatureCount++
					}
					neededCreatureCount = tauntCreatureCount-activeCreatureCount
					if (neededCreatureCount <= 0)
						break
				}
			}
		
			tauntTimer = 60
		}
	}
}