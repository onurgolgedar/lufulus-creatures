draw_set_font(fontItemInfo)

var beforeAlpha = draw_get_alpha()
draw_set_alpha(0)

if (cWorth == -1)
	item_self_calculate()

var ltext_damage, ltext_attackspeed, ltext_criticalchance, ltext_magicaldamage, ltext_magicaldamage
, ltext_mana, ltext_armor, ltext_health, ltext_segment, ltext_hitpers, ltext_equipped, ltext_slow, ltext_manual, ltext_str
, ltext_dex, ltext_vit, ltext_mp, ltext_sta, ltext_criticaldamage//, ltext_dps

if (eng()) {
	ltext_damage = "Damage: "
	//ltext_dps = "[c="+string(c_brown)+"]DPS: [/c]"
	ltext_attackspeed = "Attack Speed: "
	ltext_criticalchance = "Critical Chance: "
	ltext_magicaldamage = "Magical Damage: "
	ltext_mana = "Mana: "
	ltext_armor = "Armor: "
	ltext_health = "HP: "
	ltext_segment = "Segment: "
	ltext_hitpers = " hit/s"
	ltext_equipped = "[EQUIPPED]"
	ltext_slow = "Slow: "
	ltext_manual = "Manual"
	ltext_str = "Strength: "
	ltext_dex = "Dexterity: "
	ltext_vit = "Vitality: "
	ltext_mp = "Magic Power: "
	ltext_sta = "Stamina: "
	ltext_criticaldamage = "Critical Damage: "
} else {
	ltext_damage = "Hasar: "
	//ltext_dps = "[c="+string(c_brown)+"]SBH: [/c]"
	ltext_attackspeed = "Saldırı Hızı: "
	ltext_criticalchance = "Kritik İhtimali: "
	ltext_magicaldamage = "Büyü Hasarı: "
	ltext_mana = "Mana: "
	ltext_armor = "Zırh: "
	ltext_health = "Can: "
	ltext_segment = "Kademe: "
	ltext_hitpers = " vuruş/s"
	ltext_equipped = "[KUŞANILMIŞ]"
	ltext_slow = "Yavaşlatma: "
	ltext_manual = "Manuel"
	ltext_str = "STR: "
	ltext_dex = "DEX: "
	ltext_vit = "VIT: "
	ltext_mp = "MP: "
	ltext_sta = "STA: "
	ltext_criticaldamage = "Kritik Hasar: "
}


var color1 = c_white

var moneyText
if (eng())
	moneyText = (owner.object_index == objTradeWindow and !owner.loot and !imaginary) ? ("\n[c="+string(c_gold)+"]Price: "+string(cWorth)+" gold") : (!imaginary ? ("\n[c="+string(c_gold)+"]Sell: "+string(cWorth)+" gold[/c]") : "")
else
	moneyText = (owner.object_index == objTradeWindow and !owner.loot and !imaginary) ? ("\n[c="+string(c_gold)+"]Fiyat: "+string(cWorth)+" altın") : (!imaginary ? ("\n[c="+string(c_gold)+"]Satış: "+string(cWorth)+" altın[/c]") : "")

var isUnique = specialty == ITEM_UNIQUE_SPECIALTY
var uniqueText = isUnique ? ("[c="+string(c_yellow)+"][★][/c]") : ""
var upgradeText
if (upgrade != unique_number and upgrade != unique_number+1)
	upgradeText = upgrade == round(upgrade) ? ("[c="+string(c_ltorange)+"] (+"+string(floor(upgrade))+")[/c]") : "[c="+string(c_gray)+"] (F +"+string(floor(upgrade))+")[/c]"
else if (upgrade == unique_number)
	upgradeText = "[c="+string(c_fuchsia)+"] ("+(eng() ? "Classic" : "Klasik")+")      [/c]"
else if (upgrade == unique_number+1)
	upgradeText = "[c="+string(c_gray)+"] ("+(eng() ? "Standard" : "Standart")+")      [/c]"
upgradeText = " "+uniqueText+upgradeText
	
var isActive = is_active(i, j) and from == window_items
var activeItem = -1
var upgraderForm = false
if (get_active_item_ij(type, 0) != -1 or from == "Upgrader") {
	if (from == window_items) {
		activeItem = owner.item[get_active_item_ij(type, 0), get_active_item_ij(type, 1)]
	}
	else if (from == window_trade or from == "Loot") {
		activeItem = owner.im_item[get_active_item_ij(type, 0), get_active_item_ij(type, 1)]
	}
	else if (from == window_bank) {
		activeItem = owner.im_item[get_active_item_ij(type, 0), get_active_item_ij(type, 1)]
	}
	else if (from == "Upgrader") {
		activeItem = objItemBag.item[i, j]
		upgraderForm = true
	}
}

if (type == type_mweapon or type == type_sweapon)
{
    if (weaponType != wtype_shield)
    {
		#region Extension Text
		var ext0 = ""
		var ext1 = ""
		var extCount = 0
		
		if (extension[0] != -1) {
			var ext0_upgrade = extension_get_neededUpgrade(extension[0])
			var ext0_active = upgrade >= ext0_upgrade
			
			ext0 += "\n"
			ext0 += string_return("[c="+string(c_nicered)+"]if [/c]", !ext0_active and eng())
			ext0 += string_return("[c="+string(c_green)+"][✓] [/c]", ext0_active)
			ext0 += string_return("[c="+string(c_ltorange)+"](+"+string(ext0_upgrade)+")[/c]", !ext0_active)
			ext0 += string_return("[c="+string(c_nicered)+"] ise[/c]", !ext0_active and !eng())
			ext0 += string_return(" ", !ext0_active)
			ext0 += "[c="+string(ext0_active ? c_green : c_ltgray)+"]"+extension_text(extension[0])+"[/c]"
			
			extCount++
		}
		
		if (extension[1] != -1) {
			var ext1_upgrade = extension_get_neededUpgrade(extension[1])
			var ext1_active = upgrade >= ext1_upgrade

			ext1 += "\n"
			ext1 += string_return("[c="+string(c_nicered)+"]if [/c]", !ext1_active and eng())
			ext1 += string_return("[c="+string(c_green)+"][✓] [/c]", ext1_active)
			ext1 += string_return("[c="+string(c_ltorange)+"](+"+string(ext1_upgrade)+")[/c]", !ext1_active)
			ext1 += string_return("[c="+string(c_nicered)+"] ise[/c]", !ext1_active and !eng())
			ext1 += string_return(" ", !ext1_active)
			ext1 += "[c="+string(ext1_active ? c_green : c_ltgray)+"]"+extension_text(extension[1])+"[/c]"
			
			extCount++
		}
		
		if (extCount > 0) {
			//ext0 = "\nAddition List:"+ext0
			
			if (extCount == 1) {
				if (extension[0] != -1)
					ext0 += "\n"
			}
			else if (extCount == 2) {
				ext1 += "\n"
			}
		}
		#endregion
    
		#region Differences
		var diff_damage_txt = ""
		//var diff_dps_txt = ""
		var diff_atspeed_txt = ""
		var diff_critical_txt = ""
		var diff_magical_txt = ""
		var diff_mana_txt = ""
		if (!isActive and activeItem != -1 and (weaponType == activeItem.weaponType or ((weaponType == wtype_crossbow)+(weaponType == wtype_bow)+(activeItem.weaponType == wtype_bow)+(activeItem.weaponType == wtype_crossbow) == 2))) {
			diff_damage_txt = generate_difference_text(cDamage, activeItem.cDamage, false, upgraderForm)
			//diff_dps_txt = generate_difference_text(cDamage*cAttackSpeed, activeItem.cDamage*activeItem.cAttackSpeed, false, upgraderForm)
			
			diff_atspeed_txt = generate_difference_text(cAttackSpeed, activeItem.cAttackSpeed, false, upgraderForm)
			if (abs(cAttackSpeed-activeItem.cAttackSpeed) > 5)
				diff_atspeed_txt = ""
			
			diff_critical_txt = generate_difference_text(cCriticalChance, activeItem.cCriticalChance, false, upgraderForm)
			diff_magical_txt = generate_difference_text(cMagicalDamage, activeItem.cMagicalDamage, false, upgraderForm)
			diff_mana_txt = generate_difference_text(cMana, activeItem.cMana, false, upgraderForm)
		}
		#endregion
	
        tbT = "[c="+string(color1)+"]"+string(name)+upgradeText+"[/c]\n\n"+
        ltext_damage+string(cDamage)+diff_damage_txt+"\n"+
		//ltext_dps+string(cDamage*cAttackSpeed)+diff_dps_txt+"\n"+
        string_return("[c="+string(c_gray)+"]", cAttackSpeed == unique_number)+ltext_attackspeed+(cAttackSpeed != unique_number ? string(cAttackSpeed) : ltext_manual)/*+" hit/s"*/+diff_atspeed_txt+"\n"+"[/c]"+
        string_return("[c="+string(c_gray)+"]", cCriticalChance == 0)+ltext_criticalchance+string(cCriticalChance)+"%"+diff_critical_txt+"\n"+"[/c]"+
        string_return("[c="+string(c_gray)+"]", cMagicalDamage == 0)+ltext_magicaldamage+string(cMagicalDamage)+diff_magical_txt+"\n"+"[/c]"+
        string_return("[c="+string(c_gray)+"]", cMana == 0)+ltext_mana+string(cMana)+diff_mana_txt+"\n"+"[/c]"+
		ext0+
        ext1+
		"\n[c="+string(c_ltyellow)+"]"+ltext_segment+get_upgradematerial_name(item_get_upgradematerial_type(itemLevel, specialty))+" ("+string(itemLevel)+(eng() ? " lv" : ". seviye")+")[/c]"+
        moneyText+
		((is_active(i, j) and (owner.object_index == objItemBag or from == window_imtrade)) ? ("\n[c="+string(c_aqua)+"]"+ltext_equipped+"[/c]") : (((type == type_mweapon and global.weaponI != -1 or type == type_sweapon and global.sWeaponI != -1) and get_active_item_ij(type, false) != -1 and owner.object_index != objUpgrader_npc) ? (""/*"\n[c="+string(c_aqua)+"]<Shift>: Compare\n<Space>: Equivalent[/c]"*/) : ""))
        
		if (owner.object_index == objBankWindow)
			tbT += eng() ? ("\n\n[c="+string(c_aqua)+"]Rent Duration: "+string(get_day() - rentTime)+" day(s)\nDaily Return: "+string(floor(cWorth*BANK_RENT_RATIO))+" gold(s) ("+string(round(100*BANK_RENT_RATIO))+"%)[/c]") : ("\n\n[c="+string(c_aqua)+"]Kiradaki Süre: "+string(get_day() - rentTime)+" gün\nGünlük Getirisi: "+string(floor(cWorth*BANK_RENT_RATIO))+" altın (%"+string(round(100*BANK_RENT_RATIO))+")[/c]")
		
		var t_pure = draw_text_colortags(0, 0, tbT)
		
        tbW = string_width(t_pure)
        tbH = string_height(t_pure)
    }
    else
    {
		#region Extension Text
		var ext0 = ""
		var ext1 = ""
		var extCount = 0
		
		if (extension[0] != -1) {
			var ext0_upgrade = extension_get_neededUpgrade(extension[0])
			var ext0_active = upgrade >= ext0_upgrade
			
			ext0 += "\n"
			ext0 += string_return("[c="+string(c_nicered)+"]if [/c]", !ext0_active and eng())
			ext0 += string_return("[c="+string(c_green)+"]"+string_return("[✓] ", object_index != objTorch)+"[/c]", ext0_active)
			ext0 += string_return("[c="+string(c_ltorange)+"](+"+string(ext0_upgrade)+")[/c]", !ext0_active)
			ext0 += string_return("[c="+string(c_nicered)+"] ise[/c]", !ext0_active and !eng())
			ext0 += string_return(" ", !ext0_active)
			ext0 += "[c="+string(ext0_active ? c_green : c_ltgray)+"]"+extension_text(extension[0])+"[/c]"
			
			extCount++
		}
		
		if (extension[1] != -1) {
			var ext1_upgrade = extension_get_neededUpgrade(extension[1])
			var ext1_active = upgrade >= ext1_upgrade

			ext1 += "\n"
			ext1 += string_return("[c="+string(c_nicered)+"]if [/c]", !ext1_active and eng())
			ext1 += string_return("[c="+string(c_green)+"]"+string_return("[✓] ", object_index != objTorch)+"[/c]", ext1_active)
			ext1 += string_return("[c="+string(c_ltorange)+"](+"+string(ext1_upgrade)+")[/c]", !ext1_active)
			ext1 += string_return("[c="+string(c_nicered)+"] ise[/c]", !ext1_active and !eng())
			ext1 += string_return(" ", !ext1_active)
			ext1 += "[c="+string(ext1_active ? c_green : c_ltgray)+"]"+extension_text(extension[1])+"[/c]"
			
			extCount++
		}
		
		if (extCount > 0) {
			//ext0 = "\nAddition List:"+ext0
			
			if (extCount == 1) {
				if (extension[0] != -1)
					ext0 += "\n"
			}
			else if (extCount == 2) {
				ext1 += "\n"
			}
		}
		#endregion
    
		#region Differences
		var diff_armor_txt = ""
		var diff_slow_txt = ""
		var diff_hp_txt = ""
		var diff_mana_txt = ""
		if (!isActive and activeItem != -1 and (weaponType == activeItem.weaponType or ((weaponType == wtype_crossbow)+(weaponType == wtype_bow)+(activeItem.weaponType == wtype_bow)+(activeItem.weaponType == wtype_crossbow) == 2))) {
			diff_armor_txt = generate_difference_text(cArmor, activeItem.cArmor, false, upgraderForm)
			diff_slow_txt = generate_difference_text(slow, activeItem.slow, true, upgraderForm)
			diff_hp_txt = generate_difference_text(cHp, activeItem.cHp, false, upgraderForm)
			diff_mana_txt = generate_difference_text(cMana, activeItem.cMana, false, upgraderForm)
		}
		#endregion
	
		if (object_index != objTorch) {
	        tbT = "[c="+string(color1)+"]"+name+upgradeText+"[/c]\n\n"+
	        string_return("[c="+string(c_gray)+"]", cArmor == 0)+ltext_armor+string(cArmor)+"%"+diff_armor_txt+"\n[/c]"+
			((slow == 0) ? ("[c="+string(c_gray)+"]"+ltext_slow+"0%") : ("[c="+string(c_negativered)+"]"+ltext_slow+string(slow)+"%"))+diff_slow_txt+"\n[/c]"+
			+"[c="+string(c_negativered)+"]"+ltext_criticaldamage+"-25%[/c]\n"+
	        string_return("[c="+string(c_gray)+"]", cHp == 0)+ltext_health+string(cHp)+diff_hp_txt+"\n[/c]"+
	        string_return("[c="+string(c_gray)+"]", cMana == 0)+ltext_mana+string(cMana)+diff_mana_txt+"\n[/c]"+
	        ext0+
	        ext1+
			"\n[c="+string(c_ltyellow)+"]"+ltext_segment+get_upgradematerial_name(item_get_upgradematerial_type(itemLevel, specialty))+" ("+string(itemLevel)+(eng() ? " lv" : ". seviye")+")[/c]"+
	        moneyText+
	        ((is_active(i, j) and (owner.object_index == objItemBag or from == window_imtrade)) ? ("\n[c="+string(c_aqua)+"]"+ltext_equipped+"[/c]") : ((global.weaponI != -1 and get_active_item_ij(type, false) != -1 and owner.object_index != objUpgrader_npc) ? (""/*"\n[c="+string(c_aqua)+"]<Shift>: Compare\n<Space>: Equivalent[/c]"*/) : ""))
		}
		else {
	        tbT = "[c="+string(color1)+"]"+name+"[/c]"+"\n"+
	        ext0+
	        ext1+
	        moneyText+
	        ((is_active(i, j) and (owner.object_index == objItemBag or imaginary)) ? ("\n[c="+string(c_aqua)+"]"+ltext_equipped+"[/c]") : ((global.weaponI != -1 and get_active_item_ij(type, false) != -1 and owner.object_index != objUpgrader_npc) ? (""/*"\n[c="+string(c_aqua)+"]<Shift>: Compare\n<Space>: Equivalent[/c]"*/) : ""))
		}
		
		if (owner.object_index == objBankWindow)
			tbT += eng() ? ("\n\n[c="+string(c_aqua)+"]Rent Duration: "+string(get_day() - rentTime)+" day(s)\nDaily Return: "+string(floor(cWorth*BANK_RENT_RATIO))+" gold(s) ("+string(round(100*BANK_RENT_RATIO))+"%)[/c]") : ("\n\n[c="+string(c_aqua)+"]Kiradaki Süre: "+string(get_day() - rentTime)+" gün\nGünlük Getirisi: "+string(floor(cWorth*BANK_RENT_RATIO))+" altın (%"+string(round(100*BANK_RENT_RATIO))+")[/c]")
		
		var t_pure = draw_text_colortags(0, 0, tbT)
		
        tbW = string_width(t_pure)
        tbH = string_height(t_pure)
    }
}
else if (type == type_clothes)
{
	#region Extension Text
	var ext0 = ""
	var ext1 = ""
	var extCount = 0
		
	if (extension[0] != -1) {
		var ext0_upgrade = extension_get_neededUpgrade(extension[0])
		var ext0_active = upgrade >= ext0_upgrade
			
		ext0 += "\n"
		ext0 += string_return("[c="+string(c_nicered)+"]if [/c]", !ext0_active and eng())
		ext0 += string_return("[c="+string(c_green)+"][✓] [/c]", ext0_active)
		ext0 += string_return("[c="+string(c_ltorange)+"](+"+string(ext0_upgrade)+")[/c]", !ext0_active)
		ext0 += string_return("[c="+string(c_nicered)+"] ise[/c]", !ext0_active and !eng())
		ext0 += string_return(" ", !ext0_active)
		ext0 += "[c="+string(ext0_active ? c_green : c_ltgray)+"]"+extension_text(extension[0])+"[/c]"
			
		extCount++
	}
		
	if (extension[1] != -1) {
		var ext1_upgrade = extension_get_neededUpgrade(extension[1])
		var ext1_active = upgrade >= ext1_upgrade

		ext1 += "\n"
		ext1 += string_return("[c="+string(c_nicered)+"]if [/c]", !ext1_active and eng())
		ext1 += string_return("[c="+string(c_green)+"][✓] [/c]", ext1_active)
		ext1 += string_return("[c="+string(c_ltorange)+"](+"+string(ext1_upgrade)+")[/c]", !ext1_active)
		ext1 += string_return("[c="+string(c_nicered)+"] ise[/c]", !ext1_active and !eng())
		ext1 += string_return(" ", !ext1_active)
		ext1 += "[c="+string(ext1_active ? c_green : c_ltgray)+"]"+extension_text(extension[1])+"[/c]"
			
		extCount++
	}
		
	if (extCount > 0) {
		//ext0 = "\nAddition List:"+ext0
			
		if (extCount == 1) {
			if (extension[0] != -1)
				ext0 += "\n"
		}
		else if (extCount == 2) {
			ext1 += "\n"
		}
	}
	#endregion
	
	#region Differences
	var diff_armor_txt = ""
	var diff_slow_txt = ""
	var diff_hp_txt = ""
	var diff_mana_txt = ""
	if (!isActive and activeItem != -1) {
		diff_armor_txt = generate_difference_text(cArmor, activeItem.cArmor, false, upgraderForm)
		diff_slow_txt = generate_difference_text(slow, activeItem.slow, true, upgraderForm)
		diff_hp_txt = generate_difference_text(cHp, activeItem.cHp, false, upgraderForm)
		diff_mana_txt = generate_difference_text(cMana, activeItem.cMana, false, upgraderForm)
	}
	#endregion
	
    tbT = "[c="+string(color1)+"]"+name+upgradeText+"[/c]\n\n"+
    string_return("[c="+string(c_gray)+"]", cArmor == 0)+ltext_armor+string(cArmor)+"%"+diff_armor_txt+"\n"+"[/c]"+
	((slow == 0) ? ("[c="+string(c_gray)+"]"+ltext_slow+"0%") : ("[c="+string(c_negativered)+"]"+ltext_slow+string(slow)+"%"))+diff_slow_txt+"\n[/c]"+
    string_return("[c="+string(c_gray)+"]", cHp == 0)+ltext_health+string(cHp)+diff_hp_txt+"\n"+"[/c]"+
    string_return("[c="+string(c_gray)+"]", cMana == 0)+ltext_mana+string(cMana)+diff_mana_txt+"\n"+"[/c]"+
	ext0+
    ext1+
	"\n[c="+string(c_ltyellow)+"]"+ltext_segment+get_upgradematerial_name(item_get_upgradematerial_type(itemLevel, specialty))+" ("+string(itemLevel)+(eng() ? " lv" : ". seviye")+")[/c]"+
    moneyText+
    ((is_active(i, j) and (owner.object_index == objItemBag or from == window_imtrade)) ? ("\n[c="+string(c_aqua)+"]"+ltext_equipped+"[/c]") : ((global.clothesI != -1 and get_active_item_ij(type, false) != -1 and owner.object_index != objUpgrader_npc) ? (""/*"\n[c="+string(c_aqua)+"]<Shift>: Compare\n<Space>: Equivalent[/c]"*/) : ""))
    
		if (owner.object_index == objBankWindow)
		tbT += eng() ? ("\n\n[c="+string(c_aqua)+"]Rent Duration: "+string(get_day() - rentTime)+" day(s)\nDaily Return: "+string(floor(cWorth*BANK_RENT_RATIO))+" gold(s) ("+string(round(100*BANK_RENT_RATIO))+"%)[/c]") : ("\n\n[c="+string(c_aqua)+"]Kiradaki Süre: "+string(get_day() - rentTime)+" gün\nGünlük Getirisi: "+string(floor(cWorth*BANK_RENT_RATIO))+" altın (%"+string(round(100*BANK_RENT_RATIO))+")[/c]")
	
	var t_pure = draw_text_colortags(0, 0, tbT)
	
    tbW = string_width(t_pure)
    tbH = string_height(t_pure)
}
else if (type == type_necklace)
{
	#region Extension Text
	var ext0 = ""
	var ext1 = ""
	var extCount = 0
		
	if (extension[0] != -1) {
		var ext0_upgrade = extension_get_neededUpgrade(extension[0])
		var ext0_active = upgrade >= ext0_upgrade
			
		ext0 += "\n"
		ext0 += string_return("[c="+string(c_nicered)+"]if [/c]", !ext0_active and eng())
		ext0 += string_return("[c="+string(c_green)+"][✓] [/c]", ext0_active)
		ext0 += string_return("[c="+string(c_ltorange)+"](+"+string(ext0_upgrade)+")[/c]", !ext0_active)
		ext0 += string_return("[c="+string(c_nicered)+"] ise[/c]", !ext0_active and !eng())
		ext0 += string_return(" ", !ext0_active)
		ext0 += "[c="+string(ext0_active ? c_green : c_ltgray)+"]"+extension_text(extension[0])+"[/c]"
			
		extCount++
	}
		
	if (extension[1] != -1) {
		var ext1_upgrade = extension_get_neededUpgrade(extension[1])
		var ext1_active = upgrade >= ext1_upgrade

		ext1 += "\n"
		ext1 += string_return("[c="+string(c_nicered)+"]if [/c]", !ext1_active and eng())
		ext1 += string_return("[c="+string(c_green)+"][✓] [/c]", ext1_active)
		ext1 += string_return("[c="+string(c_ltorange)+"](+"+string(ext1_upgrade)+")[/c]", !ext1_active)
		ext1 += string_return("[c="+string(c_nicered)+"] ise[/c]", !ext1_active and !eng())
		ext1 += string_return(" ", !ext1_active)
		ext1 += "[c="+string(ext1_active ? c_green : c_ltgray)+"]"+extension_text(extension[1])+"[/c]"
			
		extCount++
	}
		
	if (extCount > 0) {
		//ext0 = "\nAddition List:"+ext0
			
		if (extCount == 1) {
			if (extension[0] != -1)
				ext0 += "\n"
		}
		else if (extCount == 2) {
			ext1 += "\n"
		}
	}
	#endregion

	var cStr_format = string_format(cStr, 0, 1)
	var cDex_format = string_format(cDex, 0, 1)
	var cVit_format = string_format(cVit, 0, 1)
	var cMp_format = string_format(cMp, 0, 1)
	var cSta_format = string_format(cSta, 0, 1)

	#region Differences
	var diff_hp_txt = ""
	var diff_mana_txt = ""
	var diff_str_txt = ""
	var diff_dex_txt = ""
	var diff_vit_txt = ""
	var diff_mp_txt = ""
	var diff_sta_txt = ""

	if (!isActive and activeItem != -1) {
		var cStr_format_active = string_format(activeItem.cStr, 0, 1)
		var cDex_format_active = string_format(activeItem.cDex, 0, 1)
		var cVit_format_active = string_format(activeItem.cVit, 0, 1)
		var cMp_format_active = string_format(activeItem.cMp, 0, 1)
		var cSta_format_active = string_format(activeItem.cSta, 0, 1)
		
		diff_hp_txt = generate_difference_text(cHp, activeItem.cHp, false, upgraderForm)
		diff_mana_txt = generate_difference_text(cMana, activeItem.cMana, false, upgraderForm)
		diff_str_txt = generate_difference_text(real(cStr_format), real(cStr_format_active), false, upgraderForm)
		diff_dex_txt = generate_difference_text(real(cDex_format), real(cDex_format_active), false, upgraderForm)
		diff_vit_txt = generate_difference_text(real(cVit_format), real(cVit_format_active), false, upgraderForm)
		diff_mp_txt = generate_difference_text(real(cMp_format), real(cMp_format_active), false, upgraderForm)
		diff_sta_txt = generate_difference_text(real(cSta_format), real(cSta_format_active), false, upgraderForm)
	}
	#endregion

    tbT = "[c="+string(color1)+"]"+name+upgradeText+"[/c]\n\n"+
    //string_return("[c="+string(c_gray)+"]", cHp == 0)+ltext_health+string(cHp)+diff_hp_txt+"\n"+"[/c]"+
    string_return("[c="+string(c_gray)+"]", cMana == 0)+ltext_mana+string(cMana)+diff_mana_txt+"\n"+"[/c]"+
    string_return("[c="+string(c_gray)+"]", cStr == 0)+ltext_str+cStr_format+diff_str_txt+"\n"+"[/c]"+
    string_return("[c="+string(c_gray)+"]", cDex == 0)+ltext_dex+cDex_format+diff_dex_txt+"\n"+"[/c]"+
    string_return("[c="+string(c_gray)+"]", cVit == 0)+ltext_vit+cVit_format+diff_vit_txt+"\n"+"[/c]"+
    string_return("[c="+string(c_gray)+"]", cMp == 0)+ltext_mp+cMp_format+diff_mp_txt+"\n"+"[/c]"+
    string_return("[c="+string(c_gray)+"]", cSta == 0)+ltext_sta+cSta_format+diff_sta_txt+"\n"+"[/c]"+
    ext0+
    ext1+
	"\n[c="+string(c_ltyellow)+"]"+ltext_segment+get_upgradematerial_name(item_get_upgradematerial_type(itemLevel, specialty))+" ("+string(itemLevel)+(eng() ? " lv" : ". seviye")+")[/c]"+
    moneyText+
    ((is_active(i, j) and (owner.object_index == objItemBag or from == window_imtrade)) ? ("\n[c="+string(c_aqua)+"]"+ltext_equipped+"[/c]") : (((type == type_necklace and global.necklaceI != -1 or type == type_medallion and global.medallionI != -1) and get_active_item_ij(type, false) != -1 and owner.object_index != objUpgrader_npc) ? (""/*"\n[c="+string(c_aqua)+"]<Shift>: Compare\n<Space>: Equivalent[/c]"*/) : ""))
    
	if (owner.object_index == objBankWindow)
		tbT += eng() ? ("\n\n[c="+string(c_aqua)+"]Rent Duration: "+string(get_day() - rentTime)+" day(s)\nDaily Return: "+string(floor(cWorth*BANK_RENT_RATIO))+" gold(s) ("+string(round(100*BANK_RENT_RATIO))+"%)[/c]") : ("\n\n[c="+string(c_aqua)+"]Kiradaki Süre: "+string(get_day() - rentTime)+" gün\nGünlük Getirisi: "+string(floor(cWorth*BANK_RENT_RATIO))+" altın (%"+string(round(100*BANK_RENT_RATIO))+")[/c]")
	
	var t_pure = draw_text_colortags(0, 0, tbT)
	
    tbW = string_width(t_pure)
    tbH = string_height(t_pure)
}
else if (type == type_medallion) {
	#region Extension Text
	var ext0 = ""
	var ext1 = ""
	var extCount = 0
		
	if (extension[0] != -1) {
		var ext0_upgrade = extension_get_neededUpgrade(extension[0])
		var ext0_active = upgrade >= ext0_upgrade
			
		ext0 += "\n"
		ext0 += string_return("[c="+string(c_nicered)+"]if [/c]", !ext0_active and eng())
		ext0 += string_return("[c="+string(c_green)+"]"+/*[✓] */+"[/c]", ext0_active)
		ext0 += string_return("[c="+string(c_ltorange)+"](+"+string(ext0_upgrade)+")[/c]", !ext0_active)
		ext0 += string_return("[c="+string(c_nicered)+"] ise[/c]", !ext0_active and !eng())
		ext0 += string_return(" ", !ext0_active)
		ext0 += "[c="+string(ext0_active ? c_green : c_ltgray)+"]"+extension_text(extension[0])+"[/c]"
			
		extCount++
	}
		
	if (extension[1] != -1) {
		var ext1_upgrade = extension_get_neededUpgrade(extension[1])
		var ext1_active = upgrade >= ext1_upgrade

		ext0 += "\n"
		ext1 += string_return("[c="+string(c_nicered)+"]if [/c]", !ext1_active and eng())
		ext1 += string_return("[c="+string(c_green)+"]"+/*[✓] */+"[/c]", ext1_active)
		ext1 += string_return("[c="+string(c_ltorange)+"](+"+string(ext1_upgrade)+")[/c]", !ext1_active)
		ext1 += string_return("[c="+string(c_nicered)+"] ise[/c]", !ext1_active and !eng())
		ext1 += string_return(" ", !ext1_active)
		ext1 += "[c="+string(ext1_active ? c_green : c_ltgray)+"]"+extension_text(extension[1])+"[/c]"
			
		extCount++
	}
		
	if (extCount > 0) {
		//ext0 = "\nAddition List:"+ext0
			
		if (extCount == 1) {
			if (extension[0] != -1)
				ext0 += "\n"
		}
		else if (extCount == 2) {
			ext1 += "\n"
		}
	}
	#endregion

    tbT = "[c="+string(color1)+"]"+name+"[/c]\n"+
    ext0+
    ext1+
    moneyText+
    ((is_active(i, j) and (owner.object_index == objItemBag or from == window_imtrade)) ? ("\n[c="+string(c_aqua)+"]"+ltext_equipped+"[/c]") : (((type == type_necklace and global.necklaceI != -1 or type == type_medallion and global.medallionI != -1) and get_active_item_ij(type, false) != -1 and owner.object_index != objUpgrader_npc) ? (""/*"\n[c="+string(c_aqua)+"]<Shift>: Compare\n<Space>: Equivalent[/c]"*/) : ""))
    
	if (owner.object_index == objBankWindow)
		tbT += eng() ? ("\n\n[c="+string(c_aqua)+"]Rent Duration: "+string(get_day() - rentTime)+" day(s)\nDaily Return: "+string(floor(cWorth*BANK_RENT_RATIO))+" gold(s) ("+string(round(100*BANK_RENT_RATIO))+"%)[/c]") : ("\n\n[c="+string(c_aqua)+"]Kiradaki Süre: "+string(get_day() - rentTime)+" gün\nGünlük Getirisi: "+string(floor(cWorth*BANK_RENT_RATIO))+" altın (%"+string(round(100*BANK_RENT_RATIO))+")[/c]")
	
	var t_pure = draw_text_colortags(0, 0, tbT)
    tbW = string_width(t_pure)
    tbH = string_height(t_pure)
}
else if (type == type_potion or type == type_pet or type == type_quest or type == type_material or type == type_challengeItem or type == type_call) {
	tbT_withoutMoney = "[c="+string(color1)+"]"+name+"[/c]"+string_return("\n\n"+description, description != "")+"\n"
	tbT = tbT_withoutMoney
	
	if (type == type_challengeItem) {
		if (is_quest_finished(challenge))
			tbT += eng() ? ("\n[c="+string(c_nicered)+"]This challenge was completed.[/c]") : ("\n[c="+string(c_nicered)+"]Bu sözleşme zaten tamamlandı.[/c]")
		else if (quest_exists(challenge))
			tbT += eng() ? ("\n[c="+string(c_nicered)+"]This challenge is already active.[/c]") : ("\n[c="+string(c_nicered)+"]Bu sözleşme zaten aktif.[/c]")
	}
		
	tbT += moneyText
	
	if (owner.object_index == objBankWindow)
		tbT += eng() ? ("\n\n[c="+string(c_aqua)+"]Rent Duration: "+string(get_day() - rentTime)+" day(s)\nDaily Return: "+string(floor(cWorth*BANK_RENT_RATIO))+" gold(s) ("+string(round(100*BANK_RENT_RATIO))+"%)[/c]") : ("\n\n[c="+string(c_aqua)+"]Kiradaki Süre: "+string(get_day() - rentTime)+" gün\nGünlük Getirisi: "+string(floor(cWorth*BANK_RENT_RATIO))+" altın (%"+string(round(100*BANK_RENT_RATIO))+")[/c]")
	
	var t_pure = draw_text_colortags(0, 0, tbT)
    tbW = string_width(t_pure)
    tbH = string_height(t_pure)
}
else if (type != type_noitem) {
    tbT = "[c="+string(color1)+"]"+name+"[/c]"+"\n"+
    moneyText
	
	if (owner.object_index == objBankWindow)
		tbT += eng() ? ("\n\n[c="+string(c_aqua)+"]Rent Duration: "+string(get_day() - rentTime)+" day(s)\nDaily Return: "+string(floor((1+(type == type_valuable))*cWorth*BANK_RENT_RATIO))+" gold(s) ("+string(round(100*BANK_RENT_RATIO*(1+(type == type_valuable))))+"%)[/c]") : ("\n\n[c="+string(c_aqua)+"]Kiradaki Süre: "+string(get_day() - rentTime)+" gün\nGünlük Getirisi: "+string(floor((1+(type == type_valuable))*cWorth*BANK_RENT_RATIO))+" altın (%"+string(round(100*BANK_RENT_RATIO*(1+(type == type_valuable))))+")[/c]")
    else if (type == type_valuable)
		tbT += eng() ? "\n\n[c="+string(c_aqua)+"]Items generate gold when they are\nstored in bank, these valuable items\ngenerate 2x more gold.[/c]" : "\n\n[c="+string(c_aqua)+"]Eşyalar bankada saklandıklarında kira\ngetirisi sağlarlar. Ancak bu tip değerli\neşyalar iki kat altın getirir.[/c]"
	
	var t_pure = draw_text_colortags(0, 0, tbT)
    tbW = string_width(t_pure)
    tbH = string_height(t_pure)
}

if (upgrade != unique_number and upgrade != unique_number+1 and upgrade > 11 and !global.isCheated) {
	global.isCheated = true
	save_anticheat(global.saveNo)
}

isTextUpdated = true
draw_set_default()
draw_set_alpha(beforeAlpha)