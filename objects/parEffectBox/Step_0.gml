xx = order*55-17

var beforeMouseOn = mouseOn
mouseOn = device_mouse_y_to_gui(0) < 60 and device_mouse_x_to_gui(0) > xx-22 and device_mouse_x_to_gui(0) < xx+22
and device_mouse_y_to_gui(0) > 8 and !test_upperclick_window()
if (mouseOn != beforeMouseOn) {
	if (mouseOn and !beforeMouseOn) {
		with (contGUi)
			hideSummaryInfo_alpha = 1
	}
	else if (!mouseOn and beforeMouseOn) {
		with (contGUi)
			alarm[1] = 1
	}
}

if (!IS_MOBILE and (mouse_check_button_pressed(mb_right) or mouse_check_button_pressed(mb_left)) or IS_MOBILE and global_tab_step or gamepad_rightpressed() or gamepad_leftpressed()) {
	global_tab_step = false
	
	if (mouseOn) {
		if (object_index == efboxDefenseLock) {
			/*var modeText = !global.defenseLock ? (eng() ? ("[c="+string(c_yellow)+"]Safe[/c]") : ("[c="+string(c_yellow)+"]Güvenli[/c]")) : (eng() ? "[c="+string(c_nicered)+"]Unsafe[/c]" : "[c="+string(c_nicered)+"]Tehlikeli[/c]")
			var dialogue_box = show_dialoguebox(15, 250, eng() ? ("Do you really want to\nbe "+modeText+"?") : (modeText+" duruma geçmek istediğinden\nemin misin?"), eng() ? "Switch State" : "Durum Değiştir", id, 3, eng() ? "Yes" : "Evet", "Cancel")
			dialogue_box.specialDesign = true*/
			
			if (room != roomCave or !quest_exists(objChallenge_bloodyRolf)) {
				global.defenseLock = !global.defenseLock
				event_user(3)
			
				audio_play_sound(sndMenuTick, 10, false)
			}
			else
				show_messagebox(300, 300, eng() ? "You cannot change safety here because\nyou accepted a related challenge." : "Bu bölgede güvenliğini değiştiremezsin çünkü\nilgili bir sözleşmeyi kabul ettin.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec*1.5)
		}
		else if (object_index == efboxDeath) {
			var dialogue_box = show_dialoguebox(15, 250, eng() ? "How do you to clear this debuff?" : "Bu etkiyi nasıl kaldırmak istersin?", eng() ? "Clear the Debuff" : "Etkiyi Kaldır", id, 1, eng() ? "Use Medical Kit" : "Tedavi Kiti Kullan", "Cancel")
			dialogue_box.specialDesign = true
		}
		else if (object_index == efboxRecruitedWarrior1 or object_index == efboxRecruitedWarrior2 or object_index == efboxRecruitedWarrior3 or object_index == efboxRecruitedWarrior4) {
			var dialogue_box = show_dialoguebox(15, 250, eng() ? "Are you sure you want to remove\nthis warrior from your group?" : "Bu savaşçıyı grubundan çıkarmak istediğinden emin misin?", eng() ? "Remove From Group" : "Gruptan Çıkar", id, 2, eng() ? "Remove" : "Çıkar", "Cancel")
			dialogue_box.specialDesign = true
		}
		else {
			var dialogue_box = show_dialoguebox(15, 250, eng() ? "Do you want to clear this effect?" : "Bu etkiyi kaldırmak istiyor musun?", eng() ? "Clear the Effect" : "Etkiyi Kaldır", id, 2, eng() ? "Clear" : "Kaldır", "Cancel")
			dialogue_box.specialDesign = true
		}
	}
}