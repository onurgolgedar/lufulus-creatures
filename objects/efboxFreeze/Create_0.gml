event_inherited()

maxTime = 1*sec
time = maxTime

description = eng() ? "Freeze" : "Donma"

deletable = false

alarm[11] = 1

iceAngle = irandom(359)
iceSize = random_range(0.95, 1.05)
iceIndex = irandom(1)
iceAlpha = 1