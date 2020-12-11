if (colorScreenAlpha > 0) {
	if (colorScreenAlpha == 1 and colorScreenColor == c_black)
		free_all_surfaces()
	
	colorScreenAlpha -= 0.07*delta()
	
	if (colorScreenAlpha < 0)
		colorScreenAlpha = 0
	else
		alarm[1] = 1
		
	if (colorScreenAlpha == 0)
		colorScreenColor = c_black
		
	with (parEffectBox)
		image_alpha = 1-other.colorScreenAlpha
}

if (expBarAlpha > 0) {
	expBarAlpha -= (max((expBarAlpha-1)/40, 0)+0.015)*(1+3*(expBarAlpha > 1))*delta()
	
	if (expBarAlpha < 0) {
		expBarAlpha = 0
		global.previousExperience = global.experience
	}
	else
		alarm[1] = 1
}

if (hideSummaryInfo_alpha > 0) {
	var skip = false
	
	with (parEffectBox) {
		if (mouseOn) {
			skip = true
			break
		}
	}
	
	if (!skip)
		hideSummaryInfo_alpha -= 0.05*delta()
	
	if (hideSummaryInfo_alpha < 0)
		hideSummaryInfo_alpha = 0
	else
		alarm[1] = 1
}

if (redScreenIncrease) {
	if (redScreenAlpha+0.15 < redScreenTarget) {
		redScreenAlpha += 0.15
		alarm[1] = 1
	}
	else {
		redScreenAlpha = redScreenTarget
		redScreenIncrease = false
		alarm[1] = 1
	}
}
else if (redScreenAlpha-0.015 > 0) {
	redScreenAlpha -= 0.015
	redScreenTarget = redScreenAlpha
	alarm[1] = 1
}
else {
	redScreenAlpha = 0
	redScreenTarget = redScreenAlpha
}