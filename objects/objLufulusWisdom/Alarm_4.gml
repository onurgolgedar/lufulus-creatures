#region RIGIDBODY
var body_obj = objC0Body
var body_dis = 0

var arm_obj = objC0Arm
var arm_dis = 0

var frontArm_obj = objC0FrontArm
var frontArm_dis = 0

var hand_obj = objC0Hand
var hand_dis = 0

var arm_offsetX = irandom_range(3, 6)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()

body.image_alpha = 0
leftHand.image_alpha = 0
rightHand.image_alpha = 0
leftArm[0].image_alpha = 0
leftArm[1].image_alpha = 0
rightArm[0].image_alpha = 0
rightArm[1].image_alpha = 0

spawnHeart_effect = instance_create(x, y, efLufulusWisdom)
drop_lists_clear()

baseExperience = calculate_creature_exp(room_get_level(room))*20
experience = baseExperience

bright = instance_create_layer(x, y, "lyBelowGUI", objBrightArea)
bright.image_xscale = 1
bright.image_yscale = 1