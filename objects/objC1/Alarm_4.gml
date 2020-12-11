#region RIGIDBODY
var body_obj = objC0Body
var body_dis = irandom_range(5, 7)

var arm_obj = objC1Arm
var arm_dis = irandom_range(14, 18)

var frontArm_obj = objC1FrontArm
var frontArm_dis = irandom_range(16, 20)

var hand_obj = objC1Hand
var hand_dis = 22

var arm_offsetX = irandom_range(3, 6)

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()

body.image_alpha = 0