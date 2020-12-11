if (test_upperclick_window())
	exit

if (global.itemSelected == -1) {
    var itemClicked = -1
    
    if (mouseOnBox)
        if (item[mouseOnBox_i, mouseOnBox_j] != -1)
            itemClicked = item[mouseOnBox_i, mouseOnBox_j]
			
	if (itemClicked != -1) {
		with (objMessageBox)
			if (owner != -1 and instance_exists(owner) and object_get_parent(owner.object_index) == parQuest and owner.from == window_quests)
				close_window()

		itemClicked.textAlpha = -0.15

		var dialogue_box = show_dialoguebox(x+horizontalBoxCount*(boxWidth+boxBetween)-boxBetween+offset_x*2+5, y
		, itemClicked.description+string_return("\n"+itemClicked.rewardText, !itemClicked.isPrepQuest)
		, "", itemClicked.id, 1
		, string_return(eng() ? "Go" : "Git", itemClicked.teleport != -1 and is_quest_incomplete(itemClicked.object_index))
		, eng() ? "Okay" : "Tamam"
		, string_return(eng() ? "Go" : "Git", !is_quest_incomplete(itemClicked.object_index) and itemClicked.givenLocation != pointer_null and itemClicked.givenBy != objPlayer and !(itemClicked.givenLocation == loc_hawmgrad and itemClicked.givenBy == objPlayer))
		, string_return(eng() ? "Retry" : "Tekrar Dene", itemClicked.teleport != -1 and itemClicked.teleport == room and is_quest_incomplete(itemClicked.object_index) and itemClicked.isChallenge)
		, string_return(eng() ? "Reject" : "Reddet", itemClicked.isDeletable)
		)
		
		dialogue_box.specialDesign = true
	}
}