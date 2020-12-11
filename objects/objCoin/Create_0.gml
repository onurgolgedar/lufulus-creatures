phy_rotation = irandom(359)
chosen_image_index = abs(irandom(image_number-1))
moving = 0
stSp = 20
dis = 999

currentFrame_sparkle = irandom(32)
rotation_sparkle = irandom(359)

delta_alarm(0, 5)
delta_alarm(1, sec/2)

image_alpha = 0.2
image_xscale *= random_range(1.9, 2.1)
image_yscale *= image_xscale

follow_l = pointer_null
if (global.performanceMode != 0) {
	follow_l = follow_light(id, 0.5, image_xscale/12)
	follow_l.manualDestroy = true
}