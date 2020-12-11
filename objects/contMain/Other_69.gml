var type = ds_map_find_value(async_load, "event_type")
var async_id = ds_map_find_value(async_load, "id");

if (type == "leaderboard_upload") {
    var lb_ID = ds_map_find_value(async_load, "post_id")
	
    if (lb_ID == steam_leaderboard_upload_id) {
        /*var lb_name = ds_map_find_value(async_load, "lb_name")
        var lb_done = ds_map_find_value(async_load, "success")
        var lb_score = ds_map_find_value(async_load, "score")
        var lb_updated = ds_map_find_value(async_load, "updated")*/
		
		steam_download_scores_around_user(steam_leaderboard_name, -1, -1)
	}
}

if (type == "leaderboard_upload") {
    var lb_ID = ds_map_find_value(async_load, "post_id")
	
    if (lb_ID == steam_leaderboard_upload_id) {
        /*var lb_name = ds_map_find_value(async_load, "lb_name")
        var lb_done = ds_map_find_value(async_load, "success")
        var lb_score = ds_map_find_value(async_load, "score")
        var lb_updated = ds_map_find_value(async_load, "updated")*/
		
		steam_leaderboard_download_id = steam_download_scores_around_user(steam_leaderboard_name, 0, 0)
	}
}


if (async_id == steam_leaderboard_download_id) {
    var entries = ds_map_find_value(async_load, "entries")
    var map = json_decode(entries)
	
    if (ds_map_exists(map, "default"))
		ds_map_destroy(map)
    else {
		var list = ds_map_find_value(map, "entries")
        var len = ds_list_size(list)
        var entry
		
        for (var i = 0; i < len; i++) {
            entry = ds_list_find_value(list, i )
            global.steamScore = ds_map_find_value(entry, "score")
            global.steamRank = ds_map_find_value(entry, "rank")
        }
			
		ds_map_destroy(map)
	}
    
}