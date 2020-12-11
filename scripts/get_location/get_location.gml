/// @param index/name
function get_location() {

	var wantsIndex = false
	if (is_string(argument[0]))
		wantsIndex = true

	var indexReturn
	var nameReturn

	if (argument[0] == loc_road or argument[0] == roomRoad) {
		indexReturn = roomRoad
		nameReturn = loc_road
	}
		
	else if (argument[0] == loc_beforeroad or argument[0] == roomBeforeRoad) {
		indexReturn = roomBeforeRoad
		nameReturn = loc_beforeroad
	}
		
	else if (argument[0] == loc_hawmgrad or argument[0] == roomCastle_area) {
		indexReturn = roomCastle_area
		nameReturn = loc_hawmgrad
	}

	else if (argument[0] == loc_spawn0 or argument[0] == roomCreature0) {
		indexReturn = roomCreature0
		nameReturn = loc_spawn0
	}
		
	else if (argument[0] == loc_spawn1 or argument[0] == roomCreature) {
		indexReturn = roomCreature
		nameReturn = loc_spawn1
	}
	
	else if (argument[0] == loc_spawn2 or argument[0] == roomCreature2) {
		indexReturn = roomCreature2
		nameReturn = loc_spawn2
	}
	
	else if (argument[0] == loc_spawn3 or argument[0] == roomCreature3) {
		indexReturn = roomCreature3
		nameReturn = loc_spawn3
	}
		
	else if (argument[0] == loc_spawn4 or argument[0] == roomCreature4) {
		indexReturn = roomCreature4
		nameReturn = loc_spawn4
	}
		
	else if (argument[0] == loc_spawn5 or argument[0] == roomCreature5) {
		indexReturn = roomCreature5
		nameReturn = loc_spawn5
	}
		
	else if (argument[0] == loc_spawn6 or argument[0] == roomCreature6) {
		indexReturn = roomCreature6
		nameReturn = loc_spawn6
	}

	else if (argument[0] == loc_spawn7 or argument[0] == roomCreature7) {
		indexReturn = roomCreature7
		nameReturn = loc_spawn7
	}

	else if (argument[0] == loc_spawn8 or argument[0] == roomCreature8) {
		indexReturn = roomCreature8
		nameReturn = loc_spawn8
	}

	else if (argument[0] == loc_spawn9 or argument[0] == roomCreature9) {
		indexReturn = roomCreature9
		nameReturn = loc_spawn9
	}

	else if (argument[0] == loc_spawn10 or argument[0] == roomCreature10) {
		indexReturn = roomCreature10
		nameReturn = loc_spawn10
	}

	else if (argument[0] == loc_wave1 or argument[0] == roomWave) {
		indexReturn = roomWave
		nameReturn = loc_wave1
	}

	else if (argument[0] == loc_wave2 or argument[0] == roomWave2) {
		indexReturn = roomWave2
		nameReturn = loc_wave2
	}

	else if (argument[0] == loc_wave3 or argument[0] == roomWave3) {
		indexReturn = roomWave3
		nameReturn = loc_wave3
	}

	else if (argument[0] == loc_wave4 or argument[0] == roomWave4) {
		indexReturn = roomWave4
		nameReturn = loc_wave4
	}

	else if (argument[0] == loc_mineralcave or argument[0] == roomCave) {
		indexReturn = roomCave
		nameReturn = loc_mineralcave
	}

	else if (argument[0] == loc_belingfur or argument[0] == roomCastle2_area) {
		indexReturn = roomCastle2_area
		nameReturn = loc_belingfur
	}

	else if (argument[0] == loc_camp1 or argument[0] == roomCamp1) {
		indexReturn = roomCamp1
		nameReturn = loc_camp1
	}

	else if (argument[0] == loc_warzone or argument[0] == roomRebelWar) {
		indexReturn = roomRebelWar
		nameReturn = loc_warzone
	}

	else if (argument[0] == loc_warzone2 or argument[0] == roomRebelWar2) {
		indexReturn = roomRebelWar2
		nameReturn = loc_warzone2
	}

	else if (argument[0] == loc_lufulus or argument[0] == roomLufulus) {
		indexReturn = roomLufulus
		nameReturn = loc_lufulus
	}

	else {
		if (argument[0] == pointer_null) {
			indexReturn = -1
			nameReturn = -1
		}
		else {
			indexReturn = roomCastle_area
			nameReturn = loc_hawmgrad
		}
	}
	
	return (wantsIndex ? indexReturn : nameReturn)


}
