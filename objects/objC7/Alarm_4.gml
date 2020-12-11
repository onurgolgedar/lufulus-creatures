#region RIGIDBODY
var body_obj = objC0Body
var body_dis = irandom_range(9, 12)

var arm_obj = objC7Arm
var arm_dis = irandom_range(15, 17)

var frontArm_obj = objC7FrontArm
var frontArm_dis = irandom_range(24, 26)

var hand_obj = objC7Hand
var hand_dis = 28

var arm_offsetX = irandom_range(-10, -13)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()

body.image_alpha = 0