/// @param DialogueID
/// @param DialogueNo
/// @param DialogueSize
function get_dialogue_qKey() {

	return (argument[0]*100+argument[1])*(1-2*(argument[2] == argument[1]))


}
