event_inherited()

#region FIXED PROTECTION
if (protectionList != -1) {
	var ds_size = ds_list_size(protectionList)
	for (var i = 0; i < ds_size; i++) {
		with (ds_list_find_value(protectionList, i)) {
			if (id != other.id)
				ai_protectors_add(other.id)
		}
	}
}
#endregion

with (parTarget) {
	if (teamNo != -1 and teamNo == other.teamNo) {
		if (id != other.id)
			ai_protectors_add(other.id)
	}
}

// ?
experience = 0