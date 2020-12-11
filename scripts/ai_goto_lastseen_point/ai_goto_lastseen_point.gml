/// @param pfNo*
/// @param pfCondTarget*
/// @param waitingMessage*
function ai_goto_lastseen_point() {

	isSearching = false
	delta_alarm(10, irandom_range(sec*1.5, sec*2))
		
	with (pathFollower) {
		if (point_distance(x, y, other.x, other.y) > 60) {
			x = other.x
			y = other.y
		}
			
		pathEnd = false
	
		if (path_exists(path))
			path_delete(path)
		
		path = path_add()
	
		if (other.mode == md_attack)
			mp_grid_path(global.mainGrid, path, x, y, other.xLastSeen, other.yLastSeen, true)
		else
			mp_grid_path(global.calmGrid, path, x, y, other.xLastSeen, other.yLastSeen, true)
	
		path_start(path, 0, path_action_stop, true)
	}

	if (argument_count > 0) {
		if (argument_count > 0) {
			pathFollower.no = argument[0]
			lastPathNo = argument[0]
		}
	
		if (argument_count > 1)
			pathFollower.conditionalTarget = argument[1]
		
		if (argument_count > 2)
			waitingMessage = argument[2]
	}

	if (point_distance(xLastSeen, yLastSeen, pathFollower.x, pathFollower.y) < 8) {
		with (pathFollower) {
			path_end()
		
			if (!pathEnd)
				event_perform(ev_other, ev_end_of_path)
		}
	}


}
