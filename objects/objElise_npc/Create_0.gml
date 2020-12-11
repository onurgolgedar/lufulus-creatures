init_target_statistics()

name = npc_elise
tag = eng() ? "Lord's Daugther" : "Lord'un Kızı"

level = 15
experience = 0
money = 0

range = 100
spd = 6

forceFactor = 9.84

type = type_npc
subtype = stype_npc

attackSpeed = 1.5
event_inherited()
physicalPower = 155
weapon = sprSw_elise

mode = md_waiting

maxHp = 1400
hp = maxHp

armor = 15
resistance = 15

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

image_xscale = 0.86
image_yscale = 0.86

leftArm[0].sprite_index = sprClothesArm
rightArm[0].sprite_index = sprClothesArm
shoulders.sprite_index = sprClothes4_npc
hair = sprHair_elise

leftArm[0].image_yscale = 0.85
rightArm[0].image_yscale = 0.85

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
strike_initiate(dashPower*4, 1.5)
turtle_initiate()