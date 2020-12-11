save1exists = file_exists(string(global.steamID)+"\\save_1.lufsav")
save2exists = file_exists(string(global.steamID)+"\\save_2.lufsav")
save3exists = file_exists(string(global.steamID)+"\\save_3.lufsav")
save4exists = file_exists(string(global.steamID)+"\\save_4.lufsav")
	
ini_open(string(global.steamID)+"\\options.lufsav")
	conti = ini_read_string("24x131ax", "f1w2axhkt", "0")
	if (!(conti == "1" and contOut.save1exists 
	or conti == "2" and contOut.save2exists
	or conti == "3" and contOut.save3exists
	or conti == "4" and contOut.save4exists))
		conti = "0"
ini_close()

if (room == roomMenu) {
	with (objMainMenuButton)
		event_perform(ev_other, ev_user0)
}