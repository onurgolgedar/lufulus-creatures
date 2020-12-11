event_inherited()

maxTime = 2*sec
time = maxTime

description = eng() ? "Fire" : "Ateş"
	
deletable = false
separate = false // false?

delta_alarm(11, sec/4-1)

fireEffect = -1