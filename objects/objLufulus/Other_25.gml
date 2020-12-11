event_inherited()

with (objPlayer)
	change_hp(global.maxHp)
	
with (parCreature)
	if (target == objPlayer.id)
		ai_target_destroy(true)
		
instance_destroy(contWaveSpawn)