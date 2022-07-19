if (true) {
	var instanceCount = 0
	var equalTeam_mode = false
	
	var hardLeader_lives = false
	with (creature) {
		if (isLeader_hard and !boss) {
			hardLeader_lives = true
			break
		}
	}
			
	var withLeader = hardLeader_lives ? chance(min(with_leader_chance*(1+3*isDestroyedMap), 100), 100) : (with_leader_chance != 0)
	var canBeBoss = bossObject != pointer_null and (ds_list_find_index(global.takenBosses, object_get_name(bossObject)) == -1 or global.debugMode) and !instance_exists(bossObject) and global.level > 7 and (global.gameTime-startTime > 60*7 or chance(1+global.debugMode*199, 200)) and alarm[2] == -1
	
	var _secCreature = secCreature
	var _creature = creature
	
	if (!withLeader and team)
		_secCreature = _creature

	#region Count
	if (_creature != pointer_null) {
		with (_creature) {
			if ((isLeader == other.team or abilityEqualTeam) and leader == pointer_null and !death)
				instanceCount++
				
			if (abilityEqualTeam)
				equalTeam_mode = true
		}
	}
	#endregion

	if ((team and !equalTeam_mode and instanceCount < floor(limit/count))
	or (!team and !equalTeam_mode and instanceCount < limit)
	or (equalTeam_mode and instanceCount+count <= limit)) {
		var spawned = 0
		var spawnedCreatures = ds_list_create()

		var bossSpawned = false
		repeat (!team ? (4+global.performanceMode*2) : count*(4+global.performanceMode*2)) {
			var secInstanceCount = 0
			#region Count
			if (_secCreature != pointer_null) {
				with (_secCreature) {
					if (!death
					and leader != pointer_null
					and instance_exists(leader)
					and leader.object_index == _creature)
						secInstanceCount++
				}
			}
			#endregion
			
			// Stop if a boss is spawned.
			if (bossSpawned)
				break
		
			var bossTest = (canBeBoss and !instance_exists(bossObject) and spawned == 0)
			
			if (bossTest or secInstanceCount+instanceCount < limit and (count == 0 and spawned == 0 or spawned < count)) {
				repeat (10+global.performanceMode*4) {
					#region Choose Random X, Y
					var rndX
					var rndY
					
					if (spawned == 0) {
						rndX = irandom_range(xx, xx2)
						rndY = irandom_range(yy, yy2)
				
						var groupX = rndX
						var groupY = rndY
					}
					else {
						rndX = clamp(groupX+irandom_range(-250-spawned*70, 250+spawned*70), 32, room_width-32)
						rndY = clamp(groupY+irandom_range(-250-spawned*70, 250+spawned*70), 32, room_width-32)
					}
					#endregion
			
					var testCreature_objectIndex = bossTest ? bossObject : ((team and spawned != 0) ? _secCreature : _creature)
					if (isDestroyedMap) {
						if (!bossTest and !withLeader)
							break
					}
				
					var failure = false

					#region Test: If area is taken before
					with (parCreature)
						if (mode == md_calm
						and point_distance(startX, startY, rndX, rndY) < roamRange/3
						and !death
						and ds_list_find_index(spawnedCreatures, id) == -1)
							failure = true
							
					if (failure)
						continue
					#endregion
					
					#region Test: Create a creature for testing overlapping and place meeting
					var testCreature = instance_create(-100, -100, testCreature_objectIndex)
					testCreature.forTest = true
					
					with (testCreature)
						if (physics_test_overlap(rndX, rndY, phy_rotation, parSolid)
						or physics_test_overlap(rndX, rndY, phy_rotation, parRock)
						or physics_test_overlap(rndX, rndY, phy_rotation, parTarget)
						or physics_test_overlap(rndX, rndY, phy_rotation, objinvisibleWall)
						or physics_test_overlap(rndX, rndY, phy_rotation, contGridBlock)
						or place_meeting(rndX, rndY, contNoSpawn)
						or place_meeting(rndX, rndY, objWallBuilder))
							failure = true
				
					instance_destroy(testCreature)
					
					if (failure)
						continue
					#endregion
		
					var spawnedCreature
					#region Spawn the creature
					spawnedCreature = instance_create_layer(rndX, rndY, "lyBelowPlayer", testCreature_objectIndex)
					
					ds_list_add(spawnedCreatures, spawnedCreature)
					spawned++
					#endregion
					
					equalTeam_mode = spawnedCreature.abilityEqualTeam
					
					if (irandom(3-isDestroyedMap) == 0 and !spawnedCreature.boss and (spawned != 1 or !withLeader or !team)) {
						with (spawnedCreature)
							make_creature_dark()
					}
					
					// Is it boss or not?
					if (spawnedCreature.boss) {
						bossSpawned = true
						show_messagebox(contGUi.mLogoX+220, display_get_gui_height()-243, eng() ? (spawnedCreature.name + " is here! It is\nvery powerful but its reward is huge.") : (spawnedCreature.name + " burada! Çok güçlüdür\nve ödülü çok yüksektir."), eng() ? "Superior Creature (Boss)" : "Üstün Yaratık (Boss)", sec*5)
					}
					
					// Is it leader or not?
					else if (!equalTeam_mode) {
						if (spawned == 1 and team) {
							with (spawnedCreature)
								make_creature_leader(withLeader)
						}
						else if (team) {
							with (spawnedCreature) {
								leader = ds_list_find_value(spawnedCreatures, 0)
								leadColor = leader.leadColor
								bonusExperienceRate += 0.2
							}
						}
					}
		
					break
				}
			}
			else
				break
		}
	
		if (bossSpawned) {
			
		}
		else if (count == 0 and spawned == 1 or count == spawned or !team and spawned == 1) {
			#region If it was a team, set their team list for each creature.
			if (team) {
				var ds_size = ds_list_size(spawnedCreatures)
				for (var i = 0; i < ds_size; i++)
					with (ds_list_find_value(spawnedCreatures, i)) {
						ds_list_copy(allies, spawnedCreatures)
						ai_protectors_remove(id)
					}
			}
			#endregion
		}
		else {
			show_debug_message("A group of creature has been removed because the count didn't match.")
			
			var ds_size = ds_list_size(spawnedCreatures)
			for (var i = 0; i < ds_size; i++) {
				with (ds_list_find_value(spawnedCreatures, i)) {
					forTest = true
					instance_destroy()
				}
			}
		}
		
		ds_list_destroy(spawnedCreatures)
		
		if (spawned > 0) {
			var addTime = 1
			with (contCreatureSpawn) {
				if (id == other.id)
					continue
				
				var beforeAlarm = alarm[0]
			
				delta_alarm(0, round(spawnTime/2)+1+addTime)
			
				if (beforeAlarm > alarm[0])
					alarm[0] = beforeAlarm
				
				addTime++
			}
		}
		
		delta_alarm(0, spawnTime)
	}
	else
		delta_alarm(0, spawnTime)
}
else
	delta_alarm(0, sec/6)