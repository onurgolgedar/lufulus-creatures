for (i = 0; i < horizontalBoxCount*maxPage; i++) {
	for (j = 0; j < verticalBoxCount; j++) {
		if (i == 15 and j < 3) {
		    if (item[i, j] != -1) {
		        global.skillObject[i, j] = item[i, j].object_index
		        global.skillUpgrade[i, j] = item[i, j].upgrade
		    }
		    else {
		        global.skillObject[i, j] = -1
		        global.skillUpgrade[i, j] = 0
		    }
		}
	}
}

global.anticheat_skillPoints = recalculate_sha_skillPoints()