function make_creature_dark() {
	var hpIncreaseRatio = 0.3
	maxHp *= 1+hpIncreaseRatio
	hp = maxHp
							
	image_blend = make_color_rgb(140, 140, 140)
	
	level += 2

	//name = "Dark "+name


}
