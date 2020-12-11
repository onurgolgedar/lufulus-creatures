image_alpha = 1.8
xscale = 1
yscale = 1
angle = irandom_range(-3, 3)

xImpulse = 0
yImpulse = 0

excl = false
short = false
str = ""
isCircle = false

alarm[1] = 1

delta_alarm(0, 20)
alarm_max[0] = alarm[0]

depth = -500

if (!global.showGUI)
	instance_destroy()