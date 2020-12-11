#region RIGIDBODY
var body_obj = objC0Body
var body_dis = irandom_range(8, 10)

var arm_obj = objC12Arm
var arm_dis = irandom_range(15, 16)

var frontArm_obj = objC12FrontArm
var frontArm_dis = irandom_range(17, 19)

var hand_obj = objC12Hand
var hand_dis = 30

var arm_offsetX = irandom_range(-5, -7)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

body.image_alpha = 0

event_inherited()