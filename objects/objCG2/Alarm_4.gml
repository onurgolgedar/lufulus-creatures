#region RIGIDBODY
var body_obj = objCG2Body
var body_dis = 0

var arm_obj = objCG2Arm
var arm_dis = irandom_range(12, 14)

var frontArm_obj = objCG2FrontArm
var frontArm_dis = irandom_range(16, 18)

var hand_obj = objCG2Hand
var hand_dis = 17

var arm_offsetX = irandom_range(2, 4)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

body.image_alpha = 0

event_inherited()