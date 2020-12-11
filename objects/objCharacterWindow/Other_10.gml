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

	var beforeFront = front
	front = true
	if (!beforeFront)
		alarm[8] = 1

	with (parWindow) {
		if (id != other.id and object_index == objMessageBox and dialogueID != -1)
			event_perform(ev_other, ev_user0)
	}
}