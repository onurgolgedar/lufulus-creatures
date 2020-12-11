for (var i = 0; i < horizontalBoxCount*maxPage; i++) {
	var pagesFirstSimple_j = -1
    for (var j = 0; j < verticalBoxCount; j++) {        
        if (global.quest[j+i*verticalBoxCount] != -1) {
            item[i, j] = instance_create(-50, -50, global.quest[j+i*verticalBoxCount])
			item[i, j].value = global.questScore[j+i*verticalBoxCount]
            item[i, j].from = window_quests
            item[i, j].i = i
            item[i, j].j = j
            item[i, j].depth = depth-5
            item[i, j].owner = id
        }
        else 
            item[i, j] = -1
			
		var item_isSimple = (item[i, j] != -1 and item[i, j].isSimpleQuest)
		if (item_isSimple and pagesFirstSimple_j == -1)
			pagesFirstSimple_j = j

		var _j = item_isSimple ? (pagesFirstSimple_j-j+verticalBoxCount-1) : j
		var _boxBetween_additionalV = item_isSimple ? (boxBetween_additionalV-4) : boxBetween_additionalV
		var _offset_yTop = item_isSimple ? (offset_yTop+35) : offset_yTop
		
        box_x[i, j] = floor(offset_x+((i mod horizontalBoxCount)+1/2)*boxWidth+boxBetween*(i mod horizontalBoxCount))
        box_y[i, j] = floor(_offset_yTop+(_j+1/2)*boxHeight+(boxBetween+_boxBetween_additionalV)*_j)
    }
}

for (var i = 1; i <= maxPage; i++) {
	blueBack_start[i] = -1
	orangeBack_start[i] = -1
	yellowBack_start[i] = -1
	
	blueBack_end[i] = -1
	orangeBack_end[i] = -1
	yellowBack_end[i] = -1
}

for (var pg = 0; pg < maxPage; pg++) {
    for (var k = 0; k < verticalBoxCount; k++) {
		if (item[pg, k] != -1) {
			var isNext_normalQuest = k+1 < verticalBoxCount and item[pg, k+1] != -1 and !item[pg, k+1].isPrepQuest and !item[pg, k+1].isSimpleQuest and !item[pg, k+1].isChallenge
			var is_normalQuest = !item[pg, k].isPrepQuest and !item[pg, k].isSimpleQuest and !item[pg, k].isChallenge
			
			if (yellowBack_start[pg+1] == -1 and item[pg, k].isChallenge) {
				yellowBack_start[pg+1] = k
				yellowBack_end[pg+1] = k
			}
			
			if (yellowBack_start[pg+1] != -1 and item[pg, k].isChallenge and k+1 < verticalBoxCount and (item[pg, k+1] == -1 or !item[pg, k+1].isChallenge)) {
				yellowBack_end[pg+1] = k
			}
			
			if (blueBack_start[pg+1] == -1 and item[pg, k].isPrepQuest) {
				blueBack_start[pg+1] = k
				blueBack_end[pg+1] = k
			}
			
			if (blueBack_start[pg+1] != -1 and item[pg, k].isPrepQuest and k+1 < verticalBoxCount and (item[pg, k+1] == -1 or !item[pg, k+1].isPrepQuest)) {
				blueBack_end[pg+1] = k
			}
			
			if (orangeBack_start[pg+1] == -1 and is_normalQuest) {
				orangeBack_start[pg+1] = k
				orangeBack_end[pg+1] = k
			}
			
			if (orangeBack_start[pg+1] != -1 and is_normalQuest and !isNext_normalQuest) {
				orangeBack_end[pg+1] = k
			}
		}
	}
}