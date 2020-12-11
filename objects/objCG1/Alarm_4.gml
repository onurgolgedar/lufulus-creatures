#region RIGIDBODY
var body_obj = objCG1Body
var body_dis = 0

var arm_obj = objCG1Arm
var arm_dis = irandom_range(8, 12)

var frontArm_obj = objCG1FrontArm
var frontArm_dis = irandom_range(15, 17)

var hand_obj = objCG1Hand
var hand_dis = 16

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