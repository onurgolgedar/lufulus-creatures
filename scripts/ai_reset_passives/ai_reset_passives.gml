function ai_reset_passives() {
	if (abilityTurtle)
		turtle_initiate()
	
	if (abilityFury)
		fury_initiate()
	
	if (abilityStrike)
		strike_initiate(strikePower, strikeFreq)
	
	if (abilitySlowStone)
		slowstone_initiate(slowStoneObject)
	
	if (abilityBasicHeal)
		basicheal_initiate(basicHealPower)
	
	if (abilityBrainAttack)
		brainattack_initiate(brainColor, brainDamage, brainSize, brainSprite)
	
	if (abilityPull)
		pull_initiate(pullPower, pullFreq)

	if (abilityMovingShot)
		movingshot_initiate(movingShot_speedFactor, movingShot_damage, movingShot_chance)


}
