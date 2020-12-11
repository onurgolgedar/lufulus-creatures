#region RIGIDBODY
var body_obj = objCW3Body
var body_dis = 9

var arm_obj = objCW3Arm
var arm_dis = 15

var frontArm_obj = objCW3FrontArm
var frontArm_dis = 22

var hand_obj = objCW3Hand
var hand_dis = 17

var arm_offsetX = -6

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()