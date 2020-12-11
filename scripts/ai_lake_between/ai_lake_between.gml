/// @param target
/// @param angleDiff
/// @param distance
function ai_lake_between() {

	return argument[0] != pointer_null and collision_line(x, y, argument[0].x, argument[0].y, parLake, false, false)


}
