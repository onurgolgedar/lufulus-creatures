/// @param tag
/// @param desc*
function add_title() {

	var additional_desc = ""
	if (argument_count > 1)
		additional_desc = argument[1]

	if (eng())
		show_messagebox(200, 550, "\n"+additional_desc, "Congratulations!\nNew Title: [c="+string(c_aqua)+"]"+argument[0]+"[/c]")
	else
		show_messagebox(200, 550, "\n"+additional_desc, "Tebrikler!\nYeni Ünvan: [c="+string(c_aqua)+"]"+argument[0]+"[/c]")

	ds_list_add(global.titles, argument[0])
	save_general(global.saveNo)

	audio_play_sound(sndSuccess, false, false)


}
