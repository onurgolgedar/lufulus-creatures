ds_list_destroy(fixedMessageW)
ds_list_destroy(fixedMessageH)

fixedMessageW = ds_list_create()
fixedMessageH = ds_list_create()
fixedMessageTotH = 0
maxFixedMessageW = 0

draw_set_font(fontFixedMessage) draw_set_halign(fa_left) draw_set_valign(fa_top) draw_set_alpha(0)
var ds_size = ds_list_size(global.fixedMessages)
for (var i = 0; i < ds_size; i++) {
		var str = ds_list_find_value(global.fixedMessages, i)
		var strW = string_width(str)
		var strH = string_height(str)
		
		ds_list_add(fixedMessageW, strW)
		ds_list_add(fixedMessageH, strH)
		
		if (strW > maxFixedMessageW)
			maxFixedMessageW = strW
			
		fixedMessageTotH += strH
}
draw_set_default() draw_set_alpha(1)

fixedMessageTotH += 15+(ds_list_size(global.fixedMessages)-1)*7