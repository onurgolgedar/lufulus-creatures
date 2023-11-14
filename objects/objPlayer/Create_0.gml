init_target_statistics()
sync_localstats()

name = global.name
type = type_player

event_inherited()

teamNo = team_player

baseRange = 120
isRanged = false

hp = global.lastHp
mana = maxMana
attackTimer = 1
range = baseRange

armWeight = 1
bodyWeight = 1
basicAttackStyle = 0
shiftLock = true
shiftLock_window = false
baseShiftDecrease = 3.2
shiftDecrease = baseShiftDecrease
viewLock = false
lastRotation = 0
leftReleased = 5
leftClicked_before = false
weaponAlpha = 1
shiftMode = false
oneTimeCritical = false
isFirstAttack = true
shiningPower = 0
efboxSkill2_exists = false
sWeaponAlpha_calm = 0
sWeaponAlpha_inc = false
efColor1 = c_red
efColor2 = c_red
efColor3 = c_red
healthBarP = 1
manaBarP = 1
energyBarP = 1
crossbowWait = sec/2
mobileAutoShift = false

if (global.invisibility)
	add_effectbox(efboxInvisibility, -1, 3*sec)
	
image_speed = 0
alarm[2] = 3
alarm[4] = 1
delta_alarm(9, sec)