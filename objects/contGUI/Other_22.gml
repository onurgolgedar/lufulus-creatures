var target = pointer_null

if (isQuestion(1)) {
	if (isButton(0)) {
		var messageBox = show_dialoguebox(findButtonX-60, display_get_gui_height()-258-IS_MOBILE*20, "", eng() ? "What kind of seller?" : "Ne tür bir satıcı?", contGUI.id, 2
		, eng() ? "Sword" : "Kılıç", eng() ? "Shield" : "Kalkan", eng() ? "Bow" : "Yay", eng() ? "Armor" : "Zırh", eng() ? "Necklace" : "Kolye", eng() ? "Runes&Cures" : "Rünler&Haplar", "Cancel")
		messageBox.specialDesign = true
		findQuestion = true
	} else if (isButton(1)) {
		var messageBox = show_dialoguebox(findButtonX-60, display_get_gui_height()-258-IS_MOBILE*20, "", eng() ? "Who?" : "Kim?", contGUI.id, 3
		, "Lord", eng() ? "Bank Manager" : "Banka Görevlisi", eng() ? "Blacksmith" : "Geliştirici", string_return(npc_goore, instance_exists(objGoore_npc)), eng() ? "Stylist" : "Stilist", string_return(npc_senior, instance_exists(objSenior_npc)), string_return(eng() ? "Challenger" : "Söz Muhafızı", room == roomCastle_area), "Cancel")
		messageBox.specialDesign = true
		findQuestion = true
	} else if (isButton(2)) {
		target = objBanker_npc
	} else if (isButton(3)) {
		target = get_npc_from_tag(eng() ? "Runes&Cures" : "Rünler&Haplar")
	}
}

if (isQuestion(2)) {
	if (isButton(0)) {
		target = get_npc_from_tag(eng() ? "Sword Shop" : "Kılıç Satıcısı")
	} else if (isButton(1)) {
		target = get_npc_from_tag(eng() ? "Shield Shop": "Kalkan Satıcısı")
	} else if (isButton(2)) {
		target = get_npc_from_tag(eng() ? "Bow Shop" : "Yay Satıcısı")
	} else if (isButton(3)) {
		target = get_npc_from_tag(eng() ? "Armor Shop" : "Zırh Satıcısı")
	} else if (isButton(4)) {
		target = get_npc_from_tag(eng() ? "Necklace Shop" : "Kolye Satıcısı")
	} else if (isButton(5)) {
		target = get_npc_from_tag(eng() ? "Runes&Cures" : "Rünler&Haplar")
	}
}

if (isQuestion(3)) {
	if (isButton(0)) {
		target = room == roomCastle_area ? objLordDamph_npc : objLordRed_npc
	} else if (isButton(1)) {
		target = objBanker_npc
	} else if (isButton(2)) {
		target = objUpgrader_npc
	} else if (isButton(3)) {
		target = objGoore_npc
	} else if (isButton(4)) {
		target = get_npc_from_tag(eng() ? "Stylist" : "Stilist")
	} else if (isButton(5)) {
		target = objSenior_npc
	} else if (isButton(6)) {
		target = get_npc_from_tag(eng() ? "Challenger" : "Söz Muhafızı")
	}
}

if (target != pointer_null and instance_exists(target)) {
	if (findPath == pointer_null)
		findPath = path_add()
		
	mp_grid_path(global.mainGrid, findPath, objPlayer.x, objPlayer.y, target.x, target.y, true)
		
	findPath_alpha = 0.8
	findPath_x = objPlayer.x
	findPath_y = objPlayer.y
	delta_alarm(4, sec*1.5)
}