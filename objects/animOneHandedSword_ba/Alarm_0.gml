with (owner) {
	if (basicAttackStyle == 0)
		rigidbody_set_definedstance_type1(stBasicAttack_ohsword, sec/24)
	else if (basicAttackStyle == 1)
		rigidbody_set_definedstance_type1(stBasicAttack_ohsword_2, sec/24)
	else if (basicAttackStyle == 2)
		rigidbody_set_definedstance_type1(stBasicAttack_ohsword_3, sec/24)
		
	if (basicAttackStyle < 2) basicAttackStyle += 1 else basicAttackStyle = 0
}

var sound = sound_play_at(sndSwordSwing, owner.x, owner.y, false)
audio_sound_pitch(sound, owner.basicAttackStyle == 0 ? 1.2 : random_range(0.85, 1.05))
	
delta_alarm(1, sec/24+delay-1)
delta_alarm(2, sec/24+delay)