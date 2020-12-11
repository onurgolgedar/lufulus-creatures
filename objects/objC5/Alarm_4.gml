#region RIGIDBODY
var body_obj = objC5Body
var body_dis = irandom_range(7, 10)

var arm_obj = objC5Arm
var arm_dis = irandom_range(15, 17)

var frontArm_obj = objC5FrontArm
var frontArm_dis = irandom_range(20, 24)

var hand_obj = objC5Hand
var hand_dis = 26

var arm_offsetX = irandom_range(3, 6)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()
