/// @param object
/// @param x
/// @param y
/// @param distance
function target_spawn() {

	var spawned = pointer_null

	repeat (40) {
		var rndX = argument[1]+irandom_range(-argument[3]/2, argument[3]/2)
		var rndY = argument[2]+irandom_range(-argument[3]/2, argument[3]/2)
			
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
	
		spawned = instance_create_layer(rndX, rndY, "lyBelowPlayer", testCreature_objectIndex)
		spawned.phy_rotation = -point_direction(x, y, spawned.x, spawned.y)
		spawned.targetAngle = -spawned.phy_rotation
		
		break
	}

	return spawned


}
