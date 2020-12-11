if (!usable or objMainMenuDraw.blackScreenAlpha > 0.5)
	exit
	
if (text == "New Game" or text == "Yeni Oyun") {
	if (!contOut.save1exists or !contOut.save2exists or !contOut.save3exists or !contOut.save4exists) {	
		load_all("-1")
		
		with (contMain) {
			gameTime_start = 0
			event_perform(ev_other, ev_user0)
		}
			
		audio_stop_sound(sndMusicBoss)
		audio_stop_sound(sndMusicCastle)
		audio_stop_sound(sndMusicClassic_calm)
		audio_stop_sound(sndMusicMenu)
		audio_play_sound(sndMusicClassic_calm, 10, false)
		room_goto(roomCinematic)
	
		if (!contOut.save1exists) {
			save_all("1")
		
			global.saveNo = "1"
		
			ini_open(string(global.steamID)+"\\options.lufsav")
				ini_write_string("24x131ax", "f1w2axhkt", "1")
			ini_close()
		}
		else if (!contOut.save2exists) {
			save_all("2")
		
			global.saveNo = "2"
		
			ini_open(string(global.steamID)+"\\options.lufsav")
				ini_write_string("24x131ax", "f1w2axhkt", "2")
			ini_close()
		}
		else if (!contOut.save3exists) {
			save_all("3")
		
			global.saveNo = "3"
		
			ini_open(string(global.steamID)+"\\options.lufsav")
				ini_write_string("24x131ax", "f1w2axhkt", "3")
			ini_close()
		}
		else if (!contOut.save4exists) {
			save_all("4")
		
			global.saveNo = "4"
		
			ini_open(string(global.steamID)+"\\options.lufsav")
				ini_write_string("24x131ax", "f1w2axhkt", "4")
			ini_close()
		}
	}
	else {
		var gamelv
		for (var i = 1; i < 5; i++)
			gamelv[i] = -1
		
		for (var i = 1; i < 5; i++) {
			if (file_exists(string(global.steamID)+"\\save_"+string(i)+".lufsav")) {
				ini_open(string(global.steamID)+"\\save_"+string(i)+".lufsav")
					gamelv[i] = decyrpt(ini_read_real("j32a52a", "6a2ayj3vc", encyrpt(-1)))
				ini_close()
			}
		}
		
		show_dialoguebox(IS_MOBILE ? screen_point(x, 0)+180 : device_mouse_x_to_gui(0), IS_MOBILE ? screen_point(y, 1)-40 : device_mouse_y_to_gui(0), eng() ? "You need to delete a game to\nstart a new one. Which one\ndo you want to override?" : "Yeni bir oyuna başlamak için\nkayıtlı oyunlardan birini silmelisin.\nHangsini gözden çıkartabilirsin?", eng() ? "Override a game" : "Bir kaydını sil", id, 2,
		string_return(eng() ? "Level "+string(gamelv[1]) : "Seviye "+string(gamelv[1]), gamelv[1]),
		string_return(eng() ? "Level "+string(gamelv[2]) : "Seviye "+string(gamelv[2]), gamelv[2]),
		string_return(eng() ? "Level "+string(gamelv[3]) : "Seviye "+string(gamelv[3]), gamelv[3]),
		string_return(eng() ? "Level "+string(gamelv[4]) : "Seviye "+string(gamelv[4]), gamelv[4]),
		"Cancel")
	}
}
else if (text == "Continue" or text == "Devam Et") {
	open_saved_game(contOut.conti)
}
else if (text == "Load" or text == "Yükle") {
	var gamelv
	for (var i = 1; i < 5; i++)
		gamelv[i] = -1
		
	for (var i = 1; i < 5; i++) {
		if (file_exists(string(global.steamID)+"\\save_"+string(i)+".lufsav")) {
			ini_open(string(global.steamID)+"\\save_"+string(i)+".lufsav")
				gamelv[i] = decyrpt(ini_read_real("j32a52a", "6a2ayj3vc", encyrpt(-1)))
			ini_close()
		}
	}
	
	show_dialoguebox(IS_MOBILE ? screen_point(x, 0)+180 : device_mouse_x_to_gui(0), IS_MOBILE ? screen_point(y, 1)-40 : device_mouse_y_to_gui(0), "", eng() ? "Load a game" : "Bir oyun yükle", id, 1,
	string_return(eng() ? "Level "+string(gamelv[1]) : "Seviye "+string(gamelv[1]), gamelv[1]),
	string_return(eng() ? "Level "+string(gamelv[2]) : "Seviye "+string(gamelv[2]), gamelv[2]),
	string_return(eng() ? "Level "+string(gamelv[3]) : "Seviye "+string(gamelv[3]), gamelv[3]),
	string_return(eng() ? "Level "+string(gamelv[4]) : "Seviye "+string(gamelv[4]), gamelv[4]),
	"Cancel")
}
else if (text == "Exit Game" or text == "Oyunu Kapat") {
	game_end()
}
else if (text == "Main Menu" or text == "Ana Menü") {
	with (contMain)
		event_perform(ev_other, ev_user0)
	
	room_goto(roomMenu)
}
else if (text == "Options" or text == "Ayarlar") {
	with (contMain)
		event_perform(ev_other, ev_user0)
		
	room_goto(roomOptions)
}
else if (text == "Default" or text == "Varsayılan") {
	global.gui_size = 1.2
	global.performanceMode = 2
	global.quality = 1.2
	global.lightActive = !objMainMenuDraw.showGPUWarning
	
	//global.verticalSync = true ? why force
	change_verticalSync(false)
	game_set_fps(global.refreshRate)
	global.manualRefreshRate_mode = false
	
	audio_set_master_gain(0, 1)
	change_gain_music(0.75)
	change_gain_nonmusic(1)
	
	surface_resize_special()
	
	save_options()
}