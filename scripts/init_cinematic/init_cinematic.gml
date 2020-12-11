function init_cinematic() {
	var nm = global.name
	var text

	page = -1
	maxPage = -1

	if (global.cinematicIndex == 0) {
		page = 1
		maxPage = 0

		if (eng()) {
			text[0] = "Castle of "+loc_hawmgrad+" needs new warriors.\n"
			+"Anyone who dreams to be a warrior\nguards the castle."
	
			text[1] = "In "+loc_hawmgrad+" Forest, one of them saw\n"
			+"an unknown-shaped soul."
	
			text[2] = nm+" fell on the ground in horror."
	
			text[3] = "He looked for the ghost again, but\n"
			+"couldn't see it. He stood up before it was late."
	
			text[4] = "What he saw was unlike anything,\n"
			+"and he had to find out what it was."
		}
		else {
			text[0] = loc_hawmgrad+" Kalesi'nin yeni savaşçılara ihtiyacı vardı.\n"
			+"Savaşçı olma hayali olan herkes ormanı keşfe çıkmıştı."
	
			text[1] = "Onlardan biri olan "+nm+", gezisi sırasında\n"
			+"biçimsiz bir ruhani varlık ile karşılaştı."
	
			text[2] = nm+" dehşetle yere serildi."
	
			text[3] = "Tekrar baktığında tehlike ortadan kaybolmuştu.\n"
			+nm+" çok geçmeden kendini toparladı."
	
			text[4] = "Gördüğü her neyse, başka hiçbir şeye benzemiyordu.\n"
			+"Ne gördüğünü eninde sonunda öğrenmeliydi."
		}

		sprite[maxPage] = sprNothingness
		cinematicText[maxPage] = text[maxPage]
		maxPage++

		sprite[maxPage] = sprTheSoul
		cinematicText[maxPage] = text[maxPage]
		maxPage++
	
		sprite[maxPage] = sprNothingness
		cinematicText[maxPage] = text[maxPage]
		maxPage++
	
		sprite[maxPage] = sprNothingness
		cinematicText[maxPage] = text[maxPage]
		maxPage++
	
		sprite[maxPage] = sprNothingness
		cinematicText[maxPage] = text[maxPage]
		maxPage++
	}
	else if (global.cinematicIndex == 1) {
		page = 1
		maxPage = 0

		if (eng()) {
			text[0] = nm+" felt a power he had never felt before.\n"
			+"As if he knew the memories he did not live,\n"
			+"the things he did not know."
	
			text[1] = "Were these related to the ghost he saw?\n"
			+"No, the ghost was just lost."
	
			text[2] = "Huge energy bursts occurred.\n"
			+"Luckily, Elise wasn't hurt."
		}
		else {
			text[0] = nm+" daha önce hiç hissetmediği bir güç hissetmişti.\n"
			+"Sanki yaşamadığı anıları, bilmediği şeyleri biliyordu."
	
			text[1] = "Olanlar gördüğü ruhla mı ilgiliydi?\n"
			+"Oysa hayalet hemen kaybolmuştu."
	
			text[2] = "Büyük patlamalar oldu, neyse ki Elise kurtuldu."
		}

		sprite[maxPage] = sprNothingness
		cinematicText[maxPage] = text[maxPage]
		maxPage++

		sprite[maxPage] = sprNothingness
		cinematicText[maxPage] = text[maxPage]
		maxPage++
	
		sprite[maxPage] = sprNothingness
		cinematicText[maxPage] = text[maxPage]
		maxPage++
	}


}
