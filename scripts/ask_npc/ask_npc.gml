/// @param question
/// @param qKey
/// @param but0
/// @param but1
/// @param ..
function ask_npc() {

	var offsetY = 0
	var fromNPC = object_get_parent(object_index) == parNPC

	if (fromNPC)
		offsetY = 70

	if (argument_count == 2)
		var window = show_dialoguebox(screen_point(x-30, 0), screen_point(y-offsetY, 1), argument[0], (name != "" ? name : tag)+":", id, argument[1])
	else if (argument_count == 3)
		var window = show_dialoguebox(screen_point(x-30, 0), screen_point(y-offsetY, 1), argument[0], (name != "" ? name : tag)+":", id, argument[1], argument[2])
	else if (argument_count == 4)
		var window = show_dialoguebox(screen_point(x-30, 0), screen_point(y-offsetY, 1), argument[0], (name != "" ? name : tag)+":", id, argument[1], argument[2], argument[3])
	else if (argument_count == 5)
		var window = show_dialoguebox(screen_point(x-30, 0), screen_point(y-offsetY, 1), argument[0], (name != "" ? name : tag)+":", id, argument[1], argument[2], argument[3], argument[4])
	else if (argument_count == 6)
		var window = show_dialoguebox(screen_point(x-30, 0), screen_point(y-offsetY, 1), argument[0], (name != "" ? name : tag)+":", id, argument[1], argument[2], argument[3], argument[4], argument[5])
	else if (argument_count == 7)
		var window = show_dialoguebox(screen_point(x-30, 0), screen_point(y-offsetY, 1), argument[0], (name != "" ? name : tag)+":", id, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6])
	else if (argument_count == 8)
		var window = show_dialoguebox(screen_point(x-30, 0), screen_point(y-offsetY, 1), argument[0], (name != "" ? name : tag)+":", id, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7])
	else if (argument_count == 9)
		var window = show_dialoguebox(screen_point(x-30, 0), screen_point(y-offsetY, 1), argument[0], (name != "" ? name : tag)+":", id, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8])
	else if (argument_count == 10)
		var window = show_dialoguebox(screen_point(x-30, 0), screen_point(y-offsetY, 1), argument[0], (name != "" ? name : tag)+":", id, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9])

	if (fromNPC)
		window.alignBottom = true

	ds_list_add(windows, window)

	return window


}
