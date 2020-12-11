init_target_statistics()

name = npc_lordred
tag = "Lord"

level = 35
experience = 0
money = 0

range = 120
spd = 8.6

forceFactor = 9.84
dashPower = 4.8/forceFactor
combatExperience = 80

type = type_npc
subtype = stype_npc

attackSpeed = 1.7
event_inherited()
physicalPower = 700
weapon = sprSw_015

mode = md_waiting

maxHp = 7000
hp = maxHp

armor = 70
resistance = 70

#region RIGIDBODY
var shoulders_obj = objShoulders_rbt1

var arm_obj = objArm_rbt1
var arm_dis = 30

var frontArm_obj = objFrontArm_rbt1
var frontArm_dis = 24

var hand_obj = objHand_rbt1
var hand_dis = 40

rigidbody_set_type1(shoulders_obj,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis)
rigidbody_set_definedstance_type1(stSerious)
#endregion

shoulders.sprite_index = sprClot_019
leftArm[0].sprite_index = sprClothesArm
rightArm[0].sprite_index = sprClothesArm
hair = sprHair_red

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
strike_initiate(dashPower*5.2, 1)
turtle_initiate()

event_user(3)