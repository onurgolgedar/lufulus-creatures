/// @param target
/// @param angleDiff
/// @param distance
function ai_can_see() {

	return argument[0] != pointer_null and (argument[1] < 85 or argument[2] < activeRange*2)
	and !collision_line(x, y, argument[0].x, argument[0].y, parSolid, false, false) and !argument[0].invisibility


}
