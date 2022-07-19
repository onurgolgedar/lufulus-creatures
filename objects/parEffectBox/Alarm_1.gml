if (!notNew and permanent and (ds_list_find_index(global.permanentEfboxes, object_get_name(object_index)) == -1 or separate) and owner.object_index == objPlayer) {
	ds_list_add(global.permanentEfboxes, object_get_name(object_index))
	ds_list_add(global.permanentEfboxes_time, time)
}

draw_set_font(fontiteminfo) draw_set_alpha(0)
	tbW = string_width(draw_text_colortags(-900, 0, description))
	tbH = string_height(draw_text_colortags(-900, 0, description))
draw_set_font(global.mainFont) draw_set_alpha(1)

visible = true