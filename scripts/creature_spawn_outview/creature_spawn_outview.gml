/// @param creature
function creature_spawn_outview() {

	var spawnedCreature = pointer_null

	while (true) {
		var rndX = irandom_range(0, room_width)
		var rndY = irandom_range(0, room_height)
			
		var testCreature_objectIndex = argument[0]
				
		var failure = false
	#region Test: If area is taken before
		with (parTarget)
			if (mode == md_calm
			and point_distance(startX, startY, rndX, rndY) < roamRange/3
			and !death)
				failure = true

		if (failure)
			continue
	#endregion
	#region Test: Create a creature for testing overlapping and place meeting and being in room
		var testCreature = instance_create(-100, -100, testCreature_objectIndex)
		testCreature.forTest = true
		
		with (testCreature)
			if (physics_test_overlap(rndX, rndY, phy_rotation, parSolid)
			or physics_test_overlap(rndX, rndY, phy_rotation, parRock)
			or physics_test_overlap(rndX, rndY, phy_rotation, parTarget)
			or physics_test_overlap(rndX, rndY, phy_rotation, objinvisibleWall)
			or place_meeting(rndX, rndY, contNoSpawn)
			or place_meeting(rndX, rndY, objWallBuilder)
			or is_in_view(rndX, rndY))
				failure = true
				
		instance_destroy(testCreature)
		if (failure)
			continue
	#endregion
	
		spawnedCreature = instance_create_layer(rndX, rndY, "lyBelowPlayer", testCreature_objectIndex)
		spawnedCreature.phy_rotation = -point_direction(spawnedCreature.x, spawnedCreature.y, objPlayer.x, objPlayer.y)
		break
	}

	return spawnedCreature


}
