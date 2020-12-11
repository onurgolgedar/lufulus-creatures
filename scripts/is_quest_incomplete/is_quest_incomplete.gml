/// @param quest
function is_quest_incomplete() {

	var questNo = get_quest_number(argument[0])

	return quest_exists(argument[0]) and (global.questScore[questNo] != global.questMaxScore[questNo])


}
