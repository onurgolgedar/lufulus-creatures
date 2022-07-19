var noAnim = anim_end(objPlayer)
var sellingMode = instance_exists(objTradeWindow) and !objTradeWindow.loot and !is_active(i, j)

var delText = eng() ? (sellingMode ? "sell" : "delete") : (sellingMode ? "satmak" : "silmek")
var delText_upper = eng() ? (sellingMode ? "Sell" : "Delete") : (sellingMode ? "Sat" : "Sil")

if (isQuestion(1)) {
	if (isButton(0)) {
		if (type == type_mweapon or type == type_sweapon
		or type == type_clothes or type == type_necklace or type == type_medallion) { 
			if (noAnim) {
				if (!is_active(i, j) and global.level >= itemLevel/*-2*/ and (isDeletable or isForQuest == false)) {
					change_active(type, i, j)
					
					if (instance_exists(objitemBag) and from == window_items and !global.gamepad_active) {
						if (!instance_exists(objEquipmentBag)) {
							if (!IS_MOBILE) {
								if (objitemBag.y+350 < display_get_gui_height()-60)
									instance_create_layer(objitemBag.x+240, objitemBag.y+400, "lyWindows", objEquipmentBag)
								else
									instance_create_layer(40, 60, "lyWindows", objEquipmentBag)
							}
							else
								instance_create_layer(objitemBag.x+420, objitemBag.y, "lyWindows", objEquipmentBag)
						}
					}
				}
				else if (is_active(i, j))
				    deactive_item(type)
				else if (!(isDeletable or isForQuest == false))
					show_messagebox(300, 300, eng() ? "This item is only for a quest." : "Bu eşya görevin içindir.", eng() ? "Not Equipped" : "Kuşanılmadı", 2*sec)
				else if (global.level < itemLevel/*-2*/)
					show_messagebox(300, 300, eng() ? ("Your level is not enough.\n\n[c="+string(c_aqua)+"]Required Level: "+string(itemLevel)+"[/c]") : ("Seviyen yetersiz.\n\n[c="+string(c_aqua)+"]Gerekli Seviye: "+string(itemLevel)+"[/c]"), eng() ? "Not Equipped" : "Kuşanılmadı", 2*sec)
			}
			else
				show_messagebox(300, 300, eng() ? "Stop moving for this process." : "Bu işlem için hareketini durdur.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
		}
		else if (type == type_potion or type == type_pet or type == type_call) {
			var additionalCondition = true
			if (object_index == objMedicalKit or object_index == objMedicalKit2 or object_index == objMedicalKit3 or object_index == objMedicalKit4 or type == type_call) {
				if (type == type_call) {
					if (instance_number(parEfbox_RecruitedWarrior) >= ds_list_size(global.titles))
						additionalCondition = -2
				}
				else {
					if (!test_effectbox(efboxDeath, objPlayer.id))
						additionalCondition = -1
					else if !(global.level >= (itemLevel-1)*10 and (global.level <= itemLevel*10-1 or (itemLevel == 4 and global.level == 40)))
						additionalCondition = 0
				}
			}
			
			if (additionalCondition == true) {
				with (objPlayer) {
					add_effectbox(other.efbox)
					
					if (other.type == type_potion) {
						if (other.object_index == objPheromoneKit 
						or other.object_index == objPheromoneKit10
						or other.object_index == objPheromoneKit20
						or other.object_index == objPheromoneKit30)
							instance_create(x, y, efPheromone)
						else
							instance_create(x, y, efBasicHeal)
							
						var snd = audio_play_sound(sndHeal, 10, false)
						audio_sound_pitch(snd, 1.2)
					}
					
					save_permanentefboxes(global.saveNo)
				}
			
				if (type != type_pet)
					decrease_collectable_item(object_index, 1)
			}
			else if (additionalCondition == 0)
				show_messagebox(600, 300, eng() ? "This kit is not for your level.\nYou can buy appropriate kits from\n[c="+string(c_aqua)+"]Runes&Cures[/c] at "+loc_hawmgrad : "Bu kit, seviyen için uygun değil. Seviyene uygun kitleri "+loc_hawmgrad+"'daki\nRünler&Tedaviler satıcısında bulabilirsin.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
			else if (additionalCondition == -1)
				show_messagebox(600, 300, eng() ? "You have no death effect.\nThis effect appears when after your\nhealth is below 0." : "Ölüm etkisi altında değilsiniz.\nÖlüm etkisi karakterin canı\n0'ın altına indikten sonra başlar.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
			else if (additionalCondition == -2)
				show_messagebox(600, 300, eng() ? ("Your group cannot have more than [c="+string(c_aqua)+"]"+string(ds_list_size(global.titles))+"[/c] warriors.\n[c="+string(c_aqua)+"]Each new title you have increases your\nmaximum party size.[/c]") : ("En fazla [c="+string(c_aqua)+"]"+string(ds_list_size(global.titles))+"[/c] savaşçı kiralayabilirsin.\n[c="+string(c_aqua)+"]Kazandığın her ünvan parti kapasiteni artırır.[/c]"), eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
		}
		else if (type == type_challengeItem) {
			if (global.level <= maxLevel and global.level >= minLevel and !quest_exists(challenge) and !is_quest_finished(challenge) and (conditionalQuest == pointer_null or quest_exists(conditionalQuest))) {
				add_quest(challenge)
				
				if (!autoUse)
					delete_item(i, j)
					
				ds_list_clear(contGUi.blueDirectionArrows)
				with (objAdam_npc) {
					if (tag == (eng() ? "Challenger" : "Söz Muhafızı"))
						event_user(14)
				}
			}
			else if (!quest_exists(challenge) and !is_quest_finished(challenge))
				show_messagebox(600, 300, eng() ? "Your level is not appropriate.\nRead the description of the item." : "Seviyeniz uygun değil.\nEşyanın açıklamasını okuyun.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
			else if (!is_quest_finished(challenge))
				show_messagebox(600, 300, eng() ? "You already had accepted this challenge before." : "Bu sözleşmeyi daha önce zaten kabul ettin.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
			else if (conditionalQuest != pointer_null and !quest_exists(conditionalQuest)) {
				var questInstance = instance_create(0, 0, conditionalQuest)
				show_messagebox(600, 90, eng() ? "This challenge requires existance\nof a spesific quest([c="+string(c_fuchsia)+"]"+questInstance.name+"[/c])." : "Bu sözleşmeyi alabilmek için belirli bir\ngöreve([c="+string(c_fuchsia)+"]"+questInstance.name+"[/c]) sahip olmanız gerekmekte.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
				instance_destroy(questInstance)
			}
			else
				show_messagebox(600, 300, eng() ? "You already had finished this challenge before." : "Bu sözleşmeyi daha önce zaten tamamladın.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
		}
	}
	else if (isButton(1)) {
		var dialogue_box = show_dialoguebox(owner.x+owner.box_x[i, j]-owner.boxEdge/3, owner.y+owner.box_y[i, j]-owner.boxEdge/3
		, eng() ? ("Are you sure to "+delText+" [c="+string(c_white)+"]"+name+"[/c]?") : ("[c="+string(c_white)+"]"+name+"[/c] eşyasını "+delText+" istediğine\nemin misin?")
		, delText_upper, id, 2
		, delText_upper
		, "Cancel")
		
		dialogue_box.specialDesign = true
	}
	else if (isButton(2)) {
		if (noAnim and isDeletable and !is_active(i, j)) {
			var txt, titleanswer
			var openDialogueBox = false
			
			if (is_item_upgradabletype(id) and upgrade != 0) {
				if (upgrade != 0) {
					openDialogueBox = true
					txt = eng() ? ("Are you sure to dismantle [c="+string(c_white)+"]"+name+"[/c]\nto "+string(upgrade < unique_number ? (floor(upgrade)*2) : "3")+" [c="+string(c_ltyellow)+"](Type "+get_upgradematerial_name(item_get_upgradematerial_type(itemLevel, specialty))+")[/c] material(s)?") : ("[c="+string(c_white)+"]"+name+"[/c] eşyasını "+string(upgrade < unique_number ? (floor(upgrade)*2) : "3")+" [c="+string(c_ltyellow)+"]("+get_upgradematerial_name(item_get_upgradematerial_type(itemLevel, specialty))+" Tipi)[/c] materyale\nparçalamak istediğine emin misin?")
					titleanswer = eng() ? "Dismantle" : "Parçala"
				}
				else {
					show_messagebox(300, 300, eng() ? "Items can be dismantled into materials\n[c="+string(c_aqua)+"]twice as much as their development level[/c].\nFor example, an +3 item provides 6 materials." : "Eşya parçalanınca [c="+string(c_aqua)+"]gelişim seviyesinin iki katı kadar[/c] materyale dönüşür.\nÖrneğin +3 bir eşya parçalanırsa 6 materyal oluşur.", eng() ? "+0 Items Cannot Be Dismantled" : "+0 Eşyalar Parçalanamaz")
				}
			}
			else {
				openDialogueBox = true
				txt = eng() ? ("Are you sure to delete [c="+string(c_white)+"]"+name+"[/c]?") : ("[c="+string(c_white)+"]"+name+"[/c] eşyasını silmek\nistediğine emin misin?")
				if (type == type_challengeItem)
					txt += eng() ? "\n\nIn order to delete the quest, you can use Quest\nWindow <J>." : "\n\nGörevi kaldırmak için görev penceresini <J>\nkullanabilirsin."
				titleanswer = eng() ? "Delete" : "Sil"
			}
			
			if (openDialogueBox) {
				var dialogue_box = show_dialoguebox(owner.x+owner.box_x[i, j]-owner.boxEdge/3, owner.y+owner.box_y[i, j]-owner.boxEdge/3
													, txt
													, titleanswer, id, 4
													, titleanswer
													, "Cancel")
				dialogue_box.specialDesign = true
			}
		}
		else {
			if (!isDeletable)
				show_messagebox(300, 300, eng() ? "This item is permanent." : "Bu eşya kalıcıdır.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
			else if (is_active(i, j))
				show_messagebox(300, 300, eng() ? "It is active." : "Eşya kullanılıyor.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
			else
				show_messagebox(300, 300, eng() ? "Stop moving for this process." : "Bu işlem için hareketini durdur.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
		}
	}
	else if (isButton(3)) {
		var dialogue_box = show_dialoguebox(owner.x+owner.box_x[i, j]-owner.boxEdge/3, owner.y+owner.box_y[i, j]-owner.boxEdge/3
		, eng() ? ("Are you sure to "+delText+" the\nall of [c="+string(c_white)+"]"+name+"[/c](s)?") : ("[c="+string(c_white)+"]"+name+"[/c] eşyalarının hepsini "+delText+"\nistediğine emin misin?")
		, eng() ? delText_upper+" All" : "Hepsini "+delText_upper, id, 3
		, eng() ? delText_upper+" All" : "Hepsini "+delText_upper
		, "Cancel")
		
		dialogue_box.specialDesign = true
	}
	else if (isButton(4)) {
		var dialogue_box = show_dialoguebox(owner.x+owner.box_x[i, j]-owner.boxEdge/3, owner.y+owner.box_y[i, j]-owner.boxEdge/3
		, eng() ? ("Are you sure to "+delText+" the\nall of [c="+string(c_white)+"]"+name+"[/c](s)?") : ("[c="+string(c_white)+"]"+name+"[/c] eşyalarının hepsini "+delText+"\nistediğine emin misin?")
		, eng() ? delText_upper+" All" : "Hepsini "+delText_upper, id, 5
		, eng() ? delText_upper+" All" : "Hepsini "+delText_upper
		, "Cancel")
		
		dialogue_box.specialDesign = true
	}
	else if (isButton(5)) {
		var nearestUpgrader = instance_nearest(objPlayer.x, objPlayer.y, objUpgrader_npc)
		if (nearestUpgrader != noone) {
			if (is_item_upgradable(id)) {
				if (point_distance(nearestUpgrader.x, nearestUpgrader.y, objPlayer.x, objPlayer.y) < 300 and
				!collision_line(nearestUpgrader.x, nearestUpgrader.y, objPlayer.x, objPlayer.y, parSolid, 1, 1)) {
					with (nearestUpgrader) {
						global.itemSelected = other.id
						event_perform(ev_other, ev_user1)
						global.itemSelected = -1
					}
				}
				else
					show_messagebox(300, 300, eng() ? "Blacksmith is too far." : "Geliştirme uzmanı uzakta.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
			}
		}
	}
	else if (isButton(6)) {
		if (isDeletable and !is_active(i, j) and empty_box_exists_bank() and global.debt == 0) {
			var success = add_item_bank(object_index, upgrade, extension[0], extension[1])	
			
			if (success) {
		        if (isCollectable)
		            decrease_collectable_item(object_index, 1, upgrade)
		        else
		            delete_item(i, j)
			}
		}
		else {
			if (is_active(i, j))
				show_messagebox(300, 300, eng() ? "It is active." : "Eşya kullanılıyor.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
			else if (!empty_box_exists_bank())
				show_messagebox(200, 200, eng() ? "At least, one empty slot is needed." : "Bankada boş alan yok.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
			else if (global.debt != 0)
				show_messagebox(400, 400, eng() ? "You need to pay your debt." : "Borcunu ödemelisin.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec*2)
			else
				show_messagebox(300, 300, eng() ? "This item is permanent." : "Bu eşya kalıcıdır.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
		}
	}
	else if (isButton(8)) {
		if (!is_active(i, j)) {
			if (object_index != objSw_000 or (room != roomBeforeRoad and room != roomRoad))
				delete_item(i, j)
			else
				show_messagebox(300, 300, eng() ? "It is too early to delete this item." : "Bu eşyayı silmek için fazla erken.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
		}
		else
			show_messagebox(300, 300, eng() ? "It is active." : "Eşya kullanılıyor.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
	}
	else if (isButton(9)) {
		if (global.itemCount[i, j] > 5) {
			var dialogue_box = show_dialoguebox(owner.x+owner.box_x[i, j]-owner.boxEdge/3, owner.y+owner.box_y[i, j]-owner.boxEdge/3
			, eng() ? ("Are you sure to convert 6 materials\nto one better material?") : ("6 materyali daha iyi bir materyale\ndönüştürmek istediğine emin misin?")
			, eng() ? "Convert Materials" : "Materyalleri Dönüştür", id, 6
			, eng() ? "Convert" : "Dönüştür"
			, "Cancel")
			
			dialogue_box.specialDesign = true
		}
		else if (global.itemCount[i, j] <= 5)
			show_messagebox(300, 300, eng() ? "You need at least 6 materials." : "En az 6 materyal gereklidir.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
	}
}

if (isQuestion(2)) {
	if (isButton(0)) {
		if (noAnim) {
			if (instance_exists(objTradeWindow) and !objTradeWindow.loot and !is_active(i, j) and isDeletable) {
				change_money(calculate_selling(cWorth), true)
				
				if (isCollectable)
					decrease_collectable_item(object_index, 1, upgrade)
				else
					delete_item(i, j)
		
				with (objTradeWindow)
					localbag_refresh()
			}
			else {
				if (!isDeletable)
					show_messagebox(300, 300, eng() ? "This item is permanent." : "Bu eşya kalıcıdır.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
				else if (!is_active(i, j))
					show_messagebox(300, 300, eng() ? "There is not trade window." : "Ticaret penceresi yok.", eng() ? "Not Selled" : "Satılamadı.", 2*sec)
				else
					show_messagebox(300, 300, eng() ? "It is already active." : "Zaten kullanılıyor.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
			}
		}
		else
			show_messagebox(300, 300, eng() ? "Stop moving for this process." : "Bu işlem için hareketini durdur.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
	}
}

if (isQuestion(3)) {
	if (isButton(0)) {
		if (noAnim and isDeletable and !is_active(i, j))
			delete_item(i, j)
		else {
			if (!isDeletable)
				show_messagebox(300, 300, eng() ? "This item is permanent." : "Bu eşya kalıcıdır.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
			else if (is_active(i, j))
				show_messagebox(300, 300, eng() ? "It is already active." : "Zaten kullanılıyor.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
			else
				show_messagebox(300, 300, eng() ? "Stop moving for this process." : "Bu işlem için hareketini durdur.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
		}
	}
}

if (isQuestion(4)) {
	if (isButton(0)) {
		if (object_index != objSw_000 and noAnim and isDeletable and !is_active(i, j)) {
			var beforeI = i
			var beforeJ = j
			var beforeObject = object_index
			var itemSpecialty = specialty
			var beforeIsUpgradable = is_item_upgradabletype(id)/* and upgrade < unique_number*/
			var isStandardOrClassic = upgrade >= unique_number
			var beforeUpgrade = upgrade
			var beforeLevel = itemLevel
			
			if (isCollectable)
				decrease_collectable_item(object_index, 1, upgrade)
			else
				delete_item(i, j)
			
			if (beforeIsUpgradable) {
				with (objMessageBox) {
					var txt = draw_text_colortags(x, y, title)
					if (txt == "New Item" or txt == "Yeni Eşya")
						close_window()
				}
				
				if (beforeUpgrade > 0) {
					var upgradeMaterial_upgrade = item_get_upgradematerial_type(beforeLevel, itemSpecialty)
					add_item(objUpgradeMaterial, upgradeMaterial_upgrade, -1, -1, beforeI, beforeJ)
					increase_collectable_item(objUpgradeMaterial, isStandardOrClassic ? 2 : (floor(beforeUpgrade)*2-1), upgradeMaterial_upgrade)
				}
			}
		}
		else {
			if (object_index == objSw_000)
				show_messagebox(300, 300, eng() ? "This item is the only exception,\nit cannot be dismantled." : "Bu eşya tek istisnadır, parçalanamaz.", eng() ? "Exceptional Error" : "İstisnai Hata", 2*sec)
			else if (!isDeletable)
				show_messagebox(300, 300, eng() ? "This item is permanent." : "Bu eşya kalıcıdır.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
			else if (is_active(i, j))
				show_messagebox(300, 300, eng() ? "It is already active." : "Zaten kullanılıyor.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
			else
				show_messagebox(300, 300, eng() ? "Stop moving for this process." : "Bu işlem için hareketini durdur.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
		}
	}
}

if (isQuestion(5)) {
	if (isButton(0)) {
		if (noAnim and isDeletable and !is_active(i, j)) {
			var isSelled = false
		
			if (sellingMode) {
				isSelled = true
				change_money(calculate_selling(cWorth)*count, true)
			}
			
			if (isSelled) {
				delete_item(i, j)
		
				with (objTradeWindow)
					localbag_refresh()
			}
			else {
				if (!is_active(i, j))
					show_messagebox(300, 300, eng() ? "There is not trade window." : "Ticaret penceresi yok.", eng() ? "Not Selled" : "Satılamadı.", 2*sec)
				else
					show_messagebox(300, 300, eng() ? "It is already active." : "Zaten kullanılıyor.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
			}
		}
		else {
			if (!isDeletable)
				show_messagebox(300, 300, eng() ? "This item is permanent." : "Bu eşya kalıcıdır.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
			else if (is_active(i, j))
				show_messagebox(300, 300, eng() ? "It is already active." : "Zaten kullanılıyor.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
			else
				show_messagebox(300, 300, eng() ? "Stop moving for this process." : "Bu işlem için hareketini durdur.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", 2*sec)
		}
	}
}

if (isQuestion(6)) {
	if (isButton(0)) {
		if (global.itemCount[i, j] > 5) {
			decrease_collectable_item(objUpgradeMaterial, 6, upgrade)
			add_item(objUpgradeMaterial, upgrade+1)
		}
		else if (global.itemCount[i, j] <= 5)
			show_messagebox(300, 300, eng() ? "You need at least 6 materials." : "En az 6 materyal gereklidir.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
	}
}