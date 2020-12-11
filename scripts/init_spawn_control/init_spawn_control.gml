function init_spawn_control() {
#region Room Creature 0
	if (room == roomCreature0) {
		bossObject = ds_list_find_index(global.takenBosses, object_get_name(objB1)) == -1 ? objB1 : objB2
	
		if (argument[0] == 0) {
			creature = objC0
			limit = 15

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 1) {
			creature = objC1
			limit = 8

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 2) {
			creature = objC0
			limit = 21

			team = true
			with_leader_chance = 11
			count = 3
			secCreature = objC0

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
	}
#endregion
#region Room Creature
	else if (room == roomCreature) {
		bossObject = ds_list_find_index(global.takenBosses, object_get_name(objB1)) == -1 ? objB1 : objB2
	
		if (argument[0] == 0) {
			creature = objC1
			limit = 15

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 1) {
			creature = objC2
			limit = 11

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 2) {
			creature = objC1
			limit = 18

			team = true
			with_leader_chance = 11
			count = 3
			secCreature = objC0

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq/**(1+team)*/
			delta_alarm(0, spawnTime)
		}
	}
#endregion
#region Room Creature 2
	else if (room == roomCreature2) {
		bossObject = ds_list_find_index(global.takenBosses, object_get_name(objB1)) == -1 ? objB1 : objB2
	
		if (argument[0] == 0) {
			creature = objC1
			limit = 16

			team = true
			with_leader_chance = 11
			count = 4
			secCreature = objC1

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 1) {
			creature = objC2
			limit = 14

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 2) {
			creature = objC1
			limit = 14

			team = true
			with_leader_chance = 20
			count = 7
			secCreature = objC0

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq/**(1+team)*/
			delta_alarm(0, spawnTime)
		}
	}
#endregion
#region Room Creature 3
	else if (room == roomCreature3) {
		bossObject = ds_list_find_index(global.takenBosses, object_get_name(objB1)) == -1 ? objB1 : objB2
	
		if (argument[0] == 0) {
			creature = objC2
			limit = 15

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 1) {
			creature = objC2
			limit = 18

			team = true
			with_leader_chance = 11
			count = 2
			secCreature = objC1

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 2) {
			creature = objC3
			limit = 14

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 3) {
			creature = objC2
			limit = 20

			team = true
			with_leader_chance = 11
			count = 4
			secCreature = objC1

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
	}
#endregion
#region Room Creature 4
	else if (room == roomCreature4) {
		bossObject = ds_list_find_index(global.takenBosses, object_get_name(objB1)) == -1 ? objB1 : objB2
	
		if (argument[0] == 0) {
			creature = objC3
			limit = 16

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 1) {
			creature = objC3
			limit = 15

			team = true
			with_leader_chance = 11
			count = 3
			secCreature = objC1

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 2) {
			creature = objC4
			limit = 12

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 3) {
			creature = objC3
			limit = 14

			team = true
			with_leader_chance = 11
			count = 2
			secCreature = objC2

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
	}
#endregion
#region Room Creature 5
	else if (room == roomCreature5) {
		bossObject = ds_list_find_index(global.takenBosses, object_get_name(objB1)) == -1 ? objB1 : objB2
	
		if (argument[0] == 0) {
			creature = objC4
			limit = 15

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 1) {
			creature = objC4
			limit = 15

			team = true
			with_leader_chance = 11
			count = 3
			secCreature = objC2

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 2) {
			creature = objC5
			limit = 13

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 3) {
			creature = objC4
			limit = 16

			team = true
			with_leader_chance = 11
			count = 2
			secCreature = objC3

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
	}
#endregion
#region Room Creature 6
	else if (room == roomCreature6) {
		bossObject = ds_list_find_index(global.takenBosses, object_get_name(objB1)) == -1 ? objB1 : objB2
	
		if (argument[0] == 0) {
			creature = objCG1
			limit = 36

			team = true
			with_leader_chance = 0
			count = 6
			secCreature = objCG1

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 1) {
			creature = objC5
			limit = 14

			team = true
			with_leader_chance = 11
			count = 2
			secCreature = objC4

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 2) {
			creature = objC6
			limit = 14

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 3) {
			creature = objC5
			limit = 20

			team = true
			with_leader_chance = 11
			count = 4
			secCreature = objC3

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 4) {
			creature = objCA1
			limit = 7

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
	}
#endregion
#region Room Creature 7
	else if (room == roomCreature7) {
		bossObject = ds_list_find_index(global.takenBosses, object_get_name(objB1)) == -1 ? objB1 : objB2
	
		if (argument[0] == 0) {
			creature = objC6
			limit = 16

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 1) {
			creature = objCA1
			limit = 14

			team = true
			with_leader_chance = 11
			count = 2
			secCreature = objC6

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 2) {
			creature = objCA1
			limit = 14

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 3) {
			creature = objC6
			limit = 15

			team = true
			with_leader_chance = 11
			count = 3
			secCreature = objC4

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 4) {
			creature = objC7
			limit = 6

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 5) {
			creature = objC7
			limit = 9

			team = true
			with_leader_chance = 11
			count = 3
			secCreature = objC6

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
	}
#endregion
#region Room Creature 8
	else if (room == roomCreature8) {
		bossObject = ds_list_find_index(global.takenBosses, object_get_name(objB1)) == -1 ? objB1 : objB2
	
		if (argument[0] == 0) {
			creature = objC7
			limit = 16

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 1) {
			creature = objCA1
			limit = 14

			team = true
			with_leader_chance = 11
			count = 2
			secCreature = objC6

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 2) {
			creature = objCG2
			limit = 48

			team = true
			with_leader_chance = 0
			count = 8
			secCreature = objCG2

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 3) {
			creature = objC8
			limit = 18

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 4) {
			creature = objCA2
			limit = 6

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 5) {
			creature = objC8
			limit = 9

			team = true
			with_leader_chance = 11
			count = 3
			secCreature = objC8

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
	}
#endregion
#region Room Creature 9
	else if (room == roomCreature9) {
		bossObject = ds_list_find_index(global.takenBosses, object_get_name(objB1)) == -1 ? objB1 : objB2
	
		if (argument[0] == 0) {
			creature = objC8
			limit = 12

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 1) {
			creature = objC8
			limit = 30

			team = true
			with_leader_chance = 33
			count = 6
			secCreature = objC7

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 2) {
			creature = objCG2
			limit = 36

			team = true
			with_leader_chance = 0
			count = 8
			secCreature = objCG2

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 3) {
			creature = objC9
			limit = 16

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 4) {
			creature = objC9
			limit = 24

			team = true
			with_leader_chance = 11
			count = 6
			secCreature = objC9

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 5) {
			creature = objCA2
			limit = 18

			team = true
			with_leader_chance = 11
			count = 6
			secCreature = objCA2

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
	}
#endregion
#region Room Creature 10
	else if (room == roomCreature10) {
		bossObject = ds_list_find_index(global.takenBosses, object_get_name(objB1)) == -1 ? objB1 : objB2
	
		if (argument[0] == 0) {
			creature = objC9
			limit = 12

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 1) {
			creature = objC10
			limit = 12

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 2) {
			creature = objC11
			limit = 30

			team = true
			with_leader_chance = 11
			count = 3
			secCreature = objC10

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 3) {
			creature = objC12
			limit = 16

			team = false
			with_leader_chance = 0
			count = 0
			secCreature = pointer_null

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 4) {
			creature = objC13
			limit = 24

			team = true
			with_leader_chance = 11
			count = 3
			secCreature = objC9

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
		else if (argument[0] == 5) {
			creature = objC10
			limit = 24

			team = true
			with_leader_chance = 11
			count = 6
			secCreature = objC9

			xx = 0
			xx2 = room_width
			yy = 0
			yy2 = room_height

			spawnTime = global.spawnFreq*(1+team/2)
			delta_alarm(0, spawnTime)
		}
	}
#endregion


}
