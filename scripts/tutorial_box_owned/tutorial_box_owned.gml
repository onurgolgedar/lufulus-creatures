/// @param title
/// @param text
/// @param owner
/// @param ow_offsetx
/// @param ow_offsety
/// @param tutorialNo
function tutorial_box_owned() {

	var tutorialBox = pointer_null
	var no = argument[5]

	if (ds_list_find_index(global.takenTutorials, no) == -1) {
		tutorialBox = instance_create(0, 0, objTutorialBox)
		tutorialBox.title = argument[0]
		tutorialBox.text = argument[1]
		tutorialBox.owner = argument[2]
		tutorialBox.owner_offset_x = argument[3]
		tutorialBox.owner_offset_y = argument[4]
		tutorialBox.tutorialNo = no
	}

	return tutorialBox


}
