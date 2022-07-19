if (isQuestion(1)) {
	if (isButton(0)) {
		/*if (instance_exists(objTradeWindow)) {			
		    with (objTradeWindow)
				close_table()
		}*/
	
		if (instance_exists(objBankWindow)) {			
		    with (objBankWindow)
				close_table()
		}
		
		var tradeWindow = instance_create_layer(400+IS_MOBILE*240, 245-IS_MOBILE*180, "lyWindows", objBankWindow)
		tradeWindow.owner = id
		ds_list_add(windows, tradeWindow)
	}
	if (isButton(1)) {
		var loan = calculate_debt()

		if (global.debt == 0) {
			if (global.debtPayingTime == -1 or get_day() >= global.debtPayingTime+2) {
				change_money(loan, true)
			
				global.debtCount += 1
				global.debt = calculate_refund(loan)
			
				save_general(global.saveNo)
			}
			else
				show_messagebox(400, 400, eng() ? "You need to wait at least two days after\nthe last debt payment date." : "Son borç ödemenden sonra en az iki\ngün beklemelisin.", eng() ? "Cannot be used." : "Kullanılamaz.", sec*2)
		}
		else {
			if (global.money >= global.debt) {
				change_money(-global.debt, true)
				global.debt = 0
				global.debtPayingTime = get_day()
				
				save_general(global.saveNo)
			}
			else
				show_messagebox(600, 90, eng() ? "You have not enough money." : "Yeterince altının yok.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
		}
	}
	if (isButton(2)) {
		if (!instance_exists(objitemBag) and is_outfight())
			instance_create_layer(20, 245-IS_MOBILE*180, "lyWindows", objitemBag)
		
		with (objTradeWindow)
			close_table()
		
		var tradeWindow = instance_create_layer(400+IS_MOBILE*300, 245-IS_MOBILE*180, "lyWindows", objTradeWindow)
		tradeWindow.owner = id
		ds_list_add(windows, tradeWindow)
	}
}