effect = instance_create(x, y, efMagic)
effect.owner = id
effect.target = id

target = -1

attackCount = 8

delta_alarm(0, 6)
delta_alarm(1, 10)
alarm[2] = 1

follow_light(id, 0.25, 0.7)

soundEmitter = audio_emitter_create()
sound = audio_play_sound_on(soundEmitter, sndBrain, true, 5)

audio_emitter_falloff(soundEmitter, 60, 1200, 1.9)
audio_emitter_position(soundEmitter, x, y, 0)

brainSize = 0
brainColor = c_white