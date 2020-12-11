var isEnglish = eng()

if (isQuestion(1)) {
	if (isButton(0)) {
		if (!instance_exists(objItemBag) and is_outfight())
			instance_create_layer(20, 245, "lyWindows", objItemBag)
		
	    with (objTradeWindow)
			close_table()
		
	    var tradeWindow = instance_create_layer(400+IS_MOBILE*300, 245-IS_MOBILE*180, "lyWindows", objTradeWindow)
	    tradeWindow.owner = id

		ds_list_add(windows, tradeWindow)
	}
	else if (isButton(1)) {		
		ds_list_add(windows, show_messagebox(200, 200, isEnglish ?
		("[c="+string(c_aqua)+"]Near me[/c], you can [c="+string(c_aqua)+"]"+(IS_MOBILE ? "<Double Tap>" : "<Right Click>")+"[/c] an upgradable\nitem to upgrade it."
		+"You can also [c="+string(c_aqua)+"]drag&drop[/c] the item\nto me.\n\nNote: You need at least one material which is proper\nfor the target item's segment.")
		: ("[c="+string(c_aqua)+"]Yanımda[/c], [c="+string(c_aqua)+"]"+(IS_MOBILE ? "<Çift Dokun>" : "<Çift Tıkla>")+"[/c] ile bir eşyaya tıklarsan\nonu geliştirebilirsin."
		+" Ayrıca eşyaları masaya \n[c="+string(c_aqua)+"]taşıyıp bırakabilirsin[/c].\n\nNot: Geliştirmek istediğin eşyanın kademesine\nuygun en az bir materyal gereklidir.[/c]"),
		eng() ? "Info" : "Bilgi"))
	}
	else if (isButton(2)) {
		ds_list_add(windows, show_messagebox(200, 200,
		isEnglish ? ("After it fails:\nIf the item is [c="+string(c_nicered)+"]+0, you may lose your item.[/c]\nOtherwise, [c="+string(c_ltyellow)+"] lost 1 upgrade level.[/c]")
		: ("Geliştirme başarısız olunca:\nEğer eşya [c="+string(c_nicered)+"]+0 ise onu kaybedebilirsin.[/c]\nDeğilse, [c="+string(c_ltyellow)+"]sadece 1 gelişim seviyesi kaybeder.[/c]"),
		eng() ? "Info" : "Bilgi"))
	}
	else if (isButton(3)) {
		if (is_quest_incomplete(objQuest_blacksmith2)) {
			dialogue_progress(1, 1, id)
		}
	}

}
else if (isQuestion(2)) {
	if (isButton(4) and materialsCount_bank+materialsCount_bag < global.itemUpgrade[itemI, itemJ]*2+1)
		show_messagebox(150, 350,
		isEnglish ? ("You have not enough materials.\n"
		+"The number of extra materials that you need for upgrading\nan item precisely is twice as many as the [c="+string(c_ltorange)+"]item's upgrade level[/c].\n\nExample:"
		+"\nTo upgrade an [c="+string(c_ltorange)+"](+2)[/c] item, [c="+string(c_ltorange)+"]4 extra materials[/c] are needed.")
		: ("Yeterince materyalin yok.\n"
		+"Kesin geliştirme için ihtiyacın olan ekstra materyal sayısı,\neşyanın [c="+string(c_ltorange)+"]gelişim seviyesinin[/c] iki katı kadardır.\n\nÖrneğin:"
		+"\n[c="+string(c_ltorange)+"](+2)[/c] eşyayı kesin geliştirmek için, [c="+string(c_ltorange)+"]4 ekstra materyal[/c] gereklidir."),
		isEnglish ? ("[c="+string(c_aqua)+"]You need "+string(global.itemUpgrade[itemI, itemJ]*2-(materialsCount_bank+materialsCount_bag)+1)+" more material(s).[/c]")
		: ("[c="+string(c_aqua)+"]"+string(global.itemUpgrade[itemI, itemJ]*2-(materialsCount_bank+materialsCount_bag)+1)+" materyale daha ihtiyacın var.[/c]"))
	else if (isButton(0) or isButton(1) or (isButton(2) and instance_exists(efboxLevelBonus)) or isButton(3) or isButton(4) or isButton(5)) {
		itemUpgradeChance = min(100, ceil(itemUpgradeChance*(1+0.5*(isButton(1) or isButton(2)))))
		
		if (isButton(3) or isButton(4) or isButton(5)) {
			itemUpgradeChance = 100
			if (isButton(5)) {
				itemUpgradeCost *= 8
				itemUpgradeCost += 50
			}
		}
		
		if ((global.money >= itemUpgradeCost or isButton(2) or isButton(3) or isButton(4) or isButton(0)) and itemI != -1) {			
			if (chance(itemUpgradeChance, 100)) {
				show_messagebox(200, 400, eng() ? "Item has been successfully upgraded." : "Eşya başarıyla geliştirildi.", eng() ? "Congratulations!" : "Tebrikler!", 1.25*sec)
				global.itemUpgrade[itemI, itemJ]++
				objItemBag.itemUpgrade[itemI, itemJ] = global.itemUpgrade[itemI, itemJ]
				
				if (global.item[itemI, itemJ] == objSw_001Q) {
					if (is_quest_incomplete(objQuest_blacksmith2))
						quest_progress(objQuest_blacksmith2, 1)
				}
				
				if (!global.isCheated) {
					if (global.itemUpgrade[itemI, itemJ] >= 8) {
						if (!steam_get_achievement("blacksmith_6"))
							steam_set_achievement("blacksmith_6")
						
						if (!steam_get_achievement("blacksmith_8"))
							steam_set_achievement("blacksmith_8")
					}
					else if (global.itemUpgrade[itemI, itemJ] >= 6 and !steam_get_achievement("blacksmith_6"))
						steam_set_achievement("blacksmith_6")
				}
				
				audio_play_sound(sndSuccess, 1, 0)
				
				if (isButton(2))
					instance_destroy(efboxLevelBonus)
				else if (!isButton(3) and !isButton(4) and !isButton(0))
					change_money(-itemUpgradeCost)
				else if (isButton(3))
					global.upgradeTickets -= 1
				else if (isButton(4)) {
					var totalMaterialsNeeded = (global.itemUpgrade[itemI, itemJ]-1)*2//+1 on top
					var takenFromBag = clamp(totalMaterialsNeeded, 0, materialsCount_bag)
					var takenFromBank = totalMaterialsNeeded-takenFromBag
					
					if (takenFromBag > 0)
						decrease_collectable_item(objUpgradeMaterial, takenFromBag, item_get_upgradematerial_type(itemLevel, itemSpecialty))
						
					if (takenFromBank > 0)
						decrease_collectable_item_bank(objUpgradeMaterial, takenFromBank, item_get_upgradematerial_type(itemLevel, itemSpecialty))
				}
				
				itembag_refresh()
				bankwindow_refresh()
				update_character()
				item_shining_refresh()
			}
			else {
				audio_play_sound(sndFailure, 1, 0)
				
				if (isButton(2)) {
					show_messagebox(200, 400, isEnglish ? "Nothing has changed." : "Bir şey değişmedi.", isEnglish ? "Protected." : "Korundu.", 4*sec)
					instance_destroy(efboxLevelBonus)
				}
				else if (global.itemUpgrade[itemI, itemJ] < 1) {
					show_messagebox(200, 400, isEnglish ? "\nYou have lost the item because\nthe item was +0." : "\nEşyayı kaybettin çünkü gelişim seviyesi +0'dı."
					, isEnglish ? ("Item lost, [c="+string(c_aqua)+"]\nthe price is refunded.[/c]") : ("Eşya kayboldu, [c="+string(c_aqua)+"]\nücret iade edildi.[/c]"), 5*sec)
					
					if (objItemBag.item[itemI, itemJ].specialty >= 50) {
						show_messagebox(250, 450, isEnglish ? ("I am sorry, the item was really special.\nI pay you the worth of the item.\n\nRefund: "+string(objItemBag.item[itemI, itemJ].worth)+"[/c]")
						: ("Üzgünüm, bu eşya çok özeldi.\nSana eşyanın ederini aynen veriyorum.\n\nİade: "+string(objItemBag.item[itemI, itemJ].worth)+"[/c]")
						, isEnglish ? ("[c="+string(c_aqua)+"]Gold Refund[/c]") : ("[c="+string(c_aqua)+"]Altın İadesi[/c]"))
						change_money(objItemBag.item[itemI, itemJ].worth, true)
					}
					
					delete_item(itemI, itemJ)
				}
				else {
					show_messagebox(200, 400, isEnglish ? ("Item has lost 1 upgrade level.") : ("Eşya 1 gelişim seviyesi kaybetti."), isEnglish ? "Failure!" : "Başarısız!", 5*sec)
					//change_money(-itemUpgradeCost)
					global.itemUpgrade[itemI, itemJ] -= 1
					objItemBag.itemUpgrade[itemI, itemJ] = global.itemUpgrade[itemI, itemJ]
				}

				itembag_refresh()
				update_character()
				item_shining_refresh()
			}
			
			global.anticheat_ownings = recalculate_sha_ownings()
			
			// Use one material
			if (materialsCount_bag > 0)
				decrease_collectable_item(objUpgradeMaterial, 1, item_get_upgradematerial_type(itemLevel, itemSpecialty))
			else if (materialsCount_bank > 0)
				decrease_collectable_item_bank(objUpgradeMaterial, 1, item_get_upgradematerial_type(itemLevel, itemSpecialty))
			
			//save_bag(global.saveNo)
			
			with (objMWeaponControl)
				event_perform(ev_other, ev_user2)
		}
		else if (itemI != -1)
			show_messagebox(200, 90, isEnglish ? "You have not enough money." : "Yeterince altının yok.", isEnglish ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
	}
	else if (isButton(2) and !instance_exists(efboxLevelBonus))
		show_messagebox(200, 90, isEnglish ? "You have no LV Bonus.\nYou gain LV Bonus when you level up." : "LV Bonus'un bulunmuyor.\nBu bonusu seviye atladığında kazanırsın.", isEnglish ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
}

/*if (isQuestion(qKey) and is_qKey_dialogueEnd(qKey) and get_dialogue_id(qKey) == 1) {
	quest_progress(objQuest_blacksmith2, 1)
}*/