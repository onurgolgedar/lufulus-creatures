/// @param quest
function get_quest_number() {

	for (var i = 0; i < 40; i++) {
		if (global.quest[i] == argument[0])
			return i
	}

	return -1


}
