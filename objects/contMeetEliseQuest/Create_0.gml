followLight = pointer_null
sound[0] = pointer_null
sound[1] = pointer_null
sound[2] = pointer_null
sound[3] = pointer_null

beforeExpRatio = global.add_expRatio

alarm[0] = 1
delta_alarm(5, 1*sec)

danger = 0
dangerLimit = 12
drawCircle = false

beforeImmortality = global.immortality
beforeShowGUI = global.showGUI

fm_add(11)

circleQuality = 40+global.performanceMode*7