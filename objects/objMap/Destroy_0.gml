objPlayer.viewLock = false

var ds_size = ds_list_size(locations)
for (var i = 0; i < ds_size; i++)
	instance_destroy(ds_list_find_value(locations, i))
	
ds_list_destroy(locations)
ds_list_destroy(locations_x)
ds_list_destroy(locations_y)
ds_list_destroy(locationsSorted)

with (objRoomChanger) {
	if (opensMap)
		delta_alarm(0, 2*sec)
		
	mapOpened = false
}