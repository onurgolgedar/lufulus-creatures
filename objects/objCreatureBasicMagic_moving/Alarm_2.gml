var impulse = 0.2
physics_apply_impulse(phy_com_x, phy_com_y,
lengthdir_x(impulse, -phy_rotation),
lengthdir_y(impulse, -phy_rotation))

delta_alarm(2, 18)