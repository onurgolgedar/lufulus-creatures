#region RIGIDBODY
var arm_obj = objC3Arm
var arm_dis = irandom_range(10, 11)

var frontArm_obj = objC3FrontArm
var frontArm_dis = irandom_range(17, 20)

var hand_obj = objC3Hand
var hand_dis = 20

var arm_offsetX = irandom_range(3, 5)

rigidbody_set_type2(pointer_null, 0,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()