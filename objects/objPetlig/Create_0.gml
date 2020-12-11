/*effect = instance_create(x, y, efMagic)
effect.owner = id
effect.target = id*/

target = -1

posDir = irandom(359)
posDis = irandom_range(30, 70)
delta_alarm(0, irandom_range(2*sec, 6*sec))

delta_alarm(1, sec/2)

var isDark = (global.sl_ambient_light < 0.2)
follow_light(id, 0.4+isDark*0.6, 4+isDark*3, true)