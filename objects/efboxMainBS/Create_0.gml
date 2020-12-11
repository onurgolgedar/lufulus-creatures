event_inherited()

maxTime = -1//3*sec
time = maxTime

description = sk_0

deletable = false

contPlayer.drawMainBS = true

upgSk7 = contPlayer.upgSk7
upgSk6 = contPlayer.upgSk6
upgSk5 = contPlayer.upgSk5

objPlayer.phy_linear_damping = 15+(upgSk5 > 0 and upgSk5 < 4)*8

myDmgRed = 20+skill_get_value(objSkill_5, upgSk5, type_value2)
fastLoad = 1+skill_get_value(objSkill_6, upgSk6, type_value)/100

objPlayer.damageReduction += myDmgRed*(1-objPlayer.damageReduction/100)