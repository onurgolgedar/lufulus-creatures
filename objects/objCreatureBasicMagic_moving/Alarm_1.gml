if (sprite_index == sprCreatureBasicMagic) {
	efCol1 = c_ltyellow
	efCol2 = c_ltyellow
	efCol3 = c_ltyellow
}
else if (sprite_index == sprCreatureBasicMagic2) {
	efCol1 = c_fuchsia
	efCol2 = c_fuchsia
	efCol3 = c_fuchsia
}
else if (sprite_index == sprCreatureBasicMagic3) {
	efCol1 = c_aqua
	efCol2 = c_aqua
	efCol3 = c_aqua
}
else if (sprite_index == sprCreatureBasicMagic4) {
	efCol1 = c_navy
	efCol2 = c_navy
	efCol3 = c_navy
}
else if (sprite_index == sprCreatureBasicMagic5) {
	efCol1 = c_white
	efCol2 = c_white
	efCol3 = c_white
}

phy_rotation = -point_direction(0, 0, phy_speed_x, phy_speed_y)

part_type_color3(pt_magic_Effect1, efCol1, efCol2, efCol3);

if (instance_exists(owner))
	part_type_size(pt_magic_Effect1, 0.3+0.3*owner.level/30, 0.5+0.5*owner.level/30, -0.02, 0);