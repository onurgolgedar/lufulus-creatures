if (test_upperclick_window())
	exit

if (global.itemSelected == -1) {
    var itemClicked = -1
    
    if (mouseOnBox)
        if (item[mouseOnBox_i, mouseOnBox_j] != -1)
            itemClicked = item[mouseOnBox_i, mouseOnBox_j]
        
    if (itemClicked != -1) {
		with (objMessageBox)
			if (owner != -1 and instance_exists(owner) and object_get_parent(owner.object_index) == parItem and owner.from == window_items)
				close_window()

		var name_with_upgrade = itemClicked.name
		var isItemUpgradeble_type = is_item_upgradabletype(itemClicked)
		if (isItemUpgradeble_type) {
			var upgradeText = ""
			if (itemClicked.upgrade != unique_number and itemClicked.upgrade != unique_number+1)
				upgradeText = itemClicked.upgrade == round(itemClicked.upgrade) ? ("[c="+string(c_orange)+"] (+"+string(floor(itemClicked.upgrade))+")      [/c]") : "[c="+string(c_gray)+"] (F +"+string(floor(itemClicked.upgrade))+")      [/c]"
			else if (itemClicked.upgrade == unique_number)
				upgradeText = "[c="+string(c_fuchsia)+"] ("+(eng() ? "Classic" : "Klasik")+")      [/c]"
			else if (itemClicked.upgrade == unique_number+1)
				upgradeText = "[c="+string(c_gray)+"] ("+(eng() ? "Standard" : "Standart")+")      [/c]"
				
			name_with_upgrade += upgradeText
		}
			
		var nearestUpgrader = instance_nearest(objPlayer.x, objPlayer.y, objUpgrader_npc)
		var hasUpgradeButton = false
		if (nearestUpgrader != noone) {
			if (is_item_upgradable(itemClicked)) {
				if (point_distance(nearestUpgrader.x, nearestUpgrader.y, objPlayer.x, objPlayer.y) < 300 and
				!collision_line(nearestUpgrader.x, nearestUpgrader.y, objPlayer.x, objPlayer.y, parSolid, 1, 1)) {
					hasUpgradeButton = true
				}
			}
		}
		
		var lt_dividetext = eng() ? ("Dismantle to\n"+string(itemClicked.upgrade < unique_number ? (floor(itemClicked.upgrade)*2) : "3")+" material(s) of [c="+string(c_ltyellow)+"]"+get_upgradematerial_name(item_get_upgradematerial_type(itemClicked.itemLevel, itemClicked.specialty))+"[/c]")
		: (string(itemClicked.upgrade < unique_number ? (floor(itemClicked.upgrade)*2) : "3")+" parça\n[c="+string(c_ltyellow)+"]"+get_upgradematerial_name(item_get_upgradematerial_type(itemClicked.itemLevel, itemClicked.specialty))+"[/c] Materyaline Dönüştür")
		
		if (itemClicked.type == type_challengeItem) {
			with (itemClicked)
				event_perform(ev_other, ev_user0)
		}

		var sell_buttonActive = instance_exists(objTradeWindow) and !objTradeWindow.loot

		var dialogue_box = show_dialoguebox(device_mouse_x_to_gui(0)-3, device_mouse_y_to_gui(0)-3 /*x+box_x[itemClicked.i, itemClicked.j]-boxEdge/3, y+box_y[itemClicked.i, itemClicked.j]-boxEdge/3*/
		, itemClicked.type == type_challengeItem ? itemClicked.tbT_withoutMoney : ("[c="+string(c_white)+"]"+name_with_upgrade+"[/c]")
		, "", itemClicked.id, 1
		, is_active(itemClicked.i, itemClicked.j) ? (eng() ? "Wear Off" : "Çıkar") : ((itemClicked.type == type_clothes or itemClicked.type == type_medallion or itemClicked.type == type_mweapon or itemClicked.type == type_necklace or itemClicked.type == type_challengeItem or itemClicked.type == type_pet or itemClicked.type == type_potion or itemClicked.type == type_sweapon or itemClicked.type == type_call) ? (itemClicked.type == type_challengeItem ? (eng() ? "Accept" : "Kabul Et") : (itemClicked.type == type_call ? (eng() ? "Call" : "Çağır") : (eng() ? "Use" : "Kullan"))) : "")
		, string_return((eng() ? "Sell: " : "Sat: ")+string(itemClicked.cWorth), sell_buttonActive)
		, (is_item_upgradabletype(itemClicked) and itemClicked.upgrade != 0) ? lt_dividetext : (sell_buttonActive ? "" : (eng() ? "Delete" : "Sil"))
		, string_return((eng() ? "Delete All" : "Sil (Hepsi)"), itemClicked.isCollectable and itemClicked.count > 1 and !sell_buttonActive)
		, string_return((eng() ? "Sell All: ": "Sat (Hepsi): ")+string(itemClicked.cWorth*itemClicked.count), instance_exists(objTradeWindow) and !objTradeWindow.loot and itemClicked.isCollectable and itemClicked.count > 1)
		, string_return((eng() ? "Upgrade" : "Geliştir"), hasUpgradeButton)
		, string_return((eng() ? "Add to the Bank" : "Bankaya Ekle"), instance_exists(objBankWindow))
		, "" /*string_return((eng() ? "Add All to the Bank" : "Bankaya Hepsini Ekle"), instance_exists(objBankWindow) and itemClicked.isCollectable and itemClicked.count > 1)*/
		, string_return((eng() ? "Delete" : "Sil"), (itemClicked.object_index == objSw_000) and is_item_upgradabletype(itemClicked))
		, string_return((eng() ? ("Convert\nExtract 6 of these to a material of [c="+string(c_ltyellow)+"]"+get_upgradematerial_name(itemClicked.upgrade+1)+"[/c]") : ("Dönüştür\n6 adedini bir [c="+string(c_ltyellow)+"]"+get_upgradematerial_name(itemClicked.upgrade+1)+"[/c] materyaline dönüştür.")), itemClicked.object_index == objUpgradeMaterial and itemClicked.upgrade < 4)
		, "Cancel")
		
		dialogue_box.specialDesign = true
		
		if (!IS_MOBILE)
			with (dialogue_box) {
				event_perform(ev_alarm, 0)
				alarm[0] = -1
				var text = eng() ? ("Compare Items\nWhile inspecting an item, you can see your\nactive item by holding [c="+string(c_aqua)+"]<Shift>[/c] to compare both.\n\nMoreover, holding [c="+string(c_aqua)+"]<Space>[/c] shows the item's\nequivalent version with your active item.") : ("Eşyaları Kıyaslamak\n[c="+string(c_aqua)+"]<Shift>[/c] tuşunu kullanarak bir eşyayı incelerken ayrıca\nkendi eşyanızı da görebilirsiniz.\nAyrıca [c="+string(c_aqua)+"]<Space>[/c] tuşuna basılı tutarak incelenen eşyanın\nkullanmış olduğunuz eşyaya gelişim olarak denk halini\ngörebilirsiniz.")
				var title = eng() ? "" : ""
				var tutorialBox = tutorial_box_owned(title, text, id, width-7, 17, 20)
				if (tutorialBox != pointer_null) {
					tutorialBox.offset_x += 259+!eng()*15
					tutorialBox.offset_y -= 42
					tutorialBox.image_xscale = 0.6
					tutorialBox.image_yscale = 0.6
				}
			}
    }
        
    /*with (parItem)
		event_perform(ev_other, ev_user0)*/
}