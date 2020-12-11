if (isRed)
	part_type_color3(pt, c_red, c_maroon, c_black)
else if (isPurple)
	part_type_color3(pt, c_fuchsia, c_black, c_black)
	
if (isBig)
	part_type_scale(pt, 1.2, 1.2)

part_emitter_burst(ps, pe_Effect1, pt, 4+global.performanceMode+isPurple)