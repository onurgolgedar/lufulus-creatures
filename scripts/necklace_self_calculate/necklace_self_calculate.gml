function necklace_self_calculate() {
	var upgrade = (id.upgrade == unique_number or id.upgrade == unique_number+1) ? 0 : floor(id.upgrade)

	cHp = round((hp   +(hp != 0)*upgrade)
	*(100+upgrade*5+(upgrade > 3)*1+(upgrade > 5)*3+(upgrade > 7)*5)   /100)

	cMana = round((mana   +(mana != 0)*upgrade)
	*(100+upgrade*5+(upgrade > 3)*1+(upgrade > 5)*3+(upgrade > 7)*5)   /100)

	cStr = (str+   (str != 0)*upgrade*0.4)
	*(100+upgrade*5+(upgrade > 3)*1+(upgrade > 5)*3+(upgrade > 7)*5)   /100

	cDex = (dex+   (dex != 0)*upgrade*0.4)
	*(100+upgrade*5+(upgrade > 3)*1+(upgrade > 5)*3+(upgrade > 7)*5)   /100

	cVit = (vit+   (vit != 0)*upgrade*0.4)
	*(100+upgrade*5+(upgrade > 3)*1+(upgrade > 5)*3+(upgrade > 7)*5)   /100

	cMp = (mp+   (mp != 0)*upgrade*0.4)
	*(100+upgrade*5+(upgrade > 3)*1+(upgrade > 5)*3+(upgrade > 7)*5)   /100

	cSta = (sta+   (sta != 0)*upgrade*0.4)
	*(100+upgrade*5+(upgrade > 3)*1+(upgrade > 5)*3+(upgrade > 7)*5)   /100

	worth *= ITEM_WORTH_RATIO
	cWorth = round(worth   *(100+upgrade*15+(upgrade > 3)*7+(upgrade > 5)*10+(upgrade > 7)*16)   /100	/(1+0.5*(id.upgrade != unique_number and id.upgrade != unique_number+1 and round(id.upgrade) != id.upgrade)))


}
