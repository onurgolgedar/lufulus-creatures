#region RIGIDBODY
var body_obj = objB2Body
var body_dis = 7

var arm_obj = objB2Arm
var arm_dis = 8

var frontArm_obj = objB2FrontArm
var frontArm_dis = 0

var hand_obj = objB2Hand
var hand_dis = 27

var arm_offsetX = 10

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()