function set_special_quest_target() {
	isQuestTarget_direct = true

	while (ds_list_find_index(contGUi.yellowDirectionArrows, id) != -1)
		ds_list_delete(contGUi.yellowDirectionArrows, ds_list_find_index(contGUi.yellowDirectionArrows, id))
		
	ds_list_add(contGUi.yellowDirectionArrows, id)


}
