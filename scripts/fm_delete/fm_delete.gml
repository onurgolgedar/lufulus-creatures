/// @param fMNo
function fm_delete() {
	var __index = ds_list_find_index(global.fixedMessageNos, argument[0])

	while (__index != -1) {
		ds_list_delete(global.fixedMessages, __index)
		ds_list_delete(global.fixedMessageActivations, __index)
		ds_list_delete(global.fixedMessageNos, __index)

		with (contGUi)
			event_perform(ev_other, ev_user1)
	
		save_fms(global.saveNo)

		__index = ds_list_find_index(global.fixedMessageNos, argument[0])
	}


}
