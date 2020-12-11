alarm[11] = 60
alarm[0] = 1

//Generated for GMS2 in Geon FX v0.9.0
//Put this code in Create event

//Creating Particle System
ps = part_system_create();
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5);

efCol1 = c_yellow
efCol2 = c_orange
efCol3 = c_olive

event_inherited()