/// @param fMNo
/// @param isShining*
function fm_add() {

	var __fixedMessage = fm_get(argument[0])
	var __fixedMessage_index_same  = ds_list_find_index(global.fixedMessageNos, argument[0])

	if (__fixedMessage_index_same == -1) {
		ds_list_add(global.fixedMessages, __fixedMessage)
		ds_list_add(global.fixedMessageNos, argument[0])

		if (argument_count > 1 /*and argument[1]*/ and argument[1] != -1)
			ds_list_add(global.fixedMessageActivations, !argument[1])
		else
			ds_list_add(global.fixedMessageActivations, -1)
	
		fm_update_activation(argument[0])
	
		if (ds_list_size(global.fixedMessages) > 3)
			fm_delete(ds_list_find_value(global.fixedMessageNos, 0))
	
		with (contGUI)
			event_perform(ev_other, ev_user1)
	
		save_fms(global.saveNo)
	}


}
