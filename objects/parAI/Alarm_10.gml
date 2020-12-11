/// @description Search Loop

if (!stunned and isSearching and point_distance(x, y, xLastSeen, yLastSeen) < 180) {
	if (abilityFury)
		fury_change(100)

	if (irandom(8) == 0)
		searchingRotation *= -1
	
	if (irandom(22) == 0)
		directionLast = irandom(359)
	
	if (irandom(5) == 0)
		searchingSpeed = random_range(1, 2.5)
		
	change_hp(maxHp/500)
		
	if (irandom(15) == 0)
		physics_apply_impulse(x, y, lengthdir_x(totalMass*11, directionLast),
		lengthdir_y(totalMass*11, directionLast))
}

delta_alarm(10, sec/10)