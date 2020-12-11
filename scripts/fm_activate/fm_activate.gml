/// @param fMNo
/// @param activation* (-1, 0, 1)
function fm_activate() {

	var __index = ds_list_find_index(global.fixedMessageNos, argument[0])

	if (__index != -1) {
		var beforeActivation = ds_list_find_value(global.fixedMessageActivations, __index)

		if (beforeActivation != true) {
			if (argument_count == 1)
				ds_list_replace(global.fixedMessageActivations, __index, true)
			else
				ds_list_replace(global.fixedMessageActivations, __index, argument[1])
	
			if (argument_count == 1 or argument[1] == true)
				fm_action(argument[0])
		}
	
		save_fms(global.saveNo)
	}


}
