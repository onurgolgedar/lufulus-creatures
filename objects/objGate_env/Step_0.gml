var turn_ad = angle_difference(phy_rotation, -targetAngle)
if (abs(turn_ad) >= 2)
	phy_angular_velocity = -40*sign(turn_ad)*(abs(turn_ad)-2)/14