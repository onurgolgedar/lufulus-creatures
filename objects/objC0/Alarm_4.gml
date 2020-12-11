#region RIGIDBODY
var body_obj = objC0Body
var body_dis = 0

var arm_obj = objC0Arm
var arm_dis = irandom_range(9, 11)

var frontArm_obj = objC0FrontArm
var frontArm_dis = 12

var hand_obj = objC0Hand
var hand_dis = 14

var arm_offsetX = irandom_range(2, 3)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()

body.image_alpha = 0