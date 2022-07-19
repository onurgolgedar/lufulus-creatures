creator = pointer_null
owner = pointer_null

order = 0
level = -1
maxTime = -1
time = maxTime

directDestroy = false // Destroys all stacks when time == 0
deletable = true
permanent = false
separate = false
stackable = false
stack = -1
maxStack = -1
notNew = false
global_tab_step = false

description = ""
tbW = 0
tbH = 0
mouseOn = false
xx = 0

alarm[0] = 1
alarm[1] = 1
alarm[7] = 2

with (contGUi)
	if (colorScreenAlpha > 0)
		delta_alarm(7, sec, other)

visible = false
image_speed = 0
image_alpha = 0