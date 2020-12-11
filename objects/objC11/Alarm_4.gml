#region RIGIDBODY
var arm_obj = objC11Arm
var arm_dis = irandom_range(8, 10)

var frontArm_obj = objC11FrontArm
var frontArm_dis = irandom_range(18, 20)

var hand_obj = objC11Hand
var hand_dis = 25

var arm_offsetX = irandom_range(-6, -8)

rigidbody_set_type2(pointer_null, 0,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()