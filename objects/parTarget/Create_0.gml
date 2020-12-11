death = false
playerKilledMe = false
target = pointer_null
canSee = true
at_from = pointer_null

isProtector = false
protection_owner = pointer_null
protector_posX = 0
protector_posY = 0

wound = false
invisibility = false

rigidbody_init()

mode = md_nothing
defaultMode = md_calm
isAggressive = false
teamNo = -1
boss = false

isLeader = false
isLeader_hard = false
leader = pointer_null
isSpecial = false
hasDropList = false
scale_factor = 1
stunned = false
freezed = false
slowFactor = 1

inView = true
allies = ds_list_create()

isDropEnrichment_needed = -1
isDrop_needed = -1

targetsPotential = ds_list_create()
targetsPotential_points = ds_list_create()
targetLock = 0

pose[0] = false
pose[1] = false
pose[2] = false
pose[3] = false
pose[4] = false
pose[5] = false
myPose = -1
freePoseMode = false

weaponAlpha = 1
stopMoving = false
stopMovingTimer = 0
forTest = false
animationController = pointer_null

isQuestTarget = false
isQuestTarget_direct = false // be careful, must be used manually (not by scripts)
test_quest_target()