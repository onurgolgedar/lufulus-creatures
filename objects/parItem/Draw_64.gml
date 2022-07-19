if (global.itemSelected == -1 and (from == window_items or from == window_trade
or from == "Loot" or from == window_bank or from == window_actives)) {
    if (owner != -1 and owner.mouseOnBox and !test_upperclick_window(owner) and owner.mouseOnBox_i == i and owner.mouseOnBox_j == j and (tbT != "" or !isTextUpdated) and !imaginary) {			
		if (textAlpha < 0.98)
			textAlpha += 0.065*(1+2*IS_MOBILE)*delta()
		else
			textAlpha = 0.98
		
		with ((keyboard_check(vk_space) and !(is_active(i, j) and from == window_items) and from != window_actives and get_active_item_ij(type, 0) != -1) ? owner.compare_item[i, j] : id) {
	        if (id == other.id or other.upgrade == round(other.upgrade) and other.owner.compare_item[i, j].upgrade < unique_number) {
				if (!isTextUpdated and other.textAlpha > 0.35)
					event_perform(ev_other, ev_user0)
			
				other.textBoxWidth = show_textbox_general(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
		        tbT, tbW, tbH, imaginary ? c_dkblue : c_textbox, (other.textAlpha > 0.4) ? other.textAlpha : 0)
			} else {
				draw_set_font(fontiteminfo)
				var text = eng() ? "Numeric upgrade is needed for both\nactive item and this item.\n\nTheir upgrades must be like +1, +2, +3 etc.\nfor the comparison."
				: "Bu eşya veya kullandığın eşya geliştirilemez olduğu için\nönizleme yapılamıyor.\n\nİkisinin de gelişim düzeyi +1 +2 +3 gibi tam sayı olmalı."
				other.textBoxWidth = show_textbox_general(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
		        text, string_width(text), string_height(text), c_customred3, (other.textAlpha > 0.4) ? other.textAlpha : 0)
				draw_set_font(global.mainFont)
			}
		}
       		
        if (((type == type_medallion and global.medallionI != -1) or 
		(type == type_sweapon and has_active_mweapon() and (global.weaponType == wtype_bow or global.weaponType == wtype_crossbow)) or 
		(type == type_mweapon and (weaponType == wtype_bow or weaponType == wtype_crossbow) and has_active_sweapon()) or 
        (type == type_mweapon and (weaponType == wtype_bow or weaponType == wtype_crossbow) and has_active_mweapon() and (global.weaponType == wtype_bow or global.weaponType == wtype_crossbow)) or 
		(type == type_mweapon and weaponType == wtype_shield and has_active_mweapon() and global.weaponType == wtype_shield and global.weaponSprite != sprTorch) or 
        (type == type_sweapon and has_active_sweapon() and global.sWeaponType == weaponType) or 
        (type == type_necklace and global.necklaceI != -1) or 
        (type == type_clothes and global.clothesI != -1)) and !(is_active(i, j) and owner.object_index == objitemBag)
		and from != window_actives and object_index != objTorch
		and keyboard_check(vk_shift)) {
			var _infoFromType = type
			if (type == type_sweapon and !has_active_sweapon() and has_active_mweapon() and (global.weaponType == wtype_bow or global.weaponType == wtype_crossbow))
				_infoFromType = type_mweapon
			else if (type == type_mweapon and (weaponType == wtype_bow or weaponType == wtype_crossbow) and (!has_active_mweapon() or global.weaponType == wtype_shield) and has_active_sweapon())
				_infoFromType = type_sweapon
			
			if (instance_exists(objitemBag))
				var infoFrom = objitemBag.item[get_active_item_ij(_infoFromType, 0), get_active_item_ij(_infoFromType, 1)]
			else if (instance_exists(objTradeWindow))
				var infoFrom = objTradeWindow.im_item[get_active_item_ij(_infoFromType, 0), get_active_item_ij(_infoFromType, 1)]
			else if (instance_exists(objBankWindow))
				var infoFrom = objBankWindow.im_item[get_active_item_ij(_infoFromType, 0), get_active_item_ij(_infoFromType, 1)]

            if (device_mouse_x_to_gui(0) >= display_get_gui_width()/2) {
                with (infoFrom) {
			        if (!isTextUpdated and other.textAlpha > 0.35)
						event_perform(ev_other, ev_user0)
					
	                show_textbox_tcolor(device_mouse_x_to_gui(0)-other.textBoxWidth-5, device_mouse_y_to_gui(0),
	                tbT, tbW, tbH, (other.textAlpha > 0.4) ? other.textAlpha : 0)
				}
			}
            else {
                with (infoFrom) {
			        if (!isTextUpdated and other.textAlpha > 0.35)
						event_perform(ev_other, ev_user0)
					
	                show_textbox_tcolor(device_mouse_x_to_gui(0)+other.textBoxWidth+5, device_mouse_y_to_gui(0),
	                tbT, tbW, tbH, (other.textAlpha > 0.4) ? other.textAlpha : 0)
				}
			}
		}
	}
	else
		textAlpha = -0.2*IS_MOBILE
}
else
	textAlpha = -0.2*IS_MOBILE