init_target_statistics()

name = npc_goore
tag = eng() ? "Lieutenant" : "General"

level = 2
experience = 0
money = 0

range = 300
spd = 6.5
superDistance = true

forceFactor = 9.84
dashPower = 4.1/forceFactor
combatExperience = 80

type = type_npc
subtype = stype_npc

attackSpeed = 1.3//0.5
event_inherited()
physicalPower = 422
weapon = sprCrossbow_005
isRanged = true
precisionError = 5

mode = md_waiting

maxHp = 2750
hp = maxHp

armor = 30
resistance = 30

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

image_xscale = 0.89
image_yscale = image_xscale

shoulders.sprite_index = sprClothes6_npc
hair = sprHair9

#region FIXED
qKey = 0

quests = false

targetAngle = image_angle
#endregion

#region FIXED (FOR QUEST)
quests = ds_list_create()
availableQuests = ds_list_create()
availableQuests_desc = ds_list_create()
finishedQuests = ds_list_create()
event_perform(ev_other, ev_user1)
#endregion

grouping_initiate()
fury_initiate()

var bowControl = instance_create(x, y, objCrossbowControl)
bowControl.owner = id
bowControl.weaponSprite = weapon
			
bowControl.addRopeDis = 0