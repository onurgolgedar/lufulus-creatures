with (owner)
	rigidbody_set_definedstance_type1(stSkill1_2, sec/30)
	
var sound = sound_play_at(sndSwordSwing, owner.x, owner.y, false)
audio_sound_pitch(sound, 0.8)
	
delta_alarm(1, sec/30)
delta_alarm(2, sec/30+delay)