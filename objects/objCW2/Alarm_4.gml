#region RIGIDBODY
var body_obj = objC0Body
var body_dis = 7

var arm_obj = objCW2Arm
var arm_dis = 14

var frontArm_obj = objCW2FrontArm
var frontArm_dis = 15

var hand_obj = objCW2Hand
var hand_dis = 25

var arm_offsetX = irandom_range(0, 2)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

body.image_alpha = 0

event_inherited()