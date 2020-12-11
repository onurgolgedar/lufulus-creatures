/// @description Passives
delta_alarm(8, sec/10)

if (!death) {
	var randomValue = irandom(5)
	healthBar_blend = c_white
	
	if (targetLock > 1) {
		targetLock -= 1+isSearching
		if (targetLock < 1)
			targetLock = 1
	}

	#region Fury
	if (abilityFury) {
		if (furious)
			fury_change(-3)
		else
			fury_change(-1.5)
	}
	#endregion
	
	#region Turtle
	if (abilityTurtle) {
		if (turtleMode) {
			turtle_change(-7)
			//change_hp(maxHp/66)
		}
		else
			turtle_change(-4)
	}
	#endregion

	#region Shock
	if (abilityShock) {
		if (shockLoad == -1)
			shock_change(2)
		else if (shockLoad+3 < 100)
			shockLoad += 3
		else {
			shockLoad = -1
			shock_change(-irandom_range(20, 35), 1)
		
			var explosion = instance_create_layer(x, y, "lyAir", objShock_SO)
			explosion.image_xscale = 2
			explosion.image_yscale = explosion.image_xscale
			explosion.image_blend = efColor1
			explosion.damage = shockPower
			explosion.owner = id
			explosion.target = target
		}
	}
	#endregion

	#region Poison
	if (abilityPoison)
		poison_change(2+randomValue/2)
	#endregion

	#region Basic Heal
	if (abilityBasicHeal and !(abilitySoul and soulMode))
		basicheal_change(2+randomValue/7)
	#endregion

	#region Pull
	if (abilityPull)
		pull_change(pullFreq+randomValue/10)
	#endregion

	#region Brain Attack
	if (abilityBrainAttack and combatExperience > 0)
		brainattack_change(1.2)
	#endregion
		
	#region Slow Stone
	if (abilitySlowStone) {
		if (!slowStoneMove and (!abilityStrike or !strikeMode) and canSee)
			slowstone_change(0.7+randomValue/10)
	}
	#endregion
		
	#region Strike
	if (abilityStrike and !(abilityFury and furious)) {
		if (strikeMove > 0)
			strikeMove -= 1.3

		if (!strikeMode and !strikeMove and !isSearching)
			strike_change(strikeFreq+!isRanged/3+randomValue/13)
		else if (strikeMode and strikePoints > 1)
			strike_change(-5*canSee) // Loading time to attack
	}
	#endregion

	#region Earth Move
	if (abilityEarthMove) {
		if (stance == stEarthMove2)
			earthmove_change(-100/(sec*0.75)*(sec/10))
		else if (!ai_has_move(move_earthmove_1) and !ai_has_move(move_earthmove_2))
			earthmove_change(1)
		else if (stance == stEarthMove1)
			earthmove_change(-5)
	}
	#endregion

	#region Rofux
	if (abilityRofux)
		rofux_change(1.7-0.5*(abilityShell and !body.destroyed))
	#endregion
	
	#region Laser
	if (abilityLaser)
		laser_change(1.5)
	#endregion

	// ? bug after being soul being calm.
	#region Soul
	if (abilitySoul) {
		if (soulMode) {
			with (target)
				if (point_distance(x, y, other.x, other.y) < sv_soulSteal_range) {
					var manaTaken = maxMana/150
					change_mana(-manaTaken)
				
					if (object_index == objPlayer)
						slide_text(x, y, round(-manaTaken), c_blue)
				}
		
			change_hp(-maxHp/40)
		}
	}
	#endregion
}