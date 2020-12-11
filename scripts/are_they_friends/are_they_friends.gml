/// @param id1
/// @param id2
function are_they_friends() {

	// ? New
	if (argument[0].teamNo != -1 and argument[1].teamNo != -1)
		if (argument[0].teamNo == argument[1].teamNo)
			return true
		
	if (argument[0].teamNo == team_neutralFriend and argument[1].teamNo == team_player and (argument[0].target == pointer_null or argument[0].target.type != type_player))
		return true
	
	if (argument[0].teamNo == team_player and argument[1].teamNo == team_neutralFriend and (argument[1].target == pointer_null or argument[1].target.type != type_player))
		return true

	with (argument[0])
		if (ai_protectors_exists(argument[1]))
			return true
		
	with (argument[1])
		if (ai_protectors_exists(argument[0]))
			return true
		
	return false


}
