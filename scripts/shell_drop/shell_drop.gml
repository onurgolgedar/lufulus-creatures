function shell_drop() {
	if (abilityShell) {
		with (body) {
			if (!destroyed) {
				var copy = instance_create(x, y, object_index)
				copy.phy_rotation = phy_rotation
				copy.image_index = image_index
				copy.image_alpha = image_alpha
				copy.depth = depth
				copy.side = side
				delta_alarm(0, sec*2.5, copy)
				copy.alarm[10] = 1
				copy.active = false
					
				with (other)
					physics_apply_impulse(phy_com_x, phy_com_y,
					lengthdir_x(7*phy_mass, targetPointDir), lengthdir_y(7*phy_mass, targetPointDir))
				
				with (copy) {
					var angle = irandom(359)
					physics_apply_impulse(x, y, lengthdir_x(phy_mass*6, angle), lengthdir_y(phy_mass*6, angle))
				}
					
				image_alpha = 0
				destroyed = true
			}
		}
	}


}
