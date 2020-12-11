/// @param text
function fm_get() {

	var isEnglish = eng()

	if (argument[0] == 0)
		return isEnglish ? "Equip a weapon from Items(B)."
		: "Eşyalar penceresinden(B) kılıcını eline al."
	
	else if (argument[0] == 1)
		return isEnglish ? "Open Journal(J) to see active quests."
		: "Görevlerini Görevler(J)'den kontrol edebilirsin."
	
	else if (argument[0] == 2)
		return isEnglish ? "Red arrows show the direction to\na quest that can be taken up.\n"+(IS_MOBILE ? "Tap" : "Click")+" it to see the way."
		: "Kırmızı ok işareti alınabilecek görevleri\nişaret eder. Bu okun üzerine "+(IS_MOBILE ? "dokunarak" : "tıklayarak")+"\nyolu görebilirsin."
	
	else if (argument[0] == 3)
		return isEnglish ? ((IS_MOBILE ? "Tap" : "Click")+": Interaction")
		: ((IS_MOBILE ? "Dokun" : "Tıkla")+": Etkileşim")
	
	else if (argument[0] == 4)
		return  isEnglish ? "You can get quest offers by fighting\nenemies and gaining experience."
		: "Savaşıp tecrübe kazanarak\ngörev tekliflerine erişebilirsin."
	
	else if (argument[0] == 5)
		return isEnglish ? "You can check quests\nwith Quests(J)."
		: "Görevler(J)'den görevleri\ninceleyebilirsin."
	
	else if (argument[0] == 6)
		return isEnglish ? "You smell blood."
		: "Kan kokusu alıyorsun."
	
	else if (argument[0] == 7)
		return isEnglish ? "You've saved him."
		: "Onu kurtardın."
	
	else if (argument[0] == 8)
		return IS_MOBILE ? (isEnglish ? "Use Map to travel.\nTap the star on the left corner."
		: "Gezinmek için haritayı kullan.\nHaritaya soldaki yıldızdan ulaşabilirsin.") : (isEnglish ? "Use the Map(M) to travel.\nIt is on the bottom left side."
		: "Gezinmek için haritayı(M) kullan.\nHarita sol alt köşededir.")
	
	else if (argument[0] == 9)
		return isEnglish ? "Follow the path to go to the castle."
		: "Kaleye gitmek için patikayı takip et."
	
	else if (argument[0] == 10)
		return isEnglish ? "You can see an offer to improve the item by\ndrag&dropping the item to the blacksmith."
		: "Bir eşyayı tutup demirciye bırakarak\ngeliştirme teklifini görebilirsin."
	
	else if (argument[0] == 11)
		return isEnglish ? "You are on the creature hunt with "+npc_elise+".\nYou should stay close to Elise and protect her."
		: npc_elise+" ile yaratık avındasın.\nYakınında olup onu koruman iyi olabilir."
	
	else if (argument[0] == 12)
		return isEnglish ? "The locals believe that there is\na bloody creature in the cave."
		: "Söylentilere göre mağarada kanlı\nbir yaratık var."
	
	else if (argument[0] == 13)
		return isEnglish ? "Finding the sword is enough for\nthe quest, there is no need\nto complete all waves."
		: "Kılıcı bulman görevi tamamlaman\niçin yeterli. Tüm dalgaları\ntamamlaman gerekmiyor."
	
	else if (argument[0] == 14)
		return isEnglish ? "You're weak because of Death Effect.\nControl effects on left-top corner."
		: "Ölüm Etkisi yüzünden yaralısın,\netkilerin kontrolü sol üst köşededir."
	
	else if (argument[0] == 15)
		return isEnglish ? "You can travel the quest you\nclicked in Quests window(J)."
		: "Görevler penceresinde(J) tıkladığın\ngöreve seyahat edebilirsin."
	
	else if (argument[0] == 16)
		return isEnglish ? "Yellow arrows around you show\nthe target of a quest you have."
		: "Etrafında bulunan sarı oklar, mevcut\nbir görev hedefini gösterir."
	
	else if (argument[0] == 17)
		return isEnglish ? "The circle is filled.\nStay in the circle's area."
		: "Çember doldu, çemberin içinde kal."
	
	else
		return -1


}
