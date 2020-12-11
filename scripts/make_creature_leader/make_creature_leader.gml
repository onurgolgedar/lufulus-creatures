/// @param isHard
function make_creature_leader() {

	isLeader = true
	leadColor = make_color_rgb(55+irandom(200), 55+irandom(200), 55+irandom(200))

	if (argument[0]) {
		isLeader_hard = true
						
		image_xscale = 1.135
		image_yscale = 1.135
	
		depth -= 2
						
		maxHp = round(maxHp*2.2)
		hp = maxHp
		physicalPower = round(physicalPower*1.65)
		attackSpeed = round(attackSpeed*1.45)
		spd = round(spd*1.2)
						
		bonusExperienceRate += 3
		baseBonusExperienceRate = bonusExperienceRate
		money = round(money*4)

		name = leader_text+name
						
		image_index = (image_number == 2) ? 1 : 0
	
		test_quest_target()
	}


}
