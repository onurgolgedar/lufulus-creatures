/// @param quest
/// @param count
function quest_progress() {

	// ? room == roomMenu when load_all is executed.
	if (room != roomMenu) {
		var questNo = get_quest_number(argument[0])

		if (questNo != -1)
			change_quest_score(questNo, argument[1])
	}


}
