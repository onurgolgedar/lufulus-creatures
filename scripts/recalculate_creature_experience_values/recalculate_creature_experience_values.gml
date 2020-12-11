function recalculate_creature_experience_values() {
	var lvExp = calculate_creature_exp(level)
	baseExperience = lvExp*(1+bonusExperienceRate)
	bonusExperienceRate += baseBonusExperienceRate+(level > global.level)*0.03+clamp(level-global.level, 0, 6)*0.06
	experience = lvExp*(1+bonusExperienceRate)


}
