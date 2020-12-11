#region RIGIDBODY
var body_obj = objLufulusBody
var body_dis = 9

var arm_obj = objLufulusArm
var arm_dis = 17

var frontArm_obj = objLufulusFrontArm
var frontArm_dis = 27

var hand_obj = objLufulusHand
var hand_dis = 28

var arm_offsetX = 15

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_baBase()
#endregion

event_inherited()