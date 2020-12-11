/// @param value
function change_hours() {

	var beforeDay = get_day()
	global.totalHours += argument[0]

	global.anticheat_hour = recalculate_sha_time()

	with (contGUI)
		event_perform(ev_alarm, 5)

	if (get_day() > beforeDay and !is_room_out()) {
		with (contGUI)
			minute = irandom(5)
		
	#region RECRUIT EXPENSE
		var givenRecruitExpense = 0
		var lostLowRecruit1 = 0
		var lostLowRecruit2 = 0
		var lostRecruit1 = 0
		var lostRecruit2 = 0
		var lostRecruit3 = 0
		var lostRecruit4 = 0
		with (efboxRecruitedWarrior4) {
			if (global.money > RECRUIT_WARRIOR_EXPENSE_4) {
				givenRecruitExpense += RECRUIT_WARRIOR_EXPENSE_4
				change_money(-RECRUIT_WARRIOR_EXPENSE_4)
			}
			else {
				instance_destroy()
				lostRecruit4++
			}
		}
		with (efboxRecruitedWarrior3) {
			if (global.money > RECRUIT_WARRIOR_EXPENSE_3) {
				givenRecruitExpense += RECRUIT_WARRIOR_EXPENSE_3
				change_money(-RECRUIT_WARRIOR_EXPENSE_3)
			}
			else {
				instance_destroy()
				lostRecruit3++
			}
		}
		with (efboxRecruitedWarrior2) {
			if (global.money > RECRUIT_WARRIOR_EXPENSE_2) {
				givenRecruitExpense += RECRUIT_WARRIOR_EXPENSE_2
				change_money(-RECRUIT_WARRIOR_EXPENSE_2)
			}
			else {
				instance_destroy()
				lostRecruit2++
			}
		}
		with (efboxRecruitedWarrior1) {
			if (global.money > RECRUIT_WARRIOR_EXPENSE_1) {
				givenRecruitExpense += RECRUIT_WARRIOR_EXPENSE_1
				change_money(-RECRUIT_WARRIOR_EXPENSE_1)
			}
			else {
				instance_destroy()
				lostRecruit1++
			}
		}
		with (efboxRecruitedLowWarrior1) {
			if (global.money > RECRUIT_LOW_WARRIOR_EXPENSE_1) {
				givenRecruitExpense += RECRUIT_LOW_WARRIOR_EXPENSE_1
				change_money(-RECRUIT_LOW_WARRIOR_EXPENSE_1)
			}
			else {
				instance_destroy()
				lostLowRecruit1++
			}
		}
		with (efboxRecruitedLowWarrior2) {
			if (global.money > RECRUIT_LOW_WARRIOR_EXPENSE_2) {
				givenRecruitExpense += RECRUIT_LOW_WARRIOR_EXPENSE_2
				change_money(-RECRUIT_LOW_WARRIOR_EXPENSE_2)
			}
			else {
				instance_destroy()
				lostLowRecruit2++
			}
		}
	
		if (givenRecruitExpense > 0 or lostRecruit1 > 0 or lostRecruit2 > 0 or lostRecruit3 > 0 or lostRecruit4 > 0 or lostLowRecruit1 > 0 or lostLowRecruit2 > 0) {
			var recruitText
			if (eng()) {
				recruitText = "You spend [c="+string(c_gold)+"]"+string(givenRecruitExpense)+" gold[/c] for recruited warriors."
				if (lostLowRecruit1 > 0)
					recruitText += "\nYou lost "+string(lostLowRecruit1)+" warrior. [c="+string(c_red)+"]-"+string(lostLowRecruit1)+" Warrior (Level: 3)[/c]"
				if (lostLowRecruit2 > 0)
					recruitText += "\nYou lost "+string(lostLowRecruit2)+" warrior. [c="+string(c_red)+"]-"+string(lostLowRecruit2)+" Warrior (Level: 6)[/c]"
				if (lostRecruit1 > 0)
					recruitText += "\nYou lost "+string(lostRecruit1)+" warrior. [c="+string(c_red)+"]-"+string(lostRecruit1)+" Warrior (Level: 10)[/c]"
				if (lostRecruit2 > 0)
					recruitText += "\nYou lost "+string(lostRecruit2)+" warrior. [c="+string(c_red)+"]-"+string(lostRecruit2)+" Warrior (Level: 15)[/c]"
				if (lostRecruit3 > 0)
					recruitText += "\nYou lost "+string(lostRecruit3)+" warrior. [c="+string(c_red)+"]-"+string(lostRecruit3)+" Warrior (Level: 20)[/c]"
				if (lostRecruit4 > 0)
					recruitText += "\nYou lost "+string(lostRecruit4)+" warrior. [c="+string(c_red)+"]-"+string(lostRecruit4)+" Warrior (Level: 25)[/c]"
				if (lostRecruit1 > 0 or lostRecruit2 > 0 or lostRecruit3 > 0 or lostRecruit4 > 0)
					recruitText += "\n\nYou lost warriors if you do not pay their daily expenses."
			}
			else {
				recruitText = "Savaşçılarına [c="+string(c_gold)+"]"+string(givenRecruitExpense)+" altın[/c] ödedin."
				if (lostLowRecruit1 > 0)
					recruitText += "\n"+string(lostLowRecruit1)+" adet savaşçı kaybettin. [c="+string(c_red)+"]-"+string(lostLowRecruit1)+" Savaşçı (Seviye: 3)[/c]"
				if (lostLowRecruit2 > 0)
					recruitText += "\n"+string(lostLowRecruit2)+" adet savaşçı kaybettin. [c="+string(c_red)+"]-"+string(lostLowRecruit2)+" Savaşçı (Seviye: 6)[/c]"
				if (lostRecruit1 > 0)
					recruitText += "\n"+string(lostRecruit1)+" adet savaşçı kaybettin. [c="+string(c_red)+"]-"+string(lostRecruit1)+" Savaşçı (Seviye: 10)[/c]"
				if (lostRecruit2 > 0)
					recruitText += "\n"+string(lostRecruit2)+" adet savaşçı kaybettin. [c="+string(c_red)+"]-"+string(lostRecruit2)+" Savaşçı (Seviye: 15)[/c]"
				if (lostRecruit3 > 0)
					recruitText += "\n"+string(lostRecruit3)+" adet savaşçı kaybettin. [c="+string(c_red)+"]-"+string(lostRecruit3)+" Savaşçı (Seviye: 20)[/c]"
				if (lostRecruit4 > 0)
					recruitText += "\n"+string(lostRecruit4)+" adet savaşçı kaybettin. [c="+string(c_red)+"]-"+string(lostRecruit4)+" Savaşçı (Seviye: 25)[/c]"
				if (lostRecruit1 > 0 or lostRecruit2 > 0 or lostRecruit3 > 0 or lostRecruit4 > 0)
					recruitText += "\n\nGünlük ücretlerini ödeyemezsen savaşçı kaybedersin."
			}
		
			global.recruitText = recruitText
		}
	#endregion
		
		if (ds_list_find_value(global.gameChoices, 0) == choice_2 and get_day() mod 2 == 0) {
			var gift = choose(objSilver, objSilver, objSilver, objSilver, objPlatinum, objPlatinum, objGoldPiece)
		
			var addToPage = -1
			var added = false
			for (var i = 1; i <= global.bagMaxPage; i++) {
				if (!is_page_empty_bank(i)) {
					addToPage = i
					break
				}
			}
		
			if (addToPage == -1 and empty_box_exists_bank())
				added = add_item_bank(gift)
			else
				added = add_item_bank(gift, -1, -1, -1, -1, -1, i)
			
			if (added) {
				var giftInstance = instance_create(0, 0, gift)
				var giftName = giftInstance.name
			
				show_messagebox(400, 200, eng() ? (npc_goore+"'s soldiers add [c="+string(c_aqua)+"]1 "+giftName+"[/c] to your bank.") : (npc_goore+"'un askerleri bankana [c="+string(c_aqua)+"]"+giftName+"[/c] ekledi."), eng() ? "Support" : "Takviye")
			}
			else
				show_messagebox(400, 200, eng() ? ("You couldn't take the item support from "+npc_goore+".\nBecause your bank is full.") : (npc_goore+"'dan eşya desteği alamadın\nçünkü banka dolu."), eng() ? "Failed Support" : "Başarısız Takviye")
		}
		
		var bankItems_totalRent = 0
		for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
			for (var j = 0; j < global.bagBoxCount_vertical; j++) {
				if (global.item_bank[i, j] != -1 and get_day()-global.itemRentTime_bank[i, j] > 2) {
					var itemInstance = instance_create(-50, -50, global.item_bank[i, j])
				
					with (itemInstance) {
						item_self_calculate()
						bankItems_totalRent += floor((cWorth*BANK_RENT_RATIO)*(1+(type == type_valuable)))
					}
				
					instance_destroy(itemInstance)
				}
			}
		}
		
		global.rentGold *= 1+(BANK_INTEREST_RATIO+ds_list_size(global.titles)*BANK_INTEREST_RATIO_PERTITLE)
		
		if (bankItems_totalRent > 0) {		
			var beforeRentGold = global.rentGold
			global.rentGold += bankItems_totalRent
			for (var i = 1; i <= global.bagMaxPage; i++)
				global.rentGold += is_page_empty_bank(i)*(bankItems_totalRent*BANK_EMPTYPAGEBONUS_RATIO)
		
			global.rentGold = floor(global.rentGold)
		
			global.bankRentMessage_value = round(global.rentGold-beforeRentGold)
		
			global.anticheat_ownings = recalculate_sha_ownings()
		}
	}


}
