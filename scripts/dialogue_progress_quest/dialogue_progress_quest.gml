/// @param dialogueID
/// @param dialogueNo
/// @param owner
/// @param answerBefore*
function dialogue_progress_quest() {

	// Sadece 1 tane uzun cevap destekleniyor. Eğer uzun cevap şart ise yanına başka bir cevap koyma.

#region INIT
	var dialogueID = argument[0]
	var dialogueNo = argument[1]
	var owner = argument[2]
	var dialogueBox = pointer_null
	var nm = global.name
	var text = ""
	var text_eng = ""

	var answerBefore
	if (argument_count == 4)
		answerBefore = argument[3]
	else
		answerBefore = -1

	var ans
	ans[0] = "Okay"
	ans[1] = ""
	ans[2] = ""
	ans[3] = ""
	ans[4] = ""
	ans[5] = ""
	ans[6] = ""
	ans[7] = ""

	var ans_eng
	ans_eng[0] = "Okay"
	ans_eng[1] = ""
	ans_eng[2] = ""
	ans_eng[3] = ""
	ans_eng[4] = ""
	ans_eng[5] = ""
	ans_eng[6] = ""
	ans_eng[7] = ""

	text = ""
	var countingNo = 0
#endregion

#region Quest Road Scout 2
	if (dialogueID == objQuestRoad_scout2) {
		if (++countingNo == dialogueNo) {			
			text = "Bu mektubu "+loc_hawmgrad+"'a götürmen gerek."
			+"\nLütfen Lord "+npc_lorddamph+"'a ulaşması için elinden\n"+
			+"gelen her şeyi yap."
			+"\n\n[c="+string(c_aqua)+"]Gizli bir mektup uzatır.[/c]"
		
			text_eng = "You must bring this letter to Lord "+npc_lorddamph+".\nHe is in "+loc_hawmgrad+"."
			+" It is very important,\nplease be careful!"
			+"\n\n[c="+string(c_aqua)+"]Gives a secret letter.[/c]"
		}
	}
#endregion

#region Quest Cunning
	if (dialogueID == objQuest_cunning) {
		if (++countingNo == dialogueNo) {			
			text = "Seni gördüğüme sevindim "+nm+".\n"
			+"Elimde sana uygun bir görev var."
			text_eng = "Glad to see you "+nm+".\n"
			+"I have a quest proper for you."
				
			ans[0] = "Nedir?"
			ans_eng[0] = "Okay?"
		}
		if (++countingNo == dialogueNo) {
			text = creature_5+" denilen yaratıklar agresifleşmeye başladılar.\n"
			+"Onlara buraların hakiminin kim olduğunu hatırlatman\n"
			+"gerek."
		
			text_eng = "The creatures called "+creature_5+" began to"
			+" become\naggressive. You need to remind them who we are."
		}
	}
#endregion

#region Quest Blacksmith
	if (dialogueID == objQuest_blacksmith) {
		if (++countingNo == dialogueNo) {			
			text = nm+" kendini kanıtlamaya çalıştığını duydum.\n"
			+"Senin için bir görevim var."
			text_eng = nm+", I heard you try to prove yourself.\nI have a mission for you."
				
			ans[0] = "Sizin için ne yapabilirim?"
			ans_eng[0] = "What can I do for you?"
		}
		if (++countingNo == dialogueNo) {			
			text = "Bu obur yaratıklar, benim için özel dövülmüş bir\n"
			+"kılıcı çalıp yutmuşlar. Kılıcı getiren köylüler ölmüş."
			text_eng = "These valiant creatures stole a sword from foolish\n"
			+"villagers. The sword was crafted for me.\n"
			+"They were bring the sword to me. They may\nalready be dead."
				
			ans[0] = "Ben mi devreye gireceğim?"
			ans_eng[0] = "Will I intervene?"
		}
		if (++countingNo == dialogueNo) {			
			text = "Köylüleri tespit et, kellelerini bana getir."
			text_eng = "Find the villagers, bring me their heads."
				
			ans[0] = "Nasıl isterseniz."
			ans[1] = "Bu bir şaka mı?"
		
			ans_eng[0] = "As you wish."
			ans_eng[1] = "Is this a joke?"
		}
		if (++countingNo == dialogueNo) {
			if (answerBefore == 0) {
				text = "Dur! Kötü bir şaka masumların kellesine mal olsun\n"
				+"istemem. Senden istediğim sadece "+loc_wave1+"\n"
				+"civarındaki yaratıklardan kılıcımı geri alman."
			
				text_eng = "Stop! I don't want a bad joke to cost the head of\n"
				+"the innocent. I'm just asking you to take back my\n"
				+"sword from the creatures in the valley."
			}
			else if (answerBefore == 1) {
				text = "Evet, evet... Sezgilerin kuvvetliymiş asker.\n"
				+loc_wave1+" bölgesine ulaş ve kılıcımı geri getir."
		
				text_eng = "Yes, yes... Your intuition is strong, soldier.\n"
				+"Just go to "+loc_wave1+", get my sword back."
			}
		}
	}
#endregion

#region Quest Blacksmith 2
	if (dialogueID == objQuest_blacksmith2) {	
		if (++countingNo == dialogueNo) {			
			text = "Ha, ne oldu?"
			text_eng = "What happened?"
		
			ans[0] = "Kılıcınız söylediğiniz gibi "+loc_wave1+" bölgesindeydi."
			ans_eng[0] =  "Your sword was in "+loc_wave1+", as you said."
		}
		if (++countingNo == dialogueNo) {			
			text = "Kılıcı yemelerine şaşırdım. Kılıç büyük gümüş bir\n"
			+"kürdana benziyor."
			text_eng = "I'm surprised they ate the sword."+
			"\nThe sword looks like a big silver toothpick."
		
			ans[0] = "Mizah anlayışınıza yavaş yavaş alışmaya\n"+
			"başlıyorum sanırım."
		
			ans_eng[0] = "I'm starting to get used to your\nsense of humor."
		}
		if (++countingNo == dialogueNo) {			
			text = "Kılıcı "+npc_trogen+"'e götürmeni istiyorum,\n"
			+"oldukça yıpranmış görünüyor. Benim\n"
			+"gönderdiğimi söylemezsen iyi olur."
		
			text_eng = "I want you to take the sword to "+npc_trogen+",\n"
			+"it looks pretty worn. You'd better not\n"
			+"tell that I sent it."
		}
	}
#endregion

#region Blood Mineral 2
	if (dialogueID == objQuest_bloodMineral_2) {
		if (++countingNo == dialogueNo) {			
			text = global.name+", ormanda kan mineraline rastlamanın\ntek açıklaması, liderlerinin bazı yoldaşlarını mağaradan\nsürmesi olabilir. Bence senin oradaki varlığın\nbüyük bir iç karışıklığa sebep oldu."
			
			text_eng = global.name+", the only explanation for finding\nthe blood mineral outside, may be that\nsome of his leaders are driving from the cave.\nI think your presence in there has\ncaused a huge confusion."
				
			ans[0] = "Bunu nerden çıkartıyorsun?"
			ans_eng[0] = "How did you get that?"
		}
		if (++countingNo == dialogueNo) {
			text = "Bu mineral sadece Mağara'da\nbulunur ve o mağaraya giren yaratıklar\nbir daha asla çıkamaz."
				
			text_eng = "This mineral is found only in the cave,\nand creatures that enter the cave can\nnever come out again."
			
			ans[0] = "Belki sadece kaçmışlardır."
			ans_eng[0] = "Maybe they just escaped."
		}
		if (++countingNo == dialogueNo) {
			text = "Yaratıklar sadıktır, hepsi askerdir Gawain.\nBizim gibi değiller."
				
			text_eng = "These creatures are faithful,\nall of them are soldiers, Gawain.\nThey're not like us."
			
			ans[0] = "Ne yapmam lazım?"
			ans_eng[0] = "What should I do?"
		}
		if (++countingNo == dialogueNo) {
			text = "Benim için bir araştırma yap.\nLord'un bildikleri vardır."
				
			text_eng = "Do a research for me.\nThe Lord must know something."
		}
	}
#endregion

#region First Fight
	if (dialogueID == objQuest_firstFight) {
		if (++countingNo == dialogueNo) {			
			text = "Yetkilerimi hiçe sayan hainlerin bu topraklarda\nyaşamasına izin veremem!"
			
			text_eng = "I can't let the traitors who ignore my\npowers live on this land!"
				
			ans[0] = "Onlar kim, generalim?"
			ans[1] = "Ne oldu?"
				
			ans_eng[0] = "Who are they, general?"
			ans_eng[1] = "What did happen?"
		}
		if (++countingNo == dialogueNo) {			
			text = "Asırlarca bu toprakları sırlar korudu.\nİki yüz hain varmış aramızda diye, imparatorluğun\nsırlarını akılsızlara emanet edecek değilim."
			
			text_eng = "For centuries, these lands were preserved with secrets.\nThere are hundred traitors among us, I am not\nentrusting the secrets of the empire to these fools."
				
			ans[0] = "Doğru olan bu bence."
			ans[1] = "Tamam"
				
			ans_eng[0] = "It is the right thing to do."
			ans_eng[1] = "Okay"
		}
	}
#endregion

#region Meet Elise
	if (dialogueID == objQuest_meetElise) {
		if (++countingNo == dialogueNo) {			
			text = "Evet?"
			
			text_eng = "Yes?"
				
			ans[0] = "Zor bir av olmalı... Güçlü gözüküyorlar."
			ans_eng[0] = "They must be tough preys ... Look pretty strong."
		}
		if (++countingNo == dialogueNo) {			
			text = "Neredeyse onlar beni avlayacaktı." 
			
			text_eng = "They almost got me."
				
			ans[0] = "Gerçekten iyi bir avcısın. Neden avcılık?"
			ans_eng[0] = "You're a really good hunter. Why hunting?"
		}
	}
#endregion

#region Rebel War
	if (dialogueID == objQuest_rebelWar) {
		if (++countingNo == dialogueNo) {			
			text = "Gerçekten güvenimi kazanmayı başardın, ben de bu\nbilgiyi senle paylaşacağım. Ancak kimseye bahsetmemelisin."
			
			text_eng = "You really managed to earn my trust,\nand I will share this information with you.\nBut you shouldn't tell anyone."
				
			ans[0] = "Bahsetmeyeceğim."
			ans_eng[0] = "I will not."
		}
		if (++countingNo == dialogueNo) {
			text = npc_lordred+" agresifleşen yaratıkların sorumluluğunu bize yüklüyor.\nMektupta, askerlerimizi kendi tarikatının öldürdüğünü itiraf ediyor."
				
			text_eng = npc_lordred+" blames us for the aggressive creatures.\nIn the letter, he admits that his own sect was\n"
			+"killed by our soldiers."
			
			ans[0] = "Bunu neden yapmış?"
			ans_eng[0] = "Why?"
		}
		if (++countingNo == dialogueNo) {
			text = "Yaratıkların kendi içlerinde bir hiyerarşik düzeni vardır.\nBizim askerlerimizden bir grup bu düzeni bozarak\nonları kışkırtıyormuş."
				
			text_eng = "Creatures have a hierarchical order in themselves.\nHe said, a group of our soldiers broke this\norder and provoked them."
			
			ans[0] = "Saldırganlaşan yaratıkların nedeni bu mu?"
			ans_eng[0] = "Is this the reason of aggressive creatures?"
		}
		if (++countingNo == dialogueNo) {
			text = "Ne bileyim? Araştırıyoruz. Eğer dedikleri doğruysa bu yaratıkların\nhaklı saldırısını tetikler ve bunun sorumlusu biz oluruz."
				
			text_eng = "How should I know? We are investigating.\nIf what he says is true, it will trigger the rightful\nattack from these creatures and we will responsible\nfor it."
		
			ans[0] = "Bir fikrim var. Düzeni bozulan mağaranın yakınındaki\nBilinç'i yok edeyim. Bu sayede yaratıkların haberleşmelerini\nönleyebiliriz."
			ans_eng[0] = "I have an idea. Let me destroy the Wisdom near\nthe cave whose order has deteriorated. By this way,\nwe can prevent the creatures from communicating."
		}
		if (++countingNo == dialogueNo) {
			text = "Lufulus'un dikkatini çekmek istemiyoruz. Asilerden şüpheleniyorum.\nOnlara karşı başlattığımız savaşta bize destek ol."
				
			text_eng = "We do not want to attract Lufulus's attention.\nI suspect rebels. Support us in the war we started\nagainst them."
		
			ans[0] = "Mantıklı, belki ilişkili problemlerdir."
			ans_eng[0] = "Well."
		}
	}
#endregion

#region They Are Right
	if (dialogueID == objQuest_theyAreRight) {
		if (++countingNo == dialogueNo) {			
			text = "Lord "+npc_lordred+" sonuna kadar haklıymış. Klanımızdan\nolan asiler yaratıkları katletmişler.\nMağaralara girip kan minerali çalıyorlarmış."
			
			text_eng = "The lord was right. Rebels from our clan\nhad killed the creatures. They had entered the caves\nand stolen blood minerals."
			ans[0] = "Yaratıkların agresifleşmesine bu mu\nneden olmuş?"
			
			ans_eng[0] = "Is this the reason for aggression\nof the creatures?"
		}
		if (++countingNo == dialogueNo) {
			text = "Hayır.\nYaratıklar agresifleşmeye çok daha önce başlamışlar."
				
			text_eng = "No.\nThe creatures started to get aggressive much earlier."
			
			ans[0] = "Buna ne sebep oluyor?"
			ans_eng[0] = "What does cause this?"
		}
		if (++countingNo == dialogueNo) {
			text = "Nedenini bilmesek de, Lufulus'un bizi yok\netmek istediğini öğrendik."
				
			text_eng = "Although we do not know why,\nwe learned that Lufulus wants to destroy us."
			
			ans[0] = "Hızlıca saldırmalıyız."
			ans_eng[0] = "We have to attack quickly."
		}
		if (++countingNo == dialogueNo) {
			text = "Lufulus sandığından çok daha güçlü.\nKendini fazlasıyla geliştirmelisin.\nLord "+npc_lordred+" ile güçlerimizi birleştirmeye karar verdik."
				
			text_eng = "Lufulus is much stronger than you think.\nYou have to improve yourself a lot.\nWe decided to join forces with the Lord "+npc_lordred+"."
		}
		if (++countingNo == dialogueNo) {
			text = npc_lordred+" ile işbirliği yapmaktan çekinme.\nOnlara fazlasıyla ödeme yapacağız ki\nLufulus ile savaşımız sırasında aramızda\nproblem kalmasın."
				
			text_eng = "Don't hesitate to cooperate with "+npc_lordred+".\nWe will overpay them so that we do not have\nany problems during our war with Lufulus."
		}
	}
#endregion

#region FIXED
	var qKey = get_dialogue_qKey_quest(dialogueID, dialogueNo, countingNo)

	with (owner) {
		if (text != "") {
			dialogueBox = ask_npc(eng() ? text_eng : text, qKey,
			eng() ? ans_eng[0] : ans[0], eng() ? ans_eng[1] : ans[1], eng() ? ans_eng[2] : ans[2], eng() ? ans_eng[3] : ans[3], eng() ? ans_eng[4] : ans[4], eng() ? ans_eng[5] : ans[5], eng() ? ans_eng[6] : ans[6], eng() ? ans_eng[7] : ans[7])
			dialogueBox.dialogueID = dialogueID
			dialogueBox.dialogueNo = dialogueNo
			dialogueBox.dialogueSize = countingNo
		}
	}

	return dialogueBox
#endregion


}
