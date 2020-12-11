alarm[2] = -1

targetAngle = point_direction(x, y, objPlayer.x, objPlayer.y)

while (ds_list_size(windows) != 0) {
	with (ds_list_find_value(windows, 0))
		close_window()
	ds_list_delete(windows, 0)
}

if (global.itemSelected.from == window_items) {
	itemI = global.itemSelected.i
	itemJ = global.itemSelected.j
}
else if (global.itemSelected.from == window_actives) {
	itemI = get_active_item_ij(global.itemSelected.type, 0)
	itemJ = get_active_item_ij(global.itemSelected.type, 1)
}

var skip = false
var upgradedItem = instance_create(-50, -50, global.itemSelected.object_index)
upgradedItem.from = "Upgrader"
upgradedItem.i = itemI
upgradedItem.j = itemJ
upgradedItem.upgrade = global.itemSelected.upgrade
var upgradedItem_isQuest = global.itemSelected.isForQuest != false

// ? DUPLICATION Code: 18
materialsCount_bag = 0
for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
	for (var j = 0; j < global.bagBoxCount_vertical; j++) {
		if (global.item[i, j] == objUpgradeMaterial and global.itemUpgrade[i, j] == item_get_upgradematerial_type(upgradedItem.itemLevel, upgradedItem.specialty))
			materialsCount_bag += global.itemCount[i, j]
	}
}
	
materialsCount_bank = 0
for (var i = 0; i < global.bagBoxCount_horizontal*global.bagMaxPage; i++) {
	for (var j = 0; j < global.bagBoxCount_vertical; j++) {
		if (global.item_bank[i, j] == objUpgradeMaterial and global.itemUpgrade_bank[i, j] == item_get_upgradematerial_type(upgradedItem.itemLevel, upgradedItem.specialty))
			materialsCount_bank += global.itemCount_bank[i, j]
	}
}

if (is_item_upgradabletype(upgradedItem)) {
	if (!is_item_upgradable(upgradedItem)) {
		if (upgradedItem.upgrade != 11) {
			var ltext
			
			ltext[0] = eng() ?
			("This item is [c="+string(c_gray)+"]FIXED (F)[/c] or [c="+string(c_gray)+"]STANDARD[/c].\nAn item's upgrade level needs to be [c="+string(c_ltorange)+"]ORANGE[/c]\nfor this process.")
			: ("Bu eşya [c="+string(c_gray)+"]SABİT (F)[/c] veya [c="+string(c_gray)+"]STANDART[/c].\nSadece [c="+string(c_ltorange)+"]TURUNCU[/c] renkte seviye gelişimi olan eşyalar\ngeliştirilebilir.")
			
			ltext[1] = eng() ? "Not Upgradable" : "Geliştirilemez"
			
			show_messagebox(500, 80, ltext[0], ltext[1], 6*sec)
		}
		else 
			show_messagebox(500, 80, eng() ? "An item can be maximum [c="+string(c_ltorange)+"](+11)[/c]." : "Bir eşya en fazla [c="+string(c_ltorange)+"](+11)[/c] olabilir.", eng() ? "Not Upgradable" : "Geliştirilemez", 6*sec)
		
		skip = true
	} else if (materialsCount_bag+materialsCount_bank <= 0 and global.upgradeTickets == 0) {
		var messageBox = show_messagebox(500, 80, eng() ? "You need at least one\n[c="+string(c_ltyellow)+"]"+get_upgradematerial_name(item_get_upgradematerial_type(upgradedItem.itemLevel, upgradedItem.specialty))+"[/c] Material." : "En az bir adet [c="+string(c_ltyellow)+"]"+get_upgradematerial_name(item_get_upgradematerial_type(upgradedItem.itemLevel, upgradedItem.specialty))+"[/c]\nmateryaline ihtiyacın var.", eng() ? "You need materials." : "Materyal yetersiz.", 6*sec)
		with (messageBox)
			tutorial_box_owned(""/*eng() ? "Materials" : "Materyaller"*/, eng() ? "Materials\nTo produce materials, you can dismantle items\nor you can loot them from anywhere." : "Materyaller\nMateryal elde etmek için eşyaları\nparçalayabilirsin. Ayrıca ganimet olarak\nda bulunabilirler.", id, 0, -15, 3)
		
		skip = true
	}
}
else
	skip = true
	
upgradedItem.upgrade = global.itemSelected.upgrade+1

if (!skip) {
	upgradedItem.extension[0] = global.itemSelected.extension[0]
	upgradedItem.extension[1] = global.itemSelected.extension[1]
	upgradedItem.owner = id
	with (upgradedItem) {
		item_self_calculate()
		event_perform(ev_other, ev_user0)
	}
	
	itemLevel = upgradedItem.itemLevel
	itemSpecialty = upgradedItem.specialty
	itemUpgradeCost = ceil(upgradedItem.cWorth/max(0.9, (5.2-global.itemSelected.upgrade*4.3/11))*(100+global.itemSelected.upgrade*8.5)/100/2)+5
	itemUpgradeChance =
	(global.itemSelected.upgrade == 0)*60+
	(global.itemSelected.upgrade == 1)*56+
	(global.itemSelected.upgrade == 2)*52+
	(global.itemSelected.upgrade == 3)*48+
	(global.itemSelected.upgrade == 4)*40+
	(global.itemSelected.upgrade == 5)*36+
	(global.itemSelected.upgrade == 6)*30+
	(global.itemSelected.upgrade == 7)*26+
	(global.itemSelected.upgrade == 8)*20+
	(global.itemSelected.upgrade == 9)*17+
	(global.itemSelected.upgrade == 10)*10
	
	if (upgradedItem.object_index == objSw_001Q and quest_exists(objQuest_blacksmith2)) {
		itemUpgradeCost = 0
		if (upgradedItem.upgrade < 3)
			itemUpgradeChance = 100
		else
			itemUpgradeChance = 0
	}
	
	var materialName = get_upgradematerial_name(item_get_upgradematerial_type(upgradedItem.itemLevel, upgradedItem.specialty))
	
	var changedItemInfo = upgradedItem.tbT
	
	var worthIndex
	if (eng())
		worthIndex = string_pos("Seg", changedItemInfo)
	else
		worthIndex = string_pos("Kad", changedItemInfo)
		
	changedItemInfo = string_copy(changedItemInfo, 0, worthIndex-1)+"[/c]"
	
	var window
	if (eng()) {
		window = show_dialoguebox(500, 80, changedItemInfo+"――――――――――――――――――――――――――"
		+"\n[c="+string(c_white)+"]YOU HAVE [c="+string(c_customgreen_compare)+"]"+string(materialsCount_bag+materialsCount_bank)+" "+materialName+" MATERIAL(s).[/c]\n[c="+string(c_nicered)+"]1 "+materialName+" MATERIAL[c="+string(c_customred_compare)+"] WILL BE USED.\n\n[c="+string(c_aqua)+"]Chance of success: "+string(itemUpgradeChance)+"%[/c]",
		"[c="+string(c_customgreen_compare)+"]New Item[/c]"/*IMPORTANT NAME*/, id, 2
		, string_return("Try for free", materialsCount_bag+materialsCount_bank > 0)
		, string_return("Try for [c="+string(c_gold)+"]"+string(itemUpgradeCost)+" gold[/c]\n[c="+string(c_aqua)+"]1.5x Chance ("+string(ceil(itemUpgradeChance*1.5))+"%)[/c]", materialsCount_bag+materialsCount_bank > 0 and itemUpgradeChance != 100)
		, string_return("Try with LV\n[c="+string(c_aqua)+"]1.5x Chance ("+string(ceil(itemUpgradeChance*1.5))+"%)[/c]\n\nSaves the item's existance\nand upgrade level.", materialsCount_bag+materialsCount_bank > 0 and !upgradedItem_isQuest and itemUpgradeChance != 100)
		, string_return("Try with ticket\nYou have: "+string(global.upgradeTickets), global.upgradeTickets > 0 and itemUpgradeChance != 100)
		, string_return("Try with "+string((upgradedItem.upgrade-1)*2)+" more material(s)\n"+"Material Type: [c="+string(c_ltyellow)+"]"+get_upgradematerial_name(item_get_upgradematerial_type(itemLevel, upgradedItem.specialty))+"[/c]\n[c="+string(c_aqua)+"]100% success[/c]\n\nYou have: "+string(materialsCount_bank+materialsCount_bag)+" material(s)", upgradedItem.upgrade != 1 and itemUpgradeChance != 100)
		, string_return("Try for [c="+string(c_gold)+"]"+string(50+itemUpgradeCost*8)+" gold[/c]\n[c="+string(c_aqua)+"]100% success[/c]", materialsCount_bag+materialsCount_bank > 0 and itemUpgradeChance != 100), "Cancel")
	} else {
		window = show_dialoguebox(500, 80, changedItemInfo+"――――――――――――――――――――――――――"
		+"\n[c="+string(c_customgreen_compare)+"]"+string(materialsCount_bag+materialsCount_bank)+" "+materialName+" MATERYALİN VAR.[/c]\n[c="+string(c_nicered)+"]1 "+materialName+" MATERYALİ[c="+string(c_customred_compare)+"] KULLANILACAKTIR.\n\n[c="+string(c_aqua)+"]Başarı şansı: "+string(itemUpgradeChance)+"%[/c]",
		"[c="+string(c_customgreen_compare)+"]Yeni Eşya[/c]"/*IMPORTANT NAME*/, id, 2
		, string_return("Ücretsiz dene", materialsCount_bag+materialsCount_bank > 0)
		, string_return("[c="+string(c_gold)+"]"+string(itemUpgradeCost)+" altınla dene[/c]\n[c="+string(c_aqua)+"]1.5 Kat Şans (%"+string(ceil(itemUpgradeChance*1.5))+")[/c]", materialsCount_bag+materialsCount_bank > 0 and itemUpgradeChance != 100)
		, string_return("LV ile dene\n[c="+string(c_aqua)+"]1.5 Kat Şans (%"+string(ceil(itemUpgradeChance*1.5))+")[/c] sağlar.\n\nEşyanın yok olması imkansızlaşır\nve gelişim seviyesi korunur.", materialsCount_bag+materialsCount_bank > 0 and !upgradedItem_isQuest and itemUpgradeChance != 100)
		, string_return("Bilet ile dene\nBiletlerin: "+string(global.upgradeTickets), global.upgradeTickets > 0 and itemUpgradeChance != 100)
		, string_return(string((upgradedItem.upgrade-1)*2)+" ek materyalle dene.\n"+"Materyal Türü: [c="+string(c_ltyellow)+"]"+get_upgradematerial_name(item_get_upgradematerial_type(itemLevel, upgradedItem.specialty))+"[/c]\n[c="+string(c_aqua)+"]%100 başarı[/c]\n\nMateryallerin: "+string(materialsCount_bank+materialsCount_bag), upgradedItem.upgrade != 1 and itemUpgradeChance != 100)
		, string_return("[c="+string(c_gold)+"]"+string(50+itemUpgradeCost*8)+" altınla dene[/c]\n[c="+string(c_aqua)+"]%100 başarı[/c]", materialsCount_bag+materialsCount_bank > 0 and itemUpgradeChance != 100), "Cancel")
	}
	window.buttonWidth += 40
	
	ds_list_add(windows, window)
	
	window.blackBackground = true
}

instance_destroy(upgradedItem)