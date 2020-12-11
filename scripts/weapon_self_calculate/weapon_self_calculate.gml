function weapon_self_calculate() {
	var upgrade = (id.upgrade == unique_number or id.upgrade == unique_number+1) ? 0 : floor(id.upgrade)

	if (weaponType != wtype_shield) {
		var hasCrit = criticalChance != 0
	
	    cDamage = round((damage   +(damage != 0)*upgrade)
		*(100+upgrade*(8+3*!hasCrit)+(upgrade > 3)*2.5+(upgrade > 5)*6+(upgrade > 7)*8)   /100)
	
	    cAttackSpeed = attackSpeed
	
	    cCriticalChance = round((criticalChance   +(criticalChance != 0)*upgrade)
		*(100+upgrade*2+(upgrade > 3)*1+(upgrade > 5)*3+(upgrade > 7)*5)   /100)
	
	    cMagicalDamage = round((magicalDamage   +(magicalDamage != 0)*upgrade)
		*(100+upgrade*15+(upgrade > 3)*3+(upgrade > 5)*7+(upgrade > 7)*10)   /100)
	
	    cMana = round((mana   +(mana != 0)*upgrade)
		*(100+upgrade*7+(upgrade > 3)*2+(upgrade > 5)*4+(upgrade > 7)*7)   /100)
	
		var critOverload = cCriticalChance-100
		if (critOverload > 0) {
			cCriticalChance = 100
			cDamage *= 1+critOverload/100*1.25
		}
	}
	else {
	    cArmor = (armor   +(armor != 0)*0.55*upgrade)
		*(100+upgrade*8+(upgrade > 3)*2.5+(upgrade > 5)*6+(upgrade > 7)*8)   /100
	
	    cHp = round((hp   +(hp != 0)*upgrade)
		*(100+upgrade*10+(upgrade > 3)*3+(upgrade > 5)*7+(upgrade > 7)*10)   /100)
	
	    cMana = round((mana   +(mana != 0)*upgrade)
		*(100+upgrade*8+(upgrade > 3)*2+(upgrade > 5)*5+(upgrade > 7)*7)   /100)
	}

	worth *= ITEM_WORTH_RATIO
	cWorth = round(worth   *(100+upgrade*15+(upgrade > 3)*7+(upgrade > 5)*10+(upgrade > 7)*16)   /100	/(1+0.5*(id.upgrade != unique_number and id.upgrade != unique_number+1 and round(id.upgrade) != id.upgrade)))


}
