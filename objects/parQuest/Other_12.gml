if (!isFailure) {
	if (showWhenFinish) {
		var questText = eng() ? ("[c="+string(isChallenge ? c_aqua : c_gold)+"]"+(isChallenge ? "Challenge[/c]" : "Quest[/c]")+": ") : ("[c="+string(isChallenge ? c_aqua : c_gold)+"]"+(isChallenge ? "Sözleşme[/c]" : "Görev[/c]")+": ")
		
		var ltext
		ltext[0] = eng() ? rewardText : rewardText
		ltext[1] = eng() ? (questText+name+"\nis completed![/c]") : (questText+name+"\ntamamlandı![/c]")
		
		draw_set_font(fontMessageTitle) draw_set_alpha(0)
			var ltext1_pure = draw_text_colortags(0, 0, ltext[1])
			var ltext1_width = string_width(ltext1_pure)
		draw_set_default() draw_set_alpha(1)
		
		show_messagebox(display_get_gui_width()-70-ltext1_width, 200, ltext[0], ltext[1], 2*sec+isChallenge*6*sec)
	}

	change_exp(experience)
	change_money(money)
}

if (ds_list_find_index(global.questsFinished, object_index) == -1)
	ds_list_add(global.questsFinished, object_index)

delete_quest(get_quest_number(object_index))