function decyrpt() {
	if (!global.antiCheat_forSaveFiles)
		return argument[0]

	if (argument[0] mod 4517 != 0) {
		show_message("Anti-cheat Protection")
		game_end()
		return -1
	}
	else if (argument[0] mod 9629 != 0) {
		show_message("Anti-cheat Protection")
		game_end()
		return -1
	}

	var result = argument[0]/100/4517/9629
	result -= 121

	return result


}
