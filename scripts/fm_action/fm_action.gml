/// @param fMNo
function fm_action() {

	if (argument[0] == 0) {		
		repeat(2) {
			var spawnedCreature = creature_spawn_outview(objC0)
			with (spawnedCreature) {
				ai_reaction(objScoutRoad_npc.id, true)
				stop_moving(irandom(1.5*sec))
			}
		}
	
		with (objScoutRoad_npc) {
			if (!death) {
				change_hp(maxHp*3/4-hp)
				healthBarP = hp/maxHp
			}
			
			startX = x
			startY = y
		}
	}
	else if (argument[0] == 4) {
		fm_add(5, true)
	}
	else if (argument[0] == 5) {
		fm_delete(4)
		fm_delete(5)
	}


}
