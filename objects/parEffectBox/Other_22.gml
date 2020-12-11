if (isQuestion(1)) {
	if (isButton(0)) {
		var kit = pointer_null
		if (global.level < 10)
			kit = item_exists(objMedicalKit) ? objMedicalKit : pointer_null
		else if (global.level < 20)
			kit = item_exists(objMedicalKit2) ? objMedicalKit2 : pointer_null
		else if (global.level < 30)
			kit = item_exists(objMedicalKit3) ? objMedicalKit3 : pointer_null
		else if (global.level < 40)
			kit = item_exists(objMedicalKit4) ? objMedicalKit4 : pointer_null
			
		if (kit != pointer_null) {
			kit = instance_create(-50, -50, kit)
			
			with (kit)
				give_answer(0, 1)
				
			instance_destroy(kit)
		}
		else
			show_messagebox(300, 300, eng() ? "You have no Medical Kit. You can buy them\nfrom [c="+string(c_aqua)+"]Runes&Cures (Doctor)[/c] in any castle." : "Medikal Kitiniz bulunmuyor. Kitleri herhangi bir kalede\n[c="+string(c_aqua)+"]Rünler&Haplar (Doktor)[/c] satıcısından alabilirsiniz.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec*2)
	}
}

if (isQuestion(2)) {
	if (isButton(0)) {
		if (deletable)
			instance_destroy()
		else
			show_messagebox(300, 300, eng() ? "You cannot clear this effect." : "Bu etkiyi kaldıramazsın.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec*1.5)
	}
}

if (isQuestion(3)) {
	/*if (isButton(0)) {
	}*/
}