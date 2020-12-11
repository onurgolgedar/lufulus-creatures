init_target_statistics()

name = eng() ? "Guard" : "Gardiyan"
tag = ""

inWarzone = instance_exists(contWarzone)
level = 25
experience = calculate_creature_exp(level)
money = 40-inWarzone*20

range = 270
spd = 6.5
superDistance = true

forceFactor = 9.84
dashPower = 4.5/forceFactor
combatExperience = 70

type = type_npc
subtype = stype_npc

attackSpeed = 1
event_inherited()
physicalPower = 224
weapon = sprCrossbow_003
isRanged = true
precisionError = 14

mode = md_waiting

maxHp = 2800
hp = maxHp

armor = 25
resistance = 25

#region RIGIDBODY
var shoulders_obj = objShoulders_rbt1

var arm_obj = objArm_rbt1
var arm_dis = 26

var frontArm_obj = objFrontArm_rbt1
var frontArm_dis = 22

var hand_obj = objHand_rbt1
var hand_dis = 40

rigidbody_set_type1(shoulders_obj,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis)
rigidbody_set_definedstance_type1(stSerious)
#endregion

image_xscale = 0.87
image_yscale = image_xscale

shoulders.sprite_index = sprClot_006
leftArm[0].sprite_index = sprClothesArm2
rightArm[0].sprite_index = sprClothesArm2
hair = choose(sprHair3, sprHair6, sprHair12)

#region FIXED
qKey = 0

quests = false

targetAngle = image_angle
#endregion

#region FIXED PROTECTION
protectionList = -1
#endregion

grouping_initiate()
fury_initiate()

var bowControl = instance_create(x, y, objCrossbowControl)
bowControl.owner = id
bowControl.weaponSprite = weapon
			
bowControl.addRopeDis = 0