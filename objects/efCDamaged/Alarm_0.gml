
//Creating Particle Types
//Effect1
pt_blood_Effect1 = part_type_create();
part_type_sprite(pt_blood_Effect1, sprBlood_1, 0, 0, 0);
part_type_size(pt_blood_Effect1, 1.05, 2, -0.14, 0);
part_type_scale(pt_blood_Effect1, 1, 1);
part_type_orientation(pt_blood_Effect1, 0, 360, 0, 0, 0);
part_type_color3(pt_blood_Effect1, c1, c2, c3);
part_type_alpha3(pt_blood_Effect1, 1, 0.62, 0);
part_type_blend(pt_blood_Effect1, 1);
part_type_life(pt_blood_Effect1, 16, 22);
part_type_speed(pt_blood_Effect1, 0.70, 1.50, 0, 0);
part_type_direction(pt_blood_Effect1, 0, 360, 0, 0);
part_type_gravity(pt_blood_Effect1, 0.50, 150);

//Effect2
pt_blood_Effect2 = part_type_create();
part_type_sprite(pt_blood_Effect2, sprBlood_2, 0, 0, 0);
part_type_size(pt_blood_Effect2, 3.3, 4, -0.14, 0);
part_type_scale(pt_blood_Effect2, 1, 1);
part_type_orientation(pt_blood_Effect2, 0, 360, 0, 0, 0);
part_type_color3(pt_blood_Effect2, c1, c2, c3);
part_type_alpha3(pt_blood_Effect2, 1, 0.70, 0);
part_type_blend(pt_blood_Effect2, 0);
part_type_life(pt_blood_Effect2, 16, 22);
part_type_speed(pt_blood_Effect2, 0.70, 1.50, 0, 0);
part_type_direction(pt_blood_Effect2, 0, 360, 0, 0);
part_type_gravity(pt_blood_Effect2, 0.20, 135);

//Effect3
pt_blood_Effect3 = part_type_create();
part_type_sprite(pt_blood_Effect3, sprBlood_3, 0, 0, 0);
part_type_size(pt_blood_Effect3, 1.1, 2, -0.14, 1);
part_type_scale(pt_blood_Effect3, 1, 1);
part_type_orientation(pt_blood_Effect3, 0, 360, 0, 0, 0);
part_type_color3(pt_blood_Effect3, c1, c2, c3);
part_type_alpha3(pt_blood_Effect3, 0.59, 0.42, 0);
part_type_blend(pt_blood_Effect3, 0);
part_type_life(pt_blood_Effect3, 17, 17);
part_type_speed(pt_blood_Effect3, 0.70, 1.50, 0, 0);
part_type_direction(pt_blood_Effect3, 0, 360, 0, 0);
part_type_gravity(pt_blood_Effect3, 0.80, 152);

var dir
if (causedBy != pointer_null) {
	dir = point_direction(causedBy.x, causedBy.y, x, y);
	part_type_gravity(pt_blood_Effect1, 0.8, dir-4);
	part_type_gravity(pt_blood_Effect2, 0.8, dir);
	part_type_gravity(pt_blood_Effect3, 0.8, dir+4);
}
else {
	dir = -90+up*180;
	part_type_gravity(pt_blood_Effect1, 0.55, dir-4);
	part_type_gravity(pt_blood_Effect2, 0.55, dir);
	part_type_gravity(pt_blood_Effect3, 0.55, dir+4);
}

//Creating Emitters
pe_Effect1 = part_emitter_create(ps);

//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(ps, pe_Effect1, xp-14, xp+14, yp-14, yp+14, ps_shape_ellipse, ps_distr_invgaussian);

var count = 2+global.performanceMode
part_emitter_burst(ps, pe_Effect1, pt_blood_Effect2, count+1);
part_emitter_burst(ps, pe_Effect1, pt_blood_Effect1, count);
part_emitter_burst(ps, pe_Effect1, pt_blood_Effect3, count);