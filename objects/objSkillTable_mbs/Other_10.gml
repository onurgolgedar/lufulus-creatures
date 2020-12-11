if (!destroy) {
	minDepth = depth

	with (parWindow) {
		front = false
		if (depth <= other.depth and id != other.id) {    
		    if (depth < other.minDepth)
		        other.minDepth = depth;
            
		    depth += 2
		}
	}
    
	depth = minDepth
	front = true

	for (i = 0; i < horizontalBoxCount*maxPage; i++) {
		for (j = 0; j < verticalBoxCount; j++) {
		    if (item[i, j] != -1)
		        item[i, j].depth = depth-5
		}
	}

	with (parWindow) {
		if (id != other.id and object_index == objMessageBox and dialogueID != -1)
			event_perform(ev_other, ev_user0)
	}
}