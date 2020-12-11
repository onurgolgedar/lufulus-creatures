if (sprite_index == sprCreatureBasicMagic) {
	efCol1 = c_yellow
	efCol2 = c_orange
	efCol3 = c_olive
}
else if (sprite_index == sprCreatureBasicMagic2) {
	efCol1 = c_blue
	efCol2 = c_aqua
	efCol3 = c_aqua
}
else if (sprite_index == sprCreatureBasicMagic3) {
	efCol1 = c_fuchsia
	efCol2 = c_purple
	efCol3 = c_white
}
else if (sprite_index == sprCreatureBasicMagic4) {
	efCol1 = c_red
	efCol2 = c_maroon
	efCol3 = c_customred2
}
else if (sprite_index == sprCreatureBasicMagic5) {
	efCol1 = c_green
	efCol2 = c_lime
	efCol3 = c_ltgreen
}

phy_rotation = -point_direction(0, 0, phy_speed_x, phy_speed_y)

part_type_color3(pt_magic_Effect1, efCol1, efCol2, efCol3)
if (instance_exists(owner))
	part_type_size(pt_magic_Effect1, 0.3+0.3*owner.level/30, 0.5+0.5*owner.level/30, 0, 0)