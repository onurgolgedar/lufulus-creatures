var dust = instance_create(x, y, efDust)
dust.efCol1 = efCol1
dust.efCol2 = efCol2
dust.efCol3 = efCol3

var light = burst_light(id, 16, 0.33, 0.5)
light.sl_light_texture = sprLight
light.sl_light_color = efCol1
light.noOwner = true

var sound = sound_play_at(sndExplosion, x, y, false)
audio_sound_pitch(sound, random_range(1.2, 1.4))
audio_sound_gain(sound, 0.4, 0)