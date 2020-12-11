if (!IS_MOBILE and from == window_quests and !test_upperclick_window(owner)) {
    if (owner.mouseOnBox and owner.mouseOnBox_i == i and owner.mouseOnBox_j == j and tbT != "") {		
		if (textAlpha < 0.97)
			textAlpha += 0.065*(1+2*IS_MOBILE)*delta()
		else
			textAlpha = 0.97
		
	    textBoxWidth = show_textbox_general(owner.x+owner.box_x[i, j]+176, owner.y+owner.box_y[i, j]+16, teleport != -1 ? tbT_r : tbT, tbW, tbH, c_textbox, textAlpha, false, fontQuestInfo)
		
    }
	else
		textAlpha = -0.5*IS_MOBILE
}
else
	textAlpha = -0.5*IS_MOBILE