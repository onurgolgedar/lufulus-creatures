for (i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (j = 0; j < verticalBoxCount+5*(i == 0); j++) {
        if (item[i, j] != -1) {
            global.item[i, j] = item[i, j].object_index
            global.itemUpgrade[i, j] = item[i, j].upgrade
            global.itemExtension0[i, j] = item[i, j].extension[0]
            global.itemExtension1[i, j] = item[i, j].extension[1]
            global.itemType[i, j] = item[i, j].type
            global.itemCount[i, j] = item[i, j].count
        }
        else {
            global.item[i, j] = -1
            global.itemUpgrade[i, j] = -1
            global.itemExtension0[i, j] = -1
            global.itemExtension1[i, j] = -1
            global.itemType[i, j] = pointer_null
            global.itemCount[i, j] = -1
        }
    }
}

