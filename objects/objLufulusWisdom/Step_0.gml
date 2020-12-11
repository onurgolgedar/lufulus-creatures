event_inherited()

if (inView and !death) {
	with (objPlayer) {
		var dis = point_distance(other.x, other.y, x, y)
		if (dis < 200) {
			var angle = point_direction(other.x, other.y, x, y)
			var powr = phy_mass*20*4000000/(dis*dis*dis)
			physics_apply_force(phy_com_x, phy_com_y, 
			lengthdir_x(powr, angle),
			lengthdir_y(powr, angle))
		}
	}
}