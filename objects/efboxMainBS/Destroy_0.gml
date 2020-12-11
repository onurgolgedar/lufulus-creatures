event_inherited()

global.skillBar = 0

contPlayer.drawMainBS = false
objPlayer.phy_linear_damping = 7

objPlayer.damageReduction = (objPlayer.damageReduction-myDmgRed)/(1-myDmgRed/100)