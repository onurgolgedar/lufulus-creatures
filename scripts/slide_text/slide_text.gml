/// @param x
/// @param y
/// @param value
/// @param color
/// @param exclMark*
/// @param short*
function slide_text() {

	var st_slidingText = instance_create(argument[0], argument[1], objSlidingText)

	with (st_slidingText) {
		value = argument[2]
		color = argument[3]

		if (argument_count > 4)
			excl = argument[4]
	
		if (argument_count > 5)
			short = argument[5]
	
		owner = other.id
	}


}
