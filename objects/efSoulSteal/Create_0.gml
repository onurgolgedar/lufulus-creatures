//Generated for GMS2 in Geon FX v0.9.0
//Put this code in Create event

//Creating Particle System
ps = part_system_create();
part_system_depth(ps, layer_get_depth("lyAbovePlayer")-5);

//Creating Particle Types
//manaParticleMain
pt_manaParticleMain = part_type_create();
part_type_shape(pt_manaParticleMain, pt_shape_flare);
part_type_sprite(pt_manaParticleMain, spr_pt_shape_flare, 0, 0, 0);
part_type_size(pt_manaParticleMain, 0.50, 1, 0, 0);
part_type_scale(pt_manaParticleMain, 1, 1);
part_type_orientation(pt_manaParticleMain, 0, 0, 0, 0, 0);
part_type_color3(pt_manaParticleMain, 16776960, 14794496, 16752384);
part_type_alpha3(pt_manaParticleMain, 0, 0.5, 0);
part_type_blend(pt_manaParticleMain, 1);
part_type_speed(pt_manaParticleMain, 0, 0, 0.30, 0);
part_type_life(pt_manaParticleMain, 30, 40);
part_type_speed(pt_manaParticleMain, 0, 0, 0.30, 0);
part_type_direction(pt_manaParticleMain, 0, 360, 0, 0);
part_type_gravity(pt_manaParticleMain, 0, 0);

//manaParticle
pt_manaParticle = part_type_create();
part_type_shape(pt_manaParticle, pt_shape_explosion);
part_type_sprite(pt_manaParticle, spr_pt_shape_explosion, 0, 0, 0);
part_type_size(pt_manaParticle, 0.10, 0.10, 0, 0);
part_type_scale(pt_manaParticle, 1, 1);
part_type_orientation(pt_manaParticle, 0, 0, 0, 0, 0);
part_type_color3(pt_manaParticle, 16776960, 16776960, 16776960);
part_type_alpha3(pt_manaParticle, 0.20, 0.10, 0);
part_type_blend(pt_manaParticle, 0);
part_type_life(pt_manaParticle, 10, 20);
part_type_speed(pt_manaParticle, 1, 1, 0, 0);
part_type_direction(pt_manaParticle, 0, 360, 0, 0);
part_type_gravity(pt_manaParticle, 0, 0);

//Linking Particle Types together (Death and Step)
part_type_step(pt_manaParticleMain, 1, pt_manaParticle);

//Creating Emitters
pe_manaParticleMain = part_emitter_create(ps);
part_emitter_region(ps, pe_manaParticleMain, -8, 8, -8, 8, ps_shape_rectangle, ps_distr_linear);

event_inherited()