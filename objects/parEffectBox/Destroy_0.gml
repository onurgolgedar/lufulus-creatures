with (parEffectBox) {
    if (owner == other.owner and order > other.order)
        order -= 1
}

event_perform(ev_other, ev_user1)

var index = ds_list_find_index(global.permanentEfboxes, object_get_name(object_index))
if (permanent and index != -1) {
	ds_list_delete(global.permanentEfboxes, index)
	ds_list_delete(global.permanentEfboxes_time, index)
}