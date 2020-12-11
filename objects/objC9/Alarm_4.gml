#region RIGIDBODY
var body_obj = objC0Body
var body_dis = 0

var arm_obj = objC9Arm
var arm_dis = irandom_range(15, 17)

var frontArm_obj = objC9FrontArm
var frontArm_dis = irandom_range(20, 22)

var hand_obj = objC9Hand
var hand_dis = 22

var arm_offsetX = irandom_range(0, 3)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

body.image_alpha = 0

event_inherited()