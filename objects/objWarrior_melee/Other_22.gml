var bossExists = false
with (parAi)
	if (boss and type != type_wisdom)
		bossExists = true
		
protectionPrice = round(50+power(global.level, 1.25)*12)*(1+4*bossExists)

if (isQuestion(1)) {
	if (isButton(0))
		ask_npc(eng() ? ("Sure, but it costs [c="+string(c_gold)+"]"+string(protectionPrice)+" golds[/c] for you."+string_return("\nYes, it is too much because there is\na boss creature at this location.", bossExists)) : ("Olabilir, bunun için [c="+string(c_gold)+"]"+string(protectionPrice)+" altın[/c] isterim."+string_return("\nÇünkü bölgede üstün yaratık var.", bossExists)), 2, "Okay", "Cancel")
	if (isButton(1)) {
		var info = ""
		if (instance_exists(objC1))
			info += eng() ? ("● (2.5%) [c="+string(c_ltorange)+"]"+creature_1+"[/c] ➔ [c="+string(c_ltyellow)+"]Rare necklace[/c]\n[c="+string(c_ltgray)+"]It is a necklace that increases the chance of critical hitting.\n\n") : ("● (%2.5) [c="+string(c_ltorange)+"]"+creature_1+"[/c] yaratığında ➔ [c="+string(c_ltyellow)+"]özel bir kolye[/c]\n[c="+string(c_ltgray)+"]Kritik vurma ihtimalini artıran bir kolyedir.[/c]\n\n")
		if (instance_exists(objC4))
			info += eng() ? ("● (1.5%) [c="+string(c_ltorange)+"]"+creature_4+"[/c] ➔ [c="+string(c_ltyellow)+"]Rare sword[/c]\n[c="+string(c_ltgray)+"]It is a hybrid and very powerful weapon\nwith many features.\n\n") : ("● (%1.5) [c="+string(c_ltorange)+"]"+creature_4+"[/c] yaratığında ➔ [c="+string(c_ltyellow)+"]özel bir kılıç[/c]\n[c="+string(c_ltgray)+"]Çok fazla özelliği bulunan karma ve çok\ngüçlü bir silahtır.[/c]\n\n")
		if (instance_exists(objC5))
			info += eng() ? ("● (2%) [c="+string(c_ltorange)+"]"+creature_5+"[/c] ➔ [c="+string(c_ltyellow)+"]Rare crossbow[/c]\n[c="+string(c_ltgray)+"]It is a powerful crossbow that can stun opponents.\n\n") : ("● (%2) [c="+string(c_ltorange)+"]"+creature_5+"[/c] yaratığında ➔ [c="+string(c_ltyellow)+"]özel bir arbalet[/c]\n[c="+string(c_ltgray)+"]Rakipleri sersemletebilen güçlü bir arbalettir.[/c]\n\n")
		if (instance_exists(objCG1))
			info += eng() ? ("● (1%) [c="+string(c_ltorange)+"]"+creature_g1+"[/c] ➔ [c="+string(c_ltyellow)+"]Rare necklace[/c]\n[c="+string(c_ltgray)+"]It is a hybrid necklace that grants magic resistance\nwhile increasing poison damage.\n\n") : ("● (%1) [c="+string(c_ltorange)+"]"+creature_g1+"[/c] yaratığında ➔ [c="+string(c_ltyellow)+"]özel bir kolye[/c]\n[c="+string(c_ltgray)+"]Zehir hasarını artırırken büyü direnci\nkazandıran karma bir kolyedir.[/c]\n\n")
		if (instance_exists(objC6))
			info += eng() ? ("● (2%) [c="+string(c_ltorange)+"]"+creature_6+"[/c] ➔ [c="+string(c_ltyellow)+"]Rare armor[/c]\n[c="+string(c_ltgray)+"]It is a very special armor that focuses on\nboth defense and physical attack.\n\n") : ("● (%2) [c="+string(c_ltorange)+"]"+creature_6+"[/c] yaratığında ➔ [c="+string(c_ltyellow)+"]özel bir zırh[/c]\n[c="+string(c_ltgray)+"]Hem savunma hem fiziksel saldırıya\nodaklanan çok özel bir zırhtır.[/c]\n\n")
		if (instance_exists(objC7))
			info += eng() ? ("● (1.5%) [c="+string(c_ltorange)+"]"+creature_7+"[/c] ➔ [c="+string(c_ltyellow)+"]Rare sword[/c]\n[c="+string(c_ltgray)+"]It is a very fast and powerful sword.\n\n") : ("● (%1.5) [c="+string(c_ltorange)+"]"+creature_7+"[/c] yaratığında ➔ [c="+string(c_ltyellow)+"]özel bir kılıç[/c]\n[c="+string(c_ltgray)+"]Çok seri ve güçlü parçalayıcı bir kılıçtır.[/c]\n\n")
		if (instance_exists(objCG2))
			info += eng() ? ("● (1%) [c="+string(c_ltorange)+"]"+creature_g2+"[/c] ➔ [c="+string(c_ltyellow)+"]Rare bow[/c]\n[c="+string(c_ltgray)+"]It is a very toxic bow with a high critical rate.\n\n") : ("● (%1) [c="+string(c_ltorange)+"]"+creature_g2+"[/c] yaratığında ➔ [c="+string(c_ltyellow)+"]özel bir yay[/c]\n[c="+string(c_ltgray)+"]Yüksek kritik oranına sahip çok zehirli\nbir yaydır.[/c]\n\n")
		if (instance_exists(objCA2))
			info += eng() ? ("● (1.5%) [c="+string(c_ltorange)+"]"+creature_a2+"[/c] ➔ [c="+string(c_ltyellow)+"]Rare necklace[/c]\n[c="+string(c_ltgray)+"]It is a necklace that focuses on dexterity and magic power.\n\n") : ("● (%1.5) [c="+string(c_ltorange)+"]"+creature_a2+"[/c] yaratığında ➔ [c="+string(c_ltyellow)+"]özel bir kolye[/c]\n[c="+string(c_ltgray)+"]Çevikliğe ve büyü gücüne odaklanan bir\nkolyedir.[/c]\n\n")
		if (instance_exists(objC11))
			info += eng() ? ("● (1.5%) [c="+string(c_ltorange)+"]"+creature_11+"[/c] ➔ [c="+string(c_ltyellow)+"]Rare sword[/c]\n[c="+string(c_ltgray)+"]It is a very heavy and powerful sword\nthat can stun opponents.\n\n") : ("● (%1.5) [c="+string(c_ltorange)+"]"+creature_11+"[/c] yaratığında ➔ [c="+string(c_ltyellow)+"]özel bir kılıç[/c]\n[c="+string(c_ltgray)+"]Rakipleri sersemletebilen çok ağır ve\ngüçlü bir kılıçtır.[/c]\n\n")
		if (instance_exists(objC13))
			info += eng() ? ("● (1.5%) [c="+string(c_ltorange)+"]"+creature_13+"[/c] ➔ [c="+string(c_ltyellow)+"]Rare sword[/c]\n[c="+string(c_ltgray)+"]It is a very fast and very powerful sword.\n\n") : ("● (%1.5) [c="+string(c_ltorange)+"]"+creature_13+"[/c] yaratığında ➔ [c="+string(c_ltyellow)+"]özel bir kılıç[/c]\n[c="+string(c_ltgray)+"]Çok seri ve büyü gücü çok yüksek bir kılıçtır.[/c]\n\n")
		
		if (info != "")
			info = eng() ? ("I know a little about the loot that can be found.\n\n"+string_copy(info, 1, string_length(info)-2)) : ("Bulunabilecek ganimetlerle ilgili şunları biliyorum.\n\n"+string_copy(info, 1, string_length(info)-2))
		else
			info = eng() ? "I do not know anything about this area." : "Bu bölgeyle ilgili bir şey bilmiyorum."
			
		show_messagebox(500, 300, info, (name != "" ? name : tag)+":")
	}
}

if (isQuestion(2)) {
	if (isButton(0)) {		
		if (global.money >= protectionPrice) {
			isProtector = true
			protection_owner = objPlayer.id
	
			with (objPlayer)
				ai_protectors_add(other.id)
				
			change_money(-protectionPrice, true)
		}
		else
			show_messagebox(600, 90, eng() ? "You have not enough gold." : "Altının yetersiz.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
	}
}