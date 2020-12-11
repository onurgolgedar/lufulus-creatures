arrowEffect = pointer_null
arrowSprite = sprArrow

maxSpringTension = 35
springTension = 0

image_alpha = 0
alarm[1] = 1
delta_alarm(4, sec/3)

depth += 5

ropeFree = false
arrowVisibility = 1

owner = objPlayer.id

arrowX = 0
arrowY = 0
tripleArrow = false
massiveArrow = false
glacialArrow = false
rh_center_x = 0
rh_center_y = 0
lh_center_x = 0
lh_center_y = 0
dir = 0

upgrade = (owner == objPlayer.id) ? global.itemUpgrade[global.weaponI, global.weaponJ] : 0
shiningPower = (upgrade > 5)+(upgrade > 7)