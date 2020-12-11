#region RIGIDBODY
var body_obj = objC2Body
var body_dis = irandom_range(5, 7)

var arm_obj = objC2Arm
var arm_dis = irandom_range(13, 17)

var frontArm_obj = objC2FrontArm
var frontArm_dis = irandom_range(13, 17)

var hand_obj = objC2Hand
var hand_dis = 21

var arm_offsetX = irandom_range(3, 6)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()