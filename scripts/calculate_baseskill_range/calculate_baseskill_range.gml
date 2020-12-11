function calculate_baseskill_range() {
	return (0.8+0.6*global.skillBar/100)*(1-(contPlayer.upgSk6 > 0 and contPlayer.upgSk6 < 4)*0.18)


}
