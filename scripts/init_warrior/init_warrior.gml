/// @param warriorType
function init_warrior() {

	// Melee
	if (!isRanged) {
	#region RECQUITED WARRIORS
		if (argument[0] == recruited_low_1) {
			name = eng() ? "Warrior (Lv. 3)" : "Savaşçı (Sv. 3)"
			tag = eng() ? "Recruited" : "Kiralık"
			level = 3
		
			shoulders.sprite_index = sprClot_001
			leftArm[0].sprite_index = sprClothesArm
			rightArm[0].sprite_index = sprClothesArm
		
			image_xscale = 0.92
			image_yscale = image_xscale
		
			hair = sprHair9
			weapon = sprSw_002D

			attackSpeed = 1
			attacktimer_set_max()
			maxHp = 400
			hp = maxHp
			armor = 5
			resistance = 5
			spd = 5.8
			physicalPower = 40
			lifesteal = 2
			phy_linear_damping = 5
		}
		else if (argument[0] == recruited_low_2) {
			name = eng() ? "Warrior (Lv. 6)" : "Savaşçı (Sv. 6)"
			tag = eng() ? "Recruited" : "Kiralık"
			level = 6
		
			shoulders.sprite_index = sprClot_002
			leftArm[0].sprite_index = sprClothesArm
			rightArm[0].sprite_index = sprClothesArm
		
			image_xscale = 0.93
			image_yscale = image_xscale
		
			hair = sprHair7
			weapon = sprSw_003D

			attackSpeed = 1.05
			attacktimer_set_max()
			maxHp = 600
			hp = maxHp
			armor = 10
			resistance = 10
			spd = 5.9
			physicalPower = 70
			lifesteal = 3
			phy_linear_damping = 5
		}
		else if (argument[0] == recruited_1) {
			name = eng() ? "Warrior (Lv. 10)" : "Savaşçı (Sv. 10)"
			tag = eng() ? "Recruited" : "Kiralık"
			level = 10
		
			shoulders.sprite_index = sprClot_004
			leftArm[0].sprite_index = sprClothesArm
			rightArm[0].sprite_index = sprClothesArm
		
			image_xscale = 0.93
			image_yscale = image_xscale
		
			hair = sprHair12
			weapon = sprSw_005D

			attackSpeed = 1.1
			attacktimer_set_max()
			maxHp = 1000
			hp = maxHp
			armor = 18
			resistance = 18
			spd = 6
			physicalPower = 130
			lifesteal = 3
			phy_linear_damping = 5
		}
		else if (argument[0] == recruited_2) {
			name = eng() ? "Warrior (Lv. 15)" : "Savaşçı (Sv. 15)"
			tag = eng() ? "Recruited" : "Kiralık"
			level = 15
		
			shoulders.sprite_index = sprClot_007
			leftArm[0].sprite_index = sprClothesArm
			rightArm[0].sprite_index = sprClothesArm
		
			image_xscale = 0.94
			image_yscale = image_xscale
		
			hair = sprHair12
			weapon = sprSw_008

			attackSpeed = 1.2
			attacktimer_set_max()
			maxHp = 1550
			hp = maxHp
			armor = 24
			resistance = 24
			spd = 6.3
			physicalPower = 200
			lifesteal = 4
			phy_linear_damping = 5
		}
		else if (argument[0] == recruited_3) {
			name = eng() ? "Warrior (Lv. 20)" : "Savaşçı (Sv. 20)"
			tag = eng() ? "Recruited" : "Kiralık"
			level = 20
		
			shoulders.sprite_index = sprClot_005
			leftArm[0].sprite_index = sprClothesArmFull
			rightArm[0].sprite_index = sprClothesArmFull
			leftArm[1].sprite_index = sprClothesFrontArmFull
			rightArm[1].sprite_index = sprClothesFrontArmFull
		
			image_xscale = 0.95
			image_yscale = image_xscale
		
			hair = sprHair12
			weapon = sprSw_007D

			attackSpeed = 1.3
			attacktimer_set_max()
			maxHp = 2000
			hp = maxHp
			armor = 28
			resistance = 28
			spd = 6.5
			physicalPower = 290
			lifesteal = 5
			phy_linear_damping = 5
		}
		else if (argument[0] == recruited_4) {
			name = eng() ? "Warrior (Lv. 25)" : "Savaşçı (Sv. 25)"
			tag = eng() ? "Recruited" : "Kiralık"
			level = 25
		
			shoulders.sprite_index = sprClot_017
			leftArm[0].sprite_index = sprClothesArmFull4
			rightArm[0].sprite_index = sprClothesArmFull4
			leftArm[1].sprite_index = sprClothesFrontArmFull4
			rightArm[1].sprite_index = sprClothesFrontArmFull4
		
			image_xscale = 0.96
			image_yscale = image_xscale
		
			hair = sprHair7
			weapon = sprSw_008D_2

			attackSpeed = 1.4
			attacktimer_set_max()
			maxHp = 2700
			hp = maxHp
			armor = 35
			resistance = 35
			spd = 6.7
			physicalPower = 350
			lifesteal = 6
			phy_linear_damping = 5
		}
	#endregion
		else if (argument[0] == melee_xlight) {
			name = eng() ? "Light Swordsman" : "Hafif Kılıçlı"
			level = 10

			shoulders.sprite_index = sprClothes_npc
			leftArm[0].sprite_index = sprClothesArm
			rightArm[0].sprite_index = sprClothesArm
		
			image_xscale = 0.93
			image_yscale = image_xscale
		
			hair = sprHair13
			weapon = sprSw_003D

			attackSpeed = 1.1
			attacktimer_set_max()
			maxHp = 1200
			hp = maxHp
			armor = 15
			resistance = 15
			spd = 5.9
			physicalPower = 90
		}
		else if (argument[0] == melee_light) {
			name = eng() ? "Swordsman" : "Kılıçlı"
			level = 15

			shoulders.sprite_index = sprClot_003
			leftArm[0].sprite_index = sprClothesArm
			rightArm[0].sprite_index = sprClothesArm
		
			image_xscale = 0.94
			image_yscale = image_xscale
		
			hair = sprHair5
			weapon = sprSw_008D_3

			attackSpeed = 1.25
			attacktimer_set_max()
			maxHp = 1700
			hp = maxHp
			armor = 25
			resistance = 25
			spd = 6.25
			physicalPower = 140
		}
		else if (argument[0] == melee_normal) {
			name = eng() ? "Elite Swordsman" : "Usta Kılıçlı"
			level = 20

			shoulders.sprite_index = sprClot_005
			leftArm[0].sprite_index = sprClothesArm
			rightArm[0].sprite_index = sprClothesArm
		
			image_xscale = 0.96
			image_yscale = image_xscale
		
			hair = sprHair6
			weapon = sprSw_009

			attackSpeed = 1.35
			attacktimer_set_max()
			maxHp = 2400
			hp = maxHp
			armor = 35
			resistance = 35
			spd = 6.7
			physicalPower = 190
		}
		else if (argument[0] == melee_heavy) {
			name = eng() ? "Heavy Swordsman" : "Ağır Kılıçlı"
			level = 25

			shoulders.sprite_index = sprClot_006
			leftArm[0].sprite_index = sprClothesArm2
			rightArm[0].sprite_index = sprClothesArm2
		
			image_xscale = 0.98
			image_yscale = image_xscale
		
			hair = sprHair10
			weapon = sprSw_009D

			attackSpeed = 1.24
			attacktimer_set_max()
			maxHp = 3800
			hp = maxHp
			armor = 45
			resistance = 45
			spd = 6.4
			physicalPower = 265
		}
		else if (argument[0] == melee_xheavy) {
			name = eng() ? "Elite Warrior" : "Gelişmiş Savaşçı"
			level = 30

			shoulders.sprite_index = sprClot_008
			leftArm[0].sprite_index = sprClothesArm3
			rightArm[0].sprite_index = sprClothesArm3
		
			image_xscale = 1
			image_yscale = image_xscale
		
			hair = sprHair9
			weapon = sprSw_010D_2

			attackSpeed = 1.4
			attacktimer_set_max()
			maxHp = 4500
			hp = maxHp
			armor = 52
			resistance = 52
			spd = 7
			physicalPower = 370
		}
		else if (argument[0] == melee_xxheavy) {
			name = eng() ? "Ultimate Warrior" : "Üstün Savaşçı"
			level = 30

			shoulders.sprite_index = sprClot_012
			leftArm[0].sprite_index = sprClothesArm
			rightArm[0].sprite_index = sprClothesArm
		
			image_xscale = 1
			image_yscale = image_xscale
		
			hair = sprHair14
			weapon = sprSw_011D_2

			attackSpeed = 1.4
			attacktimer_set_max()
			maxHp = 6000
			hp = maxHp
			armor = 60
			resistance = 60
			spd = 7.1
			physicalPower = 420
		}
	}
	else {
		if (argument[0] == ranged_light) {
			name = eng() ? "Light Archer" : "Hafif Okçu"
			level = 15

			shoulders.sprite_index = sprClothes_npc
			leftArm[0].sprite_index = sprClothesArm
			rightArm[0].sprite_index = sprClothesArm
		
			image_xscale = 0.94
			image_yscale = image_xscale
		
			hair = sprHair8
			weapon = sprCrossbow_003

			attackSpeed = 1
			attacktimer_set_max()
			maxHp = 1000
			hp = maxHp
			armor = 10
			resistance = 10
			spd = 5.7
			physicalPower = 75
		}
		else if (argument[0] == ranged_normal) {
			name = eng() ? "Archer" : "Okçu"
			level = 23

			shoulders.sprite_index = sprClot_003
			leftArm[0].sprite_index = sprClothesArm
			rightArm[0].sprite_index = sprClothesArm
			image_xscale = 0.96
			image_yscale = image_xscale
		
			hair = sprHair2
			weapon = sprCrossbow_006

			attackSpeed = 1.2
			attacktimer_set_max()
			maxHp = 2000
			hp = maxHp
			armor = 15
			resistance = 15
			spd = 6.4
			physicalPower = 125
		}
		else if (argument[0] == ranged_heavy) {
			name = eng() ? "Elite Archer" : "Usta Okçu"
			level = 27

			shoulders.sprite_index = sprClot_005
			leftArm[0].sprite_index = sprClothesArm
			rightArm[0].sprite_index = sprClothesArm
		
			image_xscale = 0.98
			image_yscale = image_xscale
		
			hair = sprHair4
			weapon = sprCrossbow_007

			attackSpeed = 1.25
			attacktimer_set_max()
			maxHp = 2900
			hp = maxHp
			armor = 26
			resistance = 26
			spd = 6.9
			physicalPower = 200
		}
	}


}
