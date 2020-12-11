#region RIGIDBODY
var arm_obj = objC6Arm
var arm_dis = irandom_range(7, 9)

var frontArm_obj = objC6FrontArm
var frontArm_dis = irandom_range(19, 23)

var hand_obj = objC6Hand
var hand_dis = 22

var arm_offsetX = irandom_range(5, 7)

rigidbody_set_type2(pointer_null, 0,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()