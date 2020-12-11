event_inherited()

maxTime = 1.5*sec
time = maxTime

description = eng() ? "Burning" : "Yanma"

deletable = false
separate = false

delta_alarm(11, sec/4-1)
alarm[10] = 1

fireEffect = -1