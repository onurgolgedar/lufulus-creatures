function set_special_quest_target() {
	isQuestTarget_direct = true

	while (ds_list_find_index(contGUI.yellowDirectionArrows, id) != -1)
		ds_list_delete(contGUI.yellowDirectionArrows, ds_list_find_index(contGUI.yellowDirectionArrows, id))
		
	ds_list_add(contGUI.yellowDirectionArrows, id)


}
