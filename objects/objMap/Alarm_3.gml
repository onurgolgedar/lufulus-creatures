delta_alarm(3, sec/10)

if (!is_outfight() and !instance_exists(contWarzone)) {
	//show_messagebox(200, 200, eng() ? "It is not allowed when you are in fight." : "Bu işlem savaş sırasında yapılamaz.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", sec)
	
	alarm[1] = 1
	alarm[3] = -1
}