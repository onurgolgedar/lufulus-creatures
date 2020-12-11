event_inherited()
moves = ds_list_create()
bars = ds_list_create()

startX = x
startY = y
roamRange = irandom_range(250, 350)

range_base = range
//rangeMelee = range

target = pointer_null
targetPointDir = 0
posDir = 0
targetPosX = 0
targetPosY = 0

if (room == roomForceFactorTest)
	roamRotation = 0
else
	roamRotation = irandom(359)

mode = md_calm
xLastSeen = 0
yLastSeen = 0
directionLast = 0
canSee = false
lakeBetween = false
isSearching = false
searchingRotation = choose(-1, 1)
searchingSpeed = random_range(1, 2.5)
targetPointInRange = false
extraBasicTry = false
isRanged = (subtype == stype_gronel) or (subtype == stype_gorkrim)
basicMagicSprite = sprCreatureBasicMagic
nearList = pointer_null
leadColor = c_black

excMark = -1

activeSpeed = 0
activeRange = range
activeAttackSpeed = attackSpeed/(1+isRanged*0.5)

speedFactor = 1

experience = calculate_creature_exp(level)*(1+bonusExperienceRate)
baseExperience = experience

hp = maxHp
attacktimer_set_max()

healthBar_blend = c_white
healthBarP = 1
pathFollower = instance_create(x, y, contPathFollower)
pathFollower.owner = id
pathFollower.no = -1
lastPathNo = -1
waitingMessage = ""

levelColor = c_white

isRightHanded = irandom(1)

if (room == roomForceFactorTest) {
	forceFactor = 7
	spd = 2
	delta_alarm(7, sec/1.2)
}
else
	alarm[7] = 1+irandom(2*sec)

delta_alarm(6, 1+irandom(3*sec))
delta_alarm(5, sec/15)
alarm[4] = 1 // After calculations

image_speed = 0