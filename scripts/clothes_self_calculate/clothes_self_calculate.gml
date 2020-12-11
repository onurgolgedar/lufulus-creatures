function clothes_self_calculate() {
	var upgrade = (id.upgrade == unique_number or id.upgrade == unique_number+1) ? 0 : floor(id.upgrade)

	cArmor = (armor   +(armor != 0)*0.6*upgrade)
	*(100+upgrade*8+(upgrade > 3)*2+(upgrade > 5)*5+(upgrade > 7)*8)   /100

	cHp = round((hp   +(hp != 0)*upgrade*2)
	*(100+upgrade*10+(upgrade > 3)*2+(upgrade > 5)*5+(upgrade > 7)*8)   /100)

	cMana = round((mana   +(mana != 0)*upgrade)
	*(100+upgrade*8+(upgrade > 3)*2+(upgrade > 5)*5+(upgrade > 7)*7)   /100)

	worth *= ITEM_WORTH_RATIO
	cWorth = round(worth   *(100+upgrade*15+(upgrade > 3)*7+(upgrade > 5)*10+(upgrade > 7)*16)   /100	/(1+0.5*(id.upgrade != unique_number and id.upgrade != unique_number+1 and round(id.upgrade) != id.upgrade)))


}
