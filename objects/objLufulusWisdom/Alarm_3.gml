if (spawnHeart_effect != pointer_null) {
	destroy_effect(spawnHeart_effect, sec/2)
	spawnHeart_effect = pointer_null
}

if (bright != pointer_null) {
	instance_destroy(bright)
	bright = pointer_null
}
	
ai_direct_delete()