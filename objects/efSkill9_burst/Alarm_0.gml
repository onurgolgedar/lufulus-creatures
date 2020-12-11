
//Creating Particle Types
//Effect1
pt_blood_Effect1 = part_type_create();
part_type_sprite(pt_blood_Effect1, spr_pt_shape_disk, 0, 0, 0);
part_type_size(pt_blood_Effect1, 4.3+skillUpgrade*0.2, 4.3+skillUpgrade*0.2, -0.13, 0.2);
part_type_scale(pt_blood_Effect1, 1, 1);
part_type_orientation(pt_blood_Effect1, 0, 360, 0, 0, 0);
part_type_color3(pt_blood_Effect1, c1, c2, c3);
part_type_alpha3(pt_blood_Effect1, 0.4, 0.2, 0);
part_type_blend(pt_blood_Effect1, 0);
part_type_life(pt_blood_Effect1, 30, 30);
part_type_speed(pt_blood_Effect1, 0, 0, 0, 0);
part_type_direction(pt_blood_Effect1, 0, 360, 0, 0);
part_type_gravity(pt_blood_Effect1, 0, 0);

//Effect2
pt_blood_Effect2 = part_type_create();
part_type_sprite(pt_blood_Effect2, sprBlood_2, 0, 0, 0);
part_type_size(pt_blood_Effect2, 3.5+skillUpgrade*0.1, 4.5+skillUpgrade*0.2, -0.15, 0);
part_type_scale(pt_blood_Effect2, 1, 1);
part_type_orientation(pt_blood_Effect2, 0, 360, 0, 0, 0);
part_type_color3(pt_blood_Effect2, c1, c2, c3);
part_type_alpha3(pt_blood_Effect2, 1, 0.70, 0);
part_type_blend(pt_blood_Effect2, 1);
part_type_life(pt_blood_Effect2, 20, 30);
part_type_speed(pt_blood_Effect2, 0, 1, 0, 0);
part_type_direction(pt_blood_Effect2, 0, 360, choose(1, -1), 0);
part_type_gravity(pt_blood_Effect2, 0.20, 135);

//Effect3
pt_blood_Effect3 = part_type_create();
part_type_sprite(pt_blood_Effect3, sprBlood_3, 0, 0, 0);
part_type_size(pt_blood_Effect3, 1.7+skillUpgrade*0.05, 1.7+skillUpgrade*0.05, 0.10, 1);
part_type_scale(pt_blood_Effect3, 1, 1);
part_type_orientation(pt_blood_Effect3, 0, 360, 0, 0, 0);
part_type_color3(pt_blood_Effect3, c1, c2, c3);
part_type_alpha3(pt_blood_Effect3, 0.59, 0.42, 0);
part_type_blend(pt_blood_Effect3, 0);
part_type_life(pt_blood_Effect3, 22, 22);
part_type_speed(pt_blood_Effect3, 0, 1, 0, 0);
part_type_direction(pt_blood_Effect3, 0, 360, choose(1, -1), 0);
part_type_gravity(pt_blood_Effect3, 0.80, 152);

var dir
if (causedBy != pointer_null) {
	dir = point_direction(causedBy.x, causedBy.y, x, y);
	part_type_gravity(pt_blood_Effect2, 1, dir);
	part_type_gravity(pt_blood_Effect3, 1, dir);
}
else {
	dir = -90+up*180;
	part_type_gravity(pt_blood_Effect2, 1, dir);
	part_type_gravity(pt_blood_Effect3, 1, dir);
}

//Creating Emitters
pe_Effect1 = part_emitter_create(ps);

//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(ps, pe_Effect1, xp-20, xp+20, yp-20, yp+20, ps_shape_ellipse, ps_distr_linear);

var count = 4+global.performanceMode*2+skillUpgrade*0.34
part_particles_create(ps, x, y, pt_blood_Effect1, 2+skillUpgrade*0.34);
part_emitter_burst(ps, pe_Effect1, pt_blood_Effect2, count);
part_emitter_burst(ps, pe_Effect1, pt_blood_Effect3, count);