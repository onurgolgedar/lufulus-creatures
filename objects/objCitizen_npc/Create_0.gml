/*
	FOR ONLY CITIZENS RESITUATION IS INCREASED AND LINEAR DAMPING IS DECREASED.
*/
chosenFlag_real = pointer_null

init_target_statistics()

name = ""
tag = ""

level = 1
experience = 0
money = 0

range = 80
spd = 1+random(1.5)

forceFactor = 9.84

type = type_npc
subtype = stype_npc

attackSpeed = 1
event_inherited()
physicalPower = 1

mode = md_waiting

maxHp = 100
hp = maxHp

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
rigidbody_noarms_type1()
#endregion

image_xscale = 0.86
image_yscale = image_xscale

hair = choose(sprHair2, sprHair3, sprHair4, sprHair5, sprHair6, sprHair7, sprHair8, sprHair9, sprHair10, sprHair12, sprHair13, sprHair15, sprHair19, sprHair21)
if (irandom(4) == 0)
	shoulders.sprite_index = (room == roomCastle_area) ? choose(sprClot_001, sprClot_003) : choose(sprClothes7_npc, sprClothes8_npc)
else
	shoulders.sprite_index = (room == roomCastle_area) ? sprClothes_npc : sprClothes2_npc
if (irandom(2) == 0 and sprite_index != sprClothes_npc) {
	leftArm[0].sprite_index = (room == roomCastle_area) ? sprClothesArm4 : sprClothesArm5
	rightArm[0].sprite_index = (room == roomCastle_area) ? sprClothesArm4 : sprClothesArm5
}
stopDis_citizen = irandom_range(90, 130)

#region FIXED
qKey = 0

quests = false

targetAngle = image_angle
#endregion

alarm[2] = irandom_range(2*sec, 15*sec)

visible = false