var window = -1

if ((room == roomMenu or room == roomCinematic) and instance_number(parWindow) == 0) {
	if (room == roomCinematic)
		window = show_dialoguebox(15, 40, "", "[c="+string(c_white)+"]"+(eng() ? "Paused" : "Duraklatıldı")+"[/c]", id, 1, eng() ? "Main Menu" : "Ana Menü", eng() ? "Exit Game" : "Oyunu Kapat", window_get_fullscreen() ? (eng() ? "Windowed Mode" : "Pencere Modu") : (eng() ? "Fullscreen Mode" : "Tam Ekran Modu"), eng() ? "Continue" : "Devam")
	else
		window = show_dialoguebox(28, 40, "", "[c="+string(c_white)+"]"+(eng() ? "Do you really want to\nclose the game?" : "Oyunu kapatmak istediğinden\nemin misin?")+"[/c]", id, 2, eng() ? "Yes" : "Evet", "Cancel")
}

if (window != -1) {
	window.blackBackground = true
	window.menuBox = true
	window.depth = depth-100
}
else if (window == -1)
	event_perform(ev_keypress, ord("P"))