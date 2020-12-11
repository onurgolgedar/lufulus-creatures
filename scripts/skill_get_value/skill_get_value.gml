/// @param skill
/// @param upgrade*
/// @param type*
/// @param onlyReturnFactor*
function skill_get_value() {

	var result = 0

	var extraUpgrade
	if (argument_count < 2 or argument[1] == -1)
		extraUpgrade = skill_get_upgrade(argument[0])-1
	else
		extraUpgrade = argument[1]-1
	
	var onlyReturnFactor
	if (argument_count < 4)
		onlyReturnFactor = false
	else
		onlyReturnFactor = argument[3]
	
	// ? may include bug
	if (extraUpgrade == -1)
		result = 0

	var type
	if (argument_count < 3)
		type = type_physicaldamage
	else
		type = argument[2]

	if (type == type_physicaldamage) {
	#region Duelist BS
		if (argument[0] == objMainBS)
			result = 0.6
	#endregion
	
	#region Skill 1
		else if (argument[0] == objSkill_1)
			result = 1.25+extraUpgrade*0.25
	#endregion
	
	#region Skill 2
		else if (argument[0] == objSkill_2)
			result = 0.2+extraUpgrade*0.1
	#endregion
	
	#region Skill 9
		else if (argument[0] == objSkill_9)
			result = 1.25+extraUpgrade*0.25
	#endregion
	
	#region Skill 10
		else if (argument[0] == objSkill_10)
			result = 1
	#endregion
	}
	else if (type == type_magicaldamage) {
	#region Duelist BS
		if (argument[0] == objMainBS)
			result = 0.6
	#endregion
	
	#region Skill 9
		if (argument[0] == objSkill_9)
			result = 0.5+extraUpgrade*0.2
	#endregion
	
	#region Skill 10
		if (argument[0] == objSkill_10)
			result = 1+extraUpgrade*0.25
	#endregion
	
	#region Skill 11
		if (argument[0] == objSkill_11)
			result = 0.2+extraUpgrade*0.05
	#endregion
	
	#region Skill 12
		if (argument[0] == objSkill_12)
			result = 1+extraUpgrade*0.33
	#endregion
	
	#region Skill 13
		if (argument[0] == objSkill_13)
			result = 1.33+extraUpgrade*0.33
	#endregion
	
	#region Skill 14
		if (argument[0] == objSkill_14)
			result = 0.12+extraUpgrade*0.4
	#endregion
	}
	else if (type == type_duration) {
	#region Skill 2
		if (argument[0] == objSkill_2)
			result = (3+extraUpgrade)*sec
	#endregion
	
	#region Skill 11
		if (argument[0] == objSkill_11)
			result = (7+extraUpgrade*2)*sec
	#endregion
	}
	else if (type == type_value) {
	#region Skill 3
		if (argument[0] == objSkill_3)
			result = 3+extraUpgrade*1
	#endregion
	
	#region Skill 4
		if (argument[0] == objSkill_4)
			result = 2+extraUpgrade*0.6
	#endregion
	
	#region Skill 5
		if (argument[0] == objSkill_5)
			result = 0.2+extraUpgrade*0.15
	#endregion
	
	#region Skill 6
		if (argument[0] == objSkill_6)
			result = 20+11*extraUpgrade
	#endregion

	#region Skill 7
		if (argument[0] == objSkill_7)
			result = 5+3*extraUpgrade
	#endregion
	
	#region Skill 8
		else if (argument[0] == objSkill_8)
			result = 0.35-extraUpgrade*0.05
	#endregion
	
	#region Skill 9
		else if (argument[0] == objSkill_10)
			result = 1.75+extraUpgrade*0.75
	#endregion
	
	#region Skill 11
		if (argument[0] == objSkill_11)
			result = 2.5-0.5*extraUpgrade
	#endregion
	
	#region Skill 13
		if (argument[0] == objSkill_13)
			result = 0.1+extraUpgrade*0.033
	#endregion
	
	#region Skill 14
		if (argument[0] == objSkill_14)
			result = 9+extraUpgrade*5
	#endregion
	}
	else if (type == type_value2) {
	#region Skill 3
		if (argument[0] == objSkill_3)
			result = 12+extraUpgrade*4
	#endregion
	
	#region Skill 4
		if (argument[0] == objSkill_4)
			result = 8+extraUpgrade*6
	#endregion
	
	#region Skill 5
		if (argument[0] == objSkill_5)
			result = 6+extraUpgrade*4
	#endregion
	
	#region Skill 6
		if (argument[0] == objSkill_6)
			result = 22+extraUpgrade*15
	#endregion
	
	#region Skill 7
		if (argument[0] == objSkill_7)
			result = 5+extraUpgrade*3
	#endregion
	}
	else if (type == type_value3) {	
	#region Skill 4
		if (argument[0] == objSkill_4)
			result = 5+extraUpgrade*2
	#endregion
	}

	if (!onlyReturnFactor) {
		if (type == type_physicaldamage)
			return ceil(global.physicalPower*result)
		else if (type == type_magicaldamage)
			return ceil(global.magicalPower*result)
		else
			return result
	}

	return result


}
