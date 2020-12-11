for (i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (j = 0; j < verticalBoxCount; j++) {
        if (item[i, j] != -1) {
            global.item_bank[i, j] = item[i, j].object_index
            global.itemUpgrade_bank[i, j] = item[i, j].upgrade
            global.itemExtension0_bank[i, j] = item[i, j].extension[0]
            global.itemExtension1_bank[i, j] = item[i, j].extension[1]
            global.itemType_bank[i, j] = item[i, j].type
            global.itemCount_bank[i, j] = item[i, j].count
			global.itemRentTime_bank[i, j] = item[i, j].rentTime
        }
        else {
            global.item_bank[i, j] = -1
            global.itemUpgrade_bank[i, j] = -1
            global.itemExtension0_bank[i, j] = -1
            global.itemExtension1_bank[i, j] = -1
            global.itemType_bank[i, j] = pointer_null
            global.itemCount_bank[i, j] = -1
			global.itemRentTime_bank[i, j] = -1
        }
    }
}