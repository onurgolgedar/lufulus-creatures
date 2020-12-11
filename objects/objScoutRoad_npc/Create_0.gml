init_target_statistics()

name = npc_scout
tag = eng() ? "Wounded Soldier" : "Yaralı Asker"

level = 1
experience = 0
money = 0

range = 70
spd = 3

forceFactor = 9.84

type = type_npc
subtype = stype_npc

attackSpeed = 1
event_inherited()
physicalPower = 1

mode = md_waiting

maxHp = 100
hp = maxHp*3/4

armor = 0
resistance = 0

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
rigidbody_set_definedstance_type1(stWounded)
#endregion

leftArm[1].sprite_index = sprFrontArmInjured
with (leftHand)
	instance_destroy()

shoulders.sprite_index = sprClothes_npc
hair = sprHair2

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

alarm[2] = 2

fm_add(6)
fm_add(3, true)

importance = true

dropText = eng() ? ((IS_MOBILE ? "Tap" : "Click")+" here to loot") : ("Ganimet için buraya "+(IS_MOBILE ? "dokun" : "tıkla"))+"\n"

init_droplist()

stopTick = 2