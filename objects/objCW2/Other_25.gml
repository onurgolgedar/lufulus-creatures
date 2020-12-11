event_inherited()

if (room != roomLufulus and instance_exists(contWaveSpawn)) {
	instance_destroy(contWaveSpawn)
	
	with (objPlayer)
		change_hp(global.maxHp)
	
	with (parCreature)
		if (target == objPlayer.id and id != other.id)
			ai_target_destroy(true)
}