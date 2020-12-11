#region Click Test
if (test_upperclick_window() or test_upperclick_gui())
	exit

if (death or mode == md_attack)
	exit

if (point_distance(x, y, objPlayer.x, objPlayer.y) > NPC_CLICKDISTANCE
or collision_line(x, y, objPlayer.x, objPlayer.y, parSolid, 1, 1)) {
	instance_create_layer(x, y, "lyBelowGUI", objNPCDistanceCircle)
	show_messagebox(250, 250, eng() ? "You must be near and there\nmust be no obstacles between you." : "Yakınında olmalısın.\nAranızda engel olmamalı.", eng() ? "Not Allowed" : "İşlem Gerçekleştirilemedi", 1.5*sec)
	exit
}
#endregion

targetAngle = point_direction(x, y, objPlayer.x, objPlayer.y)

var loan = calculate_debt()
var refund = global.debt
var questionText = eng() ? "How can I help you?\n\n[c="+string(c_customgreen_compare)+"]The maximum loan amount you can get\ndepends on your credit score and the\nvalue of your items in the bank.[/c]" : "Sana nasıl yardımcı olabilirim?\n\n[c="+string(c_customgreen_compare)+"]Alabileceğiniz maksimum borç miktarı,\nkredi puanınıza ve bankadaki eşyalarınızın\ndeğerine bağlıdır.[/c]"
if (global.rentGold > 0)
	questionText += eng() ? ("\n\nRent Payment: [c="+string(c_gold)+"]"+string(global.rentGold)+" gold(s)[/c]") : ("\n\nKira Ödemesi: [c="+string(c_gold)+"]"+string(global.rentGold)+" altın[/c]")
var question = ask_npc(questionText, 1, eng() ? "Bank" : "Banka"
		, global.debt == 0 ? (eng() ? ("[c="+string(c_gold)+"]Loan: "+string(loan)+"[/c]") : ("[c="+string(c_gold)+"]Borç Al: "+string(loan)+"[/c]"))
						   : (eng() ? ("[c="+string(c_gold)+"]Refund: "+string(refund)+"[/c]") : ("[c="+string(c_gold)+"]Geri Öde: "+string(refund)+"[/c]"))
		, eng() ? "Trade" : "Ticaret"
		, "Cancel")
question.buttonWidth += 20+IS_MOBILE*15