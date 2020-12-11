#region RIGIDBODY
var body_obj = objC4Body
var body_dis = irandom_range(6, 8)

var arm_obj = objC4Arm
var arm_dis = irandom_range(13, 15)

var frontArm_obj = objC4FrontArm
var frontArm_dis = irandom_range(14, 16)

var hand_obj = objC4Hand
var hand_dis = 25

var arm_offsetX = irandom_range(0, 2)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()