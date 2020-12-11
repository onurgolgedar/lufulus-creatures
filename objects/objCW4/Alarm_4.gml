#region RIGIDBODY
var body_obj = objCW4Body
var body_dis = 9

var arm_obj = objCW4Arm
var arm_dis = 18

var frontArm_obj = objCW4FrontArm
var frontArm_dis = 18

var hand_obj = objCW4Hand
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