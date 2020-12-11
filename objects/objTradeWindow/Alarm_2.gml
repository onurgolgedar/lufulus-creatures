if (owner.type == type_npc and owner.tag == (eng() ? "Challenger" : "Söz Muhafızı")) {
	var text = eng() ? "Challenges\nChallenges are difficult quests that give you lasting benefits\nand can only be taken between certain levels. Challenges are\nnot added to the bag, they are added to your task list.\nIf you complete many challenges, you will defeat Lufulus faster." : "Sözleşmeler\nSözleşmeler size kalıcı avantajlar sağlayan ve sadece belirli\nseviyeler arasında alabileceğiniz daha zor görevlerdir.\nSözleşmeler çantaya eklenmez, görev listenize eklenir.\nFazla sözleşme tamamlarsanız Lufulus'u daha kolay alt edersiniz."
	var title = eng() ? "" : ""
	var tutorialBox = tutorial_box_owned(title, text, id, 193+19*IS_MOBILE, 26+2*IS_MOBILE, 26)
	if (tutorialBox != pointer_null) {
		tutorialBox.offset_y -= 206
		tutorialBox.image_xscale = 0.7
		tutorialBox.image_yscale = 0.7
	}
}

discount = 15*((owner.object_index == objAdam_npc or owner.object_index == objBanker_npc) and ds_list_find_value(global.gameChoices, 0) == choice_1)

horizontalBoxCount = global.tradeBoxCount_horizontal-loot*2
verticalBoxCount = global.tradeBoxCount_vertical-loot*1
maxPage = loot ? 1 : global.tradeMaxPage

for (i = 0; i < horizontalBoxCount*maxPage; i++) {
    for (j = 0; j < verticalBoxCount; j++) {
        box_x[i, j] = floor(offset_x+((i mod horizontalBoxCount)+1/2)*boxEdge+boxBetween*(i mod horizontalBoxCount))
        box_y[i, j] = floor(offset_yTop+(j+1/2)*boxEdge+boxBetween*j)
    }
}

event_perform(ev_other, ev_user3)
event_perform(ev_other, ev_user0)

if (loot)
	y -= verticalBoxCount*(boxEdge+boxBetween)-boxBetween+offset_yTop+offset_yDown
	
if (y < 0)
	y = 0