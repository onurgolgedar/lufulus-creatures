alarm[11] = 60

causedBy = pointer_null
up = true

c1 = c_aqua
c2 = c_fuchsia
c3 = c_purple

skillUpgrade = skill_get_upgrade(objSkill_9)

//Generated for GMS2 in Geon FX v0.9.0
//Put this code in Create event

//Creating Particle System
ps = part_system_create();
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5);

alarm[0] = 1

event_inherited()