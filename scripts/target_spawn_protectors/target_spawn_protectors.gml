/// @param object
/// @param distance
function target_spawn_protectors() {

	var spawnedAlly = pointer_null

	repeat (40) {
		var rndX = x+irandom_range(-argument[1]/2, argument[1]/2)
		var rndY = y+irandom_range(-argument[1]/2, argument[1]/2)
			
		var testCreature_objectIndex = argument[0]
				
		var failure = false
	#region Test: Create a target for testing overlapping and place meeting and being in room
		var testCreature = instance_create(-100, -100, testCreature_objectIndex)
		testCreature.forTest = true
		
		with (testCreature)
			if (physics_test_overlap(rndX, rndY, phy_rotation, parSolid)
			or physics_test_overlap(rndX, rndY, phy_rotation, parRock)
			or physics_test_overlap(rndX, rndY, phy_rotation, parTarget)
			or physics_test_overlap(rndX, rndY, phy_rotation, objInvisibleWall)
			or physics_test_overlap(rndX, rndY, phy_rotation, contGridBlock)
			or place_meeting(rndX, rndY, objWallBuilder)
			or place_meeting(rndX, rndY, contNoSpawn))
				failure = true
				
		instance_destroy(testCreature)
		if (failure)
			continue
	#endregion
	
		spawnedAlly = instance_create_layer(rndX, rndY, "lyBelowPlayer", testCreature_objectIndex)
		spawnedAlly.phy_rotation = -point_direction(x, y, spawnedAlly.x, spawnedAlly.y)
		spawnedAlly.targetAngle = -spawnedAlly.phy_rotation
		spawnedAlly.isProtector = true
		spawnedAlly.protection_owner = id
	
		ai_protectors_add(spawnedAlly)
		
		break
	}

	return spawnedAlly


}
