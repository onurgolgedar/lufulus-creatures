/// @param x
/// @param y
/// @param title
/// @param text
/// @param tutorialNo
function tutorial_box_point() {

	var tutorialBox = pointer_null
	var no = argument[4]

	if (ds_list_find_index(global.takenTutorials, no) == -1) {
		tutorialBox = instance_create_layer(0, 0, "lyWindows", objTutorialBox)
		tutorialBox.point_x = argument[0]
		tutorialBox.point_y = argument[1]
		tutorialBox.title = argument[2]
		tutorialBox.text = argument[3]
		tutorialBox.tutorialNo = no
	}

	return tutorialBox


}
