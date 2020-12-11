/// @param owner
/// @param effectPoint
/// @param distance_value(-1)*
/// @param place_meeting_object*
function get_affecteds() {

	var placeMeeting_test = argument_count > 3 and argument[2] == -1
	var dis = argument_count > 2 ? argument[2] : 100

	var affecteds = ds_list_create()
	with (parTarget) {
		if (inView and (placeMeeting_test and place_meeting(x, y, argument[3]) or !placeMeeting_test and point_distance(x, y, argument[1].x, argument[1].y) < dis)
		and !collision_line(x, y, argument[1].x, argument[1].y, parSolid, 1, 0)
		and !are_they_friends(id, argument[0]))
			ds_list_add(affecteds, id)
	}

	return affecteds


}
