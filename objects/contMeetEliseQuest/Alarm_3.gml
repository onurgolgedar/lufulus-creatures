var snd = audio_play_sound(sndExplosion, 40, false)
audio_sound_pitch(snd, random_range(0.4, 0.5))
audio_sound_pitch(snd, random_range(0.4, 0.5))

var explosion = instance_create_layer(objPlayer.x, objPlayer.y, "lyAir", objMainBS_SO2)
explosion.image_xscale = 2
explosion.image_yscale = explosion.image_xscale
explosion.bar = 100
explosion.upgrade = 0
explosion.upgSk5 = 0
explosion.upgSk6 = 0
explosion.upgSk7 = 2
explosion.addDamage = irandom_range(250, 350)

var explosion = instance_create_layer(objPlayer.x, objPlayer.y, "lyAir", objMainBS_SO2)
explosion.image_xscale = 3.5
explosion.image_yscale = explosion.image_xscale
explosion.bar = 100
explosion.upgrade = 0
explosion.upgSk5 = 0
explosion.upgSk6 = 0
explosion.upgSk7 = 1
explosion.addDamage = irandom_range(250, 350)

if (global.gamepad_active)
	gamepad_set_vibration_ext(1, 1, sec/4)
	
delta_alarm(3, irandom_range(sec/2, sec*1.5))