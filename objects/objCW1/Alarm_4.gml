#region RIGIDBODY
var body_obj = objCW1Body
var body_dis = 7

var arm_obj = objCW1Arm
var arm_dis = 14

var frontArm_obj = objCW1FrontArm
var frontArm_dis = 14

var hand_obj = objCW1Hand
var hand_dis = 28

var arm_offsetX = irandom_range(3, 6)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()