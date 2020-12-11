#region RIGIDBODY
var body_obj = objC8Body
var body_dis = irandom_range(5, 7)

var arm_obj = objC8Arm
var arm_dis = irandom_range(12, 14)

var frontArm_obj = objC8FrontArm
var frontArm_dis = irandom_range(15, 17)

var hand_obj = objC8Hand
var hand_dis = 24

var arm_offsetX = irandom_range(-5, -7)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()