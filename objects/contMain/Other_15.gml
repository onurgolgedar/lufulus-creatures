if (global.itemSelected.type == type_mweapon or global.itemSelected.type == type_sweapon
	or global.itemSelected.type == type_clothes or global.itemSelected.type == type_necklace or global.itemSelected.type == type_medallion) {
	if (!is_active(global.itemSelected.i, global.itemSelected.j) and global.level >= global.itemSelected.itemLevel/*-2*/ and (global.itemSelected.isDeletable or global.itemSelected.isForQuest == false))
		change_active(global.itemSelected.type, global.itemSelected.i, global.itemSelected.j)
}
else if (global.itemSelected.type == type_potion or global.itemSelected.type == type_pet or global.itemSelected.type == type_challengeItem) {
	with (global.itemSelected)
		give_answer(0, 1)
}