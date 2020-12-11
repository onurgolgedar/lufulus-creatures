if (!destroy) {
	minDepth = depth

	with (parWindow) {
		front = false
		if (depth <= other.depth and id != other.id) {    
			if (depth < other.minDepth)
			    other.minDepth = depth
            
			depth += 2
		}
	}
    
	depth = minDepth
	front = true
}