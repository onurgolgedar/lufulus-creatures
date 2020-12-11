var impulse = 0.20+0.33*(alarm[0] > alarm_max[0]/10*7)
physics_apply_impulse(phy_com_x, phy_com_y, lengthdir_x(impulse, -phy_rotation), lengthdir_y(impulse, -phy_rotation))

delta_alarm(2, 18)