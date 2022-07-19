/// @param value
function change_hp() {

	var maxHp = id.maxHp
	if (object_index == objPlayer) {
		if (instance_exists(efboxDeath))
			maxHp = ceil(id.maxHp*75/100)
	}

	if (!death) {
		var value = argument[0]
	
		if (value >= 0) {
			value *= (1+global.vit*0.01*(object_index == objPlayer)-wound*0.5)
	
			if (hp+value < maxHp)
				hp += value
			else
				hp = maxHp
		}
		else {
			if (hp+value > 0) {
				hp += value
		
			#region RED SCREEN EFFECT
				if (object_index == objPlayer and hp < maxHp/2) {
					var redScreenValue = -value/maxHp+0.5
					if (contGUi.redScreenTarget < redScreenValue) {
						contGUi.redScreenIncrease = true
						contGUi.redScreenTarget = min(redScreenValue, 1)
						contGUi.alarm[1] = 1
					}			
				}
			#endregion
			}
			else {
				if (object_index != objPlayer or !global.immortality) {
					hp = 0
					event_perform(ev_other, ev_user15)
				}
			}
		}

	#region ADDITIONAL
		if (object_index == objPlayer)
			alarm[2] = 1
		else {
			alarm[11] = 1
	
			if (hp < maxHp/2)
				shell_drop()
			
			if (hp > 0 and (value < -maxHp/20 or (boss and value < -maxHp/100))) {
				if (irandom(4) == 0)
					try_bonus_object(!boss)
			}
		}
	#endregion
	}


}
