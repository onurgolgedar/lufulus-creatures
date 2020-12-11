function item_self_calculate() {
	worth *= ITEM_WORTH_RATIO

	if (type == type_mweapon or type == type_sweapon)
		weapon_self_calculate()
	else if (type == type_clothes)
		clothes_self_calculate()
	else if (type == type_medallion)
		medallion_self_calculate()
	else if (type == type_necklace)
		necklace_self_calculate()
	else if (type == type_material) {
		if (name == name_base) {
			var materialType = upgrade
			var materialName = get_upgradematerial_name(materialType)
		
			if (eng()) {
				name = name+" of [c="+string(c_ltyellow)+"]Segment "+materialName+"[/c]"
				description += "Use this when upgrading "+string(max(upgrade*7, 1))+"-"+string(upgrade*7+6)+"\nlevel items."
			}
			else {
				name = "[c="+string(c_ltyellow)+"]"+materialName+" Kademesi[/c] için "+name
				description += string(max(upgrade*7, 1))+"-"+string(upgrade*7+6)+" seviye arası eşyaları\ngeliştirmekte kullanılır."
			}
		
			cWorth = round((materialType != 0)*5+13*power(materialType, 1.85))
			image_index = materialType
		}
	}
	else
		cWorth = round(worth)


}
