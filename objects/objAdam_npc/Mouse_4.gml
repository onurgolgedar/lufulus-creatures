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
	
var questionText

if (tag == (eng() ? "Challenger" : "Söz Muhafızı"))
	questionText = eng() ? "To survive, you must do\nyour best!" : "Mücadelen için yapabildiğinin\nen iyisini yap!"
else if (tag == (eng() ? "Collector" : "Koleksiyoncu"))
	questionText = eng() ? "That's my collection.\nEach of them is special." : "Bunlar benim koleksiyonum.\nHepsi özeldir."
else if (tag == (eng() ? "Stylist" : "Stilist"))
	questionText = eng() ? "Lets... Do something." : "Hadi... Bir şeyler yapalım."
else if (tag == (eng() ? "Runes&Cures" : "Rünler&Haplar"))
	questionText = eng() ? "You look for something... Functional?" : "Aradığın şey... İşlevsellik?"
else {
	var randomNumber = irandom(4)
	if (randomNumber == 0)
		questionText = eng() ? "How can I help you?" : "Sana nasıl yardımcı olabilirim?"
	else if (randomNumber == 1)
		questionText = eng() ? "What are you looking for?" : "Ne ihtiyacınız vardı?"
	else if (randomNumber == 2)
		questionText = eng() ? "They are for sale." : "Hepsi satışta."
	else if (randomNumber == 3)
		questionText = eng() ? "I have the best price." : "En iyi fiyatlar bende."
	else if (randomNumber == 4)
		questionText = eng() ? "Everything here is cheap\nand good quality." : "Buradaki her şey ucuz\nve çok kaliteli."
}
	
var window = ask_npc(questionText
+ string_return(eng() ? ("\n\n[c="+string(c_customred_compare)+"]"+string(-round((ITEM_PRICE_RATIO-priceRatio)/ITEM_PRICE_RATIO*100))+"% more expensive than\nother sellers.[/c]") : ("\n\n[c="+string(c_customred_compare)+"]Diğer satıcılara göre %"+string(-round((ITEM_PRICE_RATIO-priceRatio)/ITEM_PRICE_RATIO*100))+" daha\npahalıya satıyor.[/c]"), priceRatio > ITEM_PRICE_RATIO), 1
, eng() ? "Trade" : "Ticaret"
, string_return(eng() ? "Clothes' Style" : "Kıyafet Stili", tag == (eng() ? "Stylist" : "Stilist"))
, "Cancel")
window.uniqueNo = 45