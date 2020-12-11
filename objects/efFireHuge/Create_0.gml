size = 1

ps = part_system_create()
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5)

pt_Sharp = part_type_create()
pt_Soft = part_type_create()

pe_Sharp = part_emitter_create(ps)
pe_Soft = part_emitter_create(ps)

alarm[0] = 1
alarm[1] = 1

event_inherited()

sound = sound_play_at(sndFire, x, y, true)