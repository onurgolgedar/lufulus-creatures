if (IS_MOBILE and !global_tab)
	exit
global_tab = false	

if (inView and !mouse_ison_window and mouseNear) {
	var _title = string_copy(text, 1, string_pos("\n", text))
	var _text = string_copy(text, string_pos("\n", text)+1, 999)
	var dialogue_box = show_dialoguebox(device_mouse_x_to_gui(0)-12, device_mouse_y_to_gui(0)-12, eng() ? "Just hold the mouse over the\nsymbol to read the information." : "Bilgiyi okumak için fareyi göstergenin\nüzerinde tutman yeterli."/*_text*/, "[c="+string(c_ltgray)+"]"+(eng() ? "Info: " : "Bilgi: ")+_title+"[/c]", id, 1, eng() ? "Okay" : "Tamam", eng() ? "Hide" : "Gizle")
	dialogue_box.specialDesign = true
	if (instance_exists(objMap) and depth <= objMap)
		dialogue_box.depth = depth-1
		
	ds_list_add(windows, dialogue_box)
}