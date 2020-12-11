if (alarm[1] < 1 and (moving > 0 or dis < 210)) {
	if (moving < 50)
		moving += 0.75
		
	var playerRot = point_direction(x, y, objPlayer.x, objPlayer.y)
	phy_rotation = -playerRot
	
	physics_apply_force(phy_com_x, phy_com_y, lengthdir_x(moving+stSp, playerRot), lengthdir_y(moving+stSp, playerRot))
}

if (currentFrame_sparkle+delta()/2 >= 32) 
    currentFrame_sparkle = 0
else 
	currentFrame_sparkle += delta()/2