/// @param amount
/// @param gainedObject
function show_gainmessage() {

	var color = argument_count == 1 ? c_gold : c_aqua
	var gained
	if (argument_count < 2)
		gained = eng() ? "gold" : "altın"
	else
		gained = argument[1]

	if (eng())
		show_messagebox(230, 450, "", "You have taken [c="+string(color)+"]"+string_return(string(argument[0]), argument[0] > 1)+" "+gained+"[/c].", 2*sec)
	else
		show_messagebox(230, 450, "", "[c="+string(color)+"]"+string_return(string(argument[0]), argument[0] > 1)+" "+gained+"[/c] elde ettin.", 2*sec)

	if (gained == "gold" or gained == "altın")
		audio_play_sound(sndCoin, false, false)


}
