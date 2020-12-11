/// @param index
/// @param choice (from macros)
function set_gamechoice() {

	ds_list_set(global.gameChoices, argument[0], argument[1])
	save_general(global.saveNo)


}
