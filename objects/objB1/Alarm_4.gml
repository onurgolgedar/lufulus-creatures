#region RIGIDBODY
var body_obj = objB1Body
var body_dis = 11

var arm_obj = objB1Arm
var arm_dis = 15

var frontArm_obj = objB1FrontArm
var frontArm_dis = 27

var hand_obj = objB1Hand
var hand_dis = 27

var arm_offsetX = 5

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()