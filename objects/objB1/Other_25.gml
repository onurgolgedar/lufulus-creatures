event_inherited()

if (room != roomLufulus) {
	with (objPlayer)
		change_hp(global.maxHp)
	
	with (parCreature)
		if (target == objPlayer.id)
			ai_target_destroy(true)
}