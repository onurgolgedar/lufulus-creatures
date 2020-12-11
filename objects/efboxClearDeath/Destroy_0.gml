event_inherited()
	
with (efboxDeath) {
	fm_delete(13)
	instance_destroy()
}

if (is_outfight()) {
	with (objPlayer)
		change_hp(global.maxHp)
}