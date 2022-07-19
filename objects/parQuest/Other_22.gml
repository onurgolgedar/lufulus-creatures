if (isQuestion(1)) {
	if (isButton(0)) {
		if (is_outfight() and teleport != room) {
			fm_delete(16)
			
			if (ds_list_find_index(global.takenTutorials, 18) == -1)
				ds_list_add(global.takenTutorials, 18)
			
			contGUi.colorScreenAlpha = 1
					
			if (owner != -1 and owner != pointer_null) {
				owner.alarm[2] = sec/20
				owner.teleportTo = teleport
			}
		}
		else if (teleport == room)
			show_messagebox(200, 200, eng() ? "You are already there.\nIf you see a quest arrow near\nyour character, "+(IS_MOBILE ? "tap" : "click")+" on it to see\nthe way." : "Zaten oradasın.\nKarakterinin etrafında görev oku\nbulunuyorsa ona basarak yolu görebilirsin.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec)
		else
			show_messagebox(200, 200, eng() ? "It is not allowed when you are in fight." : "Bu işlem savaş sırasında yapılamaz.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec)
	}
	else if (isButton(2)) {
		if (is_outfight() and get_location(givenLocation) != room and givenLocation != pointer_null and givenBy != objPlayer and !(givenLocation == loc_hawmgrad and givenBy == objPlayer)) {
			contGUi.colorScreenAlpha = 1
					
			if (owner != -1 and owner != pointer_null) {
				owner.alarm[2] = sec/20
				owner.teleportTo = get_location(givenLocation) 
			}
		}
		else if (get_location(givenLocation) == room)
			show_messagebox(200, 200, eng() ? "You are already there.\nIf you see a quest arrow near\nyour character, click on it to see\nthe way." : "Zaten oradasın.\nKarakterinin etrafında görev oku\nbulunuyorsa ona basarak yolu görebilirsin.", eng() ? "Not Needed" : "İşleme Gerek Yok", sec)
		else if (!is_outfight())
			show_messagebox(200, 200, eng() ? "It is not allowed when you are in fight." : "Bu işlem savaş sırasında yapılamaz.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec)
	}
	else if (isButton(3)) {
		if (is_outfight() and teleport == room) {
			contGUi.colorScreenAlpha = 1
					
			if (owner != -1 and owner != pointer_null) {
				owner.alarm[2] = sec/20
				owner.teleportTo = teleport
			}
		}
		else if (teleport != room)
			show_messagebox(200, 200, eng() ? "You must be in the quests'\nlocation to retry it." : "Görevi baştan deneyebilmek için\ngörev bölgesinde olmalısın.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec)
		else if (!is_outfight())
			show_messagebox(200, 200, eng() ? "It is not allowed when you are in fight." : "Bu işlem savaş sırasında yapılamaz.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec)
	}
	else if (isButton(4)) {
		if (owner != -1 and owner != pointer_null) {
			var dialogue_box = show_dialoguebox(owner.x+owner.horizontalBoxCount*(owner.boxWidth+owner.boxBetween)-owner.boxBetween+owner.offset_x*2+5, owner.y
			, eng() ? ("Are you sure to delete "+name+"?") : (name+" "+(isChallenge ? "sözleşmesini" : "görevini")+" silmek istediğine\nemin misin?")
			, eng() ? "Delete" : "Sil", id, 2
			, eng() ? "Delete" : "Sil"
			, "Cancel")
		
			dialogue_box.specialDesign = true
		}
	}
}

if (isQuestion(2)) {
	if (isButton(0)) {
		if (owner != -1 and owner != pointer_null) {
			delete_quest(j+i*owner.verticalBoxCount)
		}
	}
}