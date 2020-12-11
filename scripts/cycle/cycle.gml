/// @param value
/// @param min
/// @param max
function cycle() {

	argument[0] = (argument[0]-argument[1]) mod (argument[2]-argument[1])

	if (argument[0] < 0)
		return argument[0]+argument[2]

	return argument[0]+argument[1]


}
