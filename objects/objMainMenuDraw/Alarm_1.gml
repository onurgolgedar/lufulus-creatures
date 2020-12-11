var value = delta()*0.2
if (blackScreenAlpha-value > 0) {
	blackScreenAlpha -= value*(alarm[3] < 1)
	alarm[1] = 2
}
else
	blackScreenAlpha = 0