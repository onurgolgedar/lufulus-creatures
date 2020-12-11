function set_hunter() {
	mode = md_calm
	teamNo = team_neutralFriend

	if (room_get_level(room) < 7)
		init_warrior(melee_xlight)
	else if (room_get_level(room) < 15)
		init_warrior(melee_light)
	else if (room_get_level(room) < 20)
		init_warrior(melee_normal)
	else
		init_warrior(melee_heavy)
	
	spd *= 1.1

	if (room_get_level(room) < 10) {
		maxHp *= 0.8
		hp *= 0.8
		physicalPower *= 0.75
	}
	else if (room_get_level(room) < 14) {
		maxHp *= 0.9
		hp *= 0.9
		physicalPower *= 0.85
	}

	if (room_get_level(room) > 18) {
		maxHp *= 1.5
		hp *= 1.5
		physicalPower *= 1.2
		attackSpeed *= 1.1
	
		spd *= 1.1
	}
	else if (room_get_level(room) > 16) {
		maxHp *= 1.25
		hp *= 1.25
		physicalPower *= 1.1
	}
	else if (room_get_level(room) > 13) {
		maxHp *= 1.1
		hp *= 1.1
	}
	
	name = eng() ? "Hunter (Ally)" : "Avcı (Dost)"
	defaultMode = md_calm


}
