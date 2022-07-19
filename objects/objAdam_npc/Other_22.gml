if (isQuestion(1)) {
	if (isButton(0)) {
		if (!instance_exists(objitemBag) and is_outfight())
			instance_create_layer(20, 245-IS_MOBILE*180, "lyWindows", objitemBag)
		
	    with (objTradeWindow)
			close_table()
		
	    var tradeWindow = instance_create_layer(400+IS_MOBILE*300, 245-IS_MOBILE*180, "lyWindows", objTradeWindow)
	    tradeWindow.owner = id
		if (tag == "Challenger" or tag == "Söz Muhafızı")
			tradeWindow.ltext_trade = eng() ? "Challenges" : "Sözleşmeler"
		ds_list_add(windows, tradeWindow)
	}
	else if (isButton(1)) {
		ask_npc(eng() ? "Choose your clothes' style, it is free.\nIt changes your own armor's colors." : "Kıyafetin için stil seç, ücretsizdir.\nSadece sahip olduğun zırhın rengini\ndeğiştirir.", 2
		, eng() ? "Original" : "Orijinal", "No 1", "No 2", "No 3", eng() ? "Black&White" : "Siyah&Beyaz", "Cancel")
	}
}
else if (isQuestion(2)) {
	if (isButton(0)) {
		global.clothesStyle = 0.0
		save_general(global.saveNo)
	}
	else if (isButton(1)) {
		global.clothesStyle = 1.0
		save_general(global.saveNo)
	}
	else if (isButton(2)) {
		global.clothesStyle = 2.0
		save_general(global.saveNo)
	}
	else if (isButton(3)) {
		global.clothesStyle = 3.0
		save_general(global.saveNo)
	}
	else if (isButton(4)) {
		global.clothesStyle = 4.0
		save_general(global.saveNo)
	}
}