/// @param depthControl
function test_upperclick_tutorial() {

	var depthControl = argument_count == 1 ? argument[0] : false

	with (objTutorialBox)
		if (mouseNear and (!depthControl or depth < other.depth) )
			return true
		
	return false


}
