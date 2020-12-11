image_speed = 0
usable = true
mouseOn = position_meeting(mouse_x, mouse_y, id)

startDir = image_angle

cl = make_color_rgb(188, 117, 50)//c_dkorange//make_color_rgb((255-y/room_height*80)/1.3, (110+y/room_height*80)/1.3, 20/1.3)

rigidbody_init()

#region RIGIDBODY
var body_obj = objC0Body
var body_dis = 0

var arm_obj = objMainMenuButtonArm
var arm_dis = 0

var frontArm_obj = objMainMenuButtonFrontArm
var frontArm_dis = 84

var hand_obj = objMainMenuButtonHand
var hand_dis = 109

var arm_offsetX = 40

rigidbody_set_type2(body_obj, body_dis,
arm_obj, arm_dis,
frontArm_obj, frontArm_dis,
hand_obj, hand_dis,
arm_offsetX)
rigidbody_set_definedstance_type2(stBase2)
#endregion

alarm[0] = irandom_range(sec, sec*2)

body.image_alpha = 0