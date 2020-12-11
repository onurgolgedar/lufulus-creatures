function fm_update_all() {
	for (var i = 0; i < ds_list_size(global.fixedMessageNos); i++) {
		var fmSize = ds_list_size(global.fixedMessageNos)
	
		fm_update_activation(ds_list_find_value(global.fixedMessageNos, i))
	
		if (ds_list_size(global.fixedMessageNos) != fmSize)
			i--
	}


}
