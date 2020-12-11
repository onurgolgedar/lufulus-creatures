#region RIGIDBODY
var body_obj = objC10Body
var body_dis = 0

var arm_obj = objC10Arm
var arm_dis = irandom_range(15, 17)

var frontArm_obj = objC10FrontArm
var frontArm_dis = irandom_range(20, 22)

var hand_obj = objC10Hand
var hand_dis = 22

var arm_offsetX = irandom_range(0, 3)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()