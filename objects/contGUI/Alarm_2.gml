if (hlQDis != 0 or hlCDis != 0 or hlSDis != 0) {
	var dt = delta()

	if (hlQDis-dt > 0)
		hlQDis -= dt
	else {
		hlQDis = 0
		hlQLogoColor = c_black
	}
	
	if (hlCDis-dt > 0)
		hlCDis -= dt
	else {
		hlCDis = 0
		hlCLogoColor = c_black
	}
	
	if (hlSDis-dt > 0)
		hlSDis -= dt
	else {
		hlSDis = 0
		hlSLogoColor = c_black
	}

	alarm[2] = 1
}