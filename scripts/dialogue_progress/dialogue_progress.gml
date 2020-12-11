/// @param dialogueID
/// @param dialogueNo
/// @param owner
/// @param answerBefore*
function dialogue_progress() {

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

#region Lord Damph
	if (owner.object_index == objLordDamph_npc) {
		if (dialogueID == 1) {		
			if (++countingNo == dialogueNo) {			
				text = nm+"! Bu halin ne? Korkak bir domuz\ngibi görünüyorsun."
				text_eng = nm+"! What a sight you are!\nYou look like a coward."
				
				ans[0] = "..."
				ans_eng[0] = "..."
			}
			if (++countingNo == dialogueNo) {			
				text = "Eğer seni bir daha böyle korkak görürsem elin\n"
				+"bir daha kılıç tutamaz!"
				text_eng = "If I ever see you like that again, your"
				+"\nhand can't hold a sword again."
				
				ans[0] = "Size vermem gereken bir mektup var."
				ans_eng[0] = "There is a letter for you."
			}
			if (++countingNo == dialogueNo) {			
				text = "Nereden geldi bu mektup?"
				text_eng = "Where did this letter come from?"
				
				ans[0] = "Bir asker son nefesinde bana verdi."
				ans[1] = "Bir yaratığın midesinde buldum."
	
				ans_eng[0] = "A soldier gave me this, before his last breath."
				ans_eng[1] = "I found it in a creature's stomach."
			}
			if (++countingNo == dialogueNo) {
				if (answerBefore == 0) {
					text = "Tamam. Çekilebilirsin, buralardan çok\nuzaklaşma."
					text_eng = "Don't get away from here,\nmy eyes are on you."
				}
				else if (answerBefore == 1) {
					text = "O zaman nasıl bu kadar kuru?\n"
					+"Neyse, çekilebilirsin. Buralardan çok uzaklaşma.\n"
					+"Gözüm üzerinde."
					text_eng = "Then, how is it dry?\nDon't get away from here, my eyes are on you."
				}
			}
		}
		else if (dialogueID == 2) {
			if (++countingNo == dialogueNo) {
				text = "Sorun nedir, "+global.name+"?"
				text_eng = "Yes, "+global.name+"."
				
				ans[0] = "Size teslim ettiğim mektupta ne\nyazdığını gerçekten merak ediyorum."
				ans_eng[0] = "I wonder the content of the\nletter that I delivered to you."
			}
		}
		else if (dialogueID == 3) {		
			if (++countingNo == dialogueNo) {
				text = "Savaş alanında bulunman kazanmamızda çok\n"
				+"belirleyici oldu. Petlig'i kabul et. Bizi\n"
				+"savaş alanında yalnız bırakmadığın gibi,\n"
				+"o da seni yalnız bırakmayacaktır.\n\n"
				+"[c="+string(c_orange)+"]Petlig'i[c="+string(c_aqua)+"] uzatır.[/c]"
				text_eng = "Your presence there was effective.\n"
				+"Take Petlig. She won't leave you alone,\n"
				+"just like you didn't leave us alone.\n\n"
				+"[c="+string(c_aqua)+"]Gives [c="+string(c_orange)+"]Petlig[c="+string(c_aqua)+"].[/c]"
			
				add_item(objPet_001)
				show_gainmessage(1, "Petlig")
			}
			else if (++countingNo == dialogueNo) {
				text = "İsyancıların komutanlarını ele geçirdik.\n"
				+"Ben onu yeterince konuştururum, sonra seninle\n"
				+"tekrar görüşelim."
				text_eng = "We captured the commanders of the rebels.\n"
				+"I'll make him talk enough, then I will\n"
				+"see you again."
			}
		}
	}
#endregion

#region Lord Red
	if (owner.object_index == objLordRed_npc) {
		if (dialogueID == 1) {		
			if (++countingNo == dialogueNo) {			
				text = "Umarım ne söyleyeceğin şeyi en az iki\nkere düşünmüşsündür."
				text_eng = "I hope you think twice, before you talk."
				
				ans[0] = "Bu altınları hatamızın karşılığı olarak al. (10.000)"
				ans_eng[0] = "Get these gold coins for our mistake. (10,000)"
			
				ans[1] = "Hatalarımızın karşılığını isteme, dost olalım."
				ans_eng[1] = "Do not expect a compensation, let's be friends."
			}
		
			// THE WAY TO GIVE A REWARD ACCORDING TO THE ANSWER
			if (countingNo+1 == dialogueNo) {
				if (answerBefore == 0) {
					if (global.money >= 10000) {
						change_money(-10000, true)
					
						with (objLordRed_npc)
							event_user(3)
						add_title(title_loyal, eng() ? "The gold you paid while recruiting soldiers\nfor your group decreased by 15%." : "Grubuna asker alırken ödediğin altın %15 azaldı.")
					
						quest_progress(objQuest_theyAreRight, 1)
					}
					else {
						show_messagebox(600, 90, eng() ? "You have not enough money." : "Yeterince altının yok.", eng() ? "Operation Failed" : "İşlem Gerçekleştirilemedi", sec)
						return pointer_null
					}
				}
				else if (answerBefore == 1)
					quest_progress(objQuest_theyAreRight, 1)
			}
		
			if (++countingNo == dialogueNo) {
				text = "Yıllar sürmüş dostluğumuzu bozmayacağım.\nLufulus ile beraber mücadele etmeliyiz."
				text_eng = "I will not spoil our friendship that has lasted\nfor years. We have to fight with Lufulus."
			
				ans[0] = "Bu ikimiz için de çok iyi olur."
				ans_eng[0] = "That is good for both of us."
			}
		
			if (++countingNo == dialogueNo) {
				text = "Adamlarım Lufulus'un yerini tespit etti.\nHaritanda görebilirsin. Tek başına alt etmen imkansız.\nSakın çılgınca şeyler deneyeyim deme."
				text_eng = "My soldiers spotted Lufulus.\nYou can see it on your map. It is impossible to\ndefeat alone. Do not try crazy things."
			}
		}
	}
#endregion

#region Goore
	if (owner.object_index == objGoore_npc) {
		if (dialogueID == 1) {		
			if (++countingNo == dialogueNo) {			
				text = "Bu kılıç mükemmel olmuş."
				text_eng = "This sword is perfect."
				
				ans[0] = "Elimden geleni yaptım."
				ans_eng[0] = "I did my best."
			}
			if (++countingNo == dialogueNo) {
				text = "Sana gerçek bir teşekkür etmeliyim.\n"
				+"Bu altınları benim için kabul et.\n\n"
				+"[c="+string(c_gold)+"]300 altın[c="+string(c_aqua)+"] uzatır.[/c]"
				text_eng = "Thank you very much!\n"
				+"You deserve this gold.\n\n"
				+"[c="+string(c_aqua)+"]Offers [c="+string(c_gold)+"]300 gold[c="+string(c_aqua)+"].[/c]"
				
				ans[0] = "Buna ihtiyacım olacak."
				ans[1] = "Hayır, bunu altın için yapmadım."
			
				ans_eng[0] = "I need this."
				ans_eng[1] = "No, it was not for gold."
			}
		
			// THE WAY TO GIVE A REWARD ACCORDING TO THE ANSWER
			if (countingNo+1 == dialogueNo) {
				if (answerBefore == 0) {
					change_money(300, true)
					show_gainmessage(300)
				}
				else if (answerBefore == 1) {
					if (++countingNo == dialogueNo) {
						text = "Sen iyi bir adamsın."
						text_eng = "You are a good man."
					}
				
					add_title(title_honorable, eng() ? "Titles provide advantages in some areas.\nFor example, you can earn more interest from\nyour gold accumulated in the bank." : "Bu tür ünvanlar bazı alanlarda avantajlar\nsağlar. Örneğin bankada biriken kiranızdan\ndaha fazla faiz kazanabilirsiniz.")
					show_gainmessage(150)
				}
			}
		}
		else if (dialogueID == 2) {
			if (++countingNo == dialogueNo) {
				text = "Sende bu kılıca uygun gelişim materyali göremedim.\n"
				+"Bunu al, başka türlü bu seviyede bir kılıcı geliştiremezsin."
		
				text_eng = "I see you have no materials proper\n"
				+"for this sword. Take this material.\n"
				+"Otherwise, you cannot upgrade."
			
				add_item(objUpgradeMaterial, 2)
			
				show_gainmessage(1, eng() ? "Material" : "Materyal")
			}
		}
		else if (dialogueID == 3) {
			if (++countingNo == dialogueNo) {
				text = "Kampı yok ettiğinin haberi senden önce geldi.\n"
				+"Bu başarının hakkını vermem lazım."
		
				text_eng = "The rumor that it has cleared the area\n"
				+"has already spread. You have to be rewarded\n"
				+"for this success."
			}
			if (++countingNo == dialogueNo) {
				text = "Tüm pazarlarda kalıcı %15 indirim mi istersin?\n\n"
				+"Yoksa, iki günde bir bankadaki stoğuna\n"
				+"ganimet eklenmesi için talimat mı vereyim?"
		
				text_eng = "Do you want permanent 15% discount for markets?\n\n"
				+"Or should I order instructions to add loots\n"
				+"to your stock every two days?"
			
				ans[0] = "İndirimi tercih ederim."
				ans[1] = "Sürprizleri severim."
			
				ans_eng[0] = "I prefer the discount."
				ans_eng[1] = "I welcome the loots."
			}
		
			// THE WAY TO GIVE A REWARD ACCORDING TO THE ANSWER
			if (countingNo+1 == dialogueNo) {
				if (answerBefore == 0) {
					text = "Tamam... %15 indirimin artık devrede."
		
					text_eng = "Okay... 15% discount is activated for you."
				
					set_gamechoice(0, choice_1)
				}
				else if (answerBefore == 1) {
					text = "Tamam... Adamlarım 2 günde bir güzel\neşyalar gönderir."
		
					text_eng = "Okay... My soldiers will add new items\nto your bank every 2 days."
				
					set_gamechoice(0, choice_2)
				}
			}
		}
		else if (dialogueID == 4) {
			if (++countingNo == dialogueNo) {
				text = "Savaştaki büyük etkin için sana borçluyuz."
		
				text_eng = "We owe you for the big effect in the war."
			}
		}
	}
#endregion

#region Senior
	if (owner.object_index == objSenior_npc) {
		if (dialogueID == 1) {
			if (++countingNo == dialogueNo) {			
				text = nm+", her şey yolunda mı?"
				text_eng = nm+", is everything okay?"
				
				ans[0] = "Lord ile ilgili söylemem gerekenler var."
				ans_eng[0] = "I have something to say about the Lord."
			}
			if (++countingNo == dialogueNo) {			
				text = "Anlat dinliyorum."
				text_eng = "What do you want to say about him?"
				
				ans[0] = "Benim korkak olduğumu söylüyor. Bana\ngüvenmesini istiyorum."
				ans_eng[0] = "He says I'm a coward. I want him to trust me."
			}
			if (++countingNo == dialogueNo) {			
				text = "O sadece korkularını yenebilenlere\nsaygı duyar. Lord'u gerçekten önemsiyorsan\n"
				+"bana en büyük korkundan bahset."
				text_eng = "He respects only those who can overcome\ntheir fears. If you really care about\nthe Lord, tell me about your greatest fear."
				
				ans[0] = "Karanlıktır, efendim."
				ans_eng[0] = "It is darkness, sir."
			}
			if (++countingNo == dialogueNo) {
				text = "Senden bildiğim en karanlık yere gitmeni isteyeceğim.\n"
				+"Hem korkularınla yüzleş. Hem de bana ihtiyacım\n"
				+"olan Kan Minerali'ni getir."
				text_eng = "I'm going to ask you to go to the darkest\nplace I know. Face your fears. And, bring me the\nBlood Mineral that I need. I will surprise you."
				
				ans[0] = "Hazır olduğumda söyleyeceğim."
				ans_eng[0] = "I will come back when I am ready."
			}
		}
		else if (dialogueID == 2) {
			if (++countingNo == dialogueNo) {			
				text = "Gerçekten gitmişsin! Yapabileceğini düşünmemiştim.\n"
				+"Bu mağaralar özeldir, girebilmen mümkün olmamalıydı.\n"
				+"Mağara olayı sır olarak kalsın. Ben de seninle bu iksiri\npaylaşayım.\n\n"
				+"[c="+string(c_orange)+"]Kuvvet İksiri[c="+string(c_aqua)+"] uzatır.[/c]"
				text_eng = "You really came in! I didn't think you could.\n"
				+"These caves are special, you shouldn't be able to enter.\n"
				+"Don't tell anyone you did this.\n\nAnd... I prepared a potion to you. [c="+string(c_aqua)+"]\nOffers [c="+string(c_orange)+"]Power Potion[/c]."
				
				ans[0] = "Bu işime yarayabilir."
			
				ans_eng[0] = "This can work."
			}
			if (++countingNo == dialogueNo) {
				text = "Bu senindir. İçtikten sonra Lord ile\n"
				+"mutlaka görüş. Seni kuvvetli görünce etkilenecektir."
				
				text_eng = "This is yours. Be sure to see the Lord\n"
				+"after drinking. He will be impressed\n"
				+"when he see you strong."
				
				add_item(objPotion_001Q)
				show_gainmessage(1, eng() ? "Power Potion" : "Kuvvet İksiri")
				
				add_quest(objQuest_lordLoves)
			}
		}
		else if (dialogueID == 3) {
			if (++countingNo == dialogueNo) {			
				text = "Bu çok özel bir mineraldir "+nm+".\nMağaraya neden tekrar girdin?"
			
				text_eng = "This is a special mineral "+nm+",\nWhy did you go to the cave again?"
				
				ans[0] = "Girmedim, minerali dışarıda buldum."
			
				ans_eng[0] = "I did not. I found it outside."
			}
			if (++countingNo == dialogueNo) {
				text = "Dışarıda bulmuş olman imkansız!\nMağaradaki yaratıklar asla dışarı çıkmaz.\nKan minerali onlar için çok özeldir.\nGizli ve sistematik çalışırlar."
				
				text_eng = "That you found it outside is impossible!\nThe creatures inside never go outside.\nBlood Minerals are precious for them.\nThey work systematically and secretly."
			
				ans[0] = "Onu bir yaratığın içine gömülü\nolarak buldum."
			
				ans_eng[0] = "I found it buried in a creature."
			}
			if (++countingNo == dialogueNo) {
				text = "Yaratıklar bize zarar vermiyor.\nOnları neden öldürüyorsun?"
				
				text_eng = "The creatures does not hurt us.\nWhy do you kill them?"
			
				ans[0] = "Lanet yaratıkları sevmiyorum,\nburadakiler zarar vermese de vadidekiler veriyor."
			
				ans_eng[0] = "I don't like them, even the near creatures\ndoesn't hurt us others that are in\nthe valley does."
			}
			if (++countingNo == dialogueNo) {
				text = "Beni şaşırtıyorsun. Nefretin normal değil.\nOlanları düşünüp seninle tekrar konuşacağım."
				
				text_eng = "You are confusing me. Your hatret is abnormal.\nI'll think about what happened and talk to you again."
			}
		}
	}
#endregion

#region Trogen
	if (owner.object_index == objUpgrader_npc and owner.name = npc_trogen) {
		if (dialogueID == 1) {
			if (++countingNo == dialogueNo) {			
				text = "Merhaba, sana nasıl yardımcı olabilirim?"
				text_eng = "Hello, how can I help you?"

				ans[0] = "Bu kılıcı bir harabeden buldum, onarabilir\n"
				+"misiniz?"
				ans_eng[0] = "I found this sword from a ruin,\ncould you fix it?"
			}
			if (++countingNo == dialogueNo) {			
				text  = "Bir tenekeyi bile kılıca dönüştürebilirim.\n"
				+"Tek yapman gereken, silahını masaya bırakman."
			
				text_eng = "I can even turn a can into a sword."
				+"\nAll you have to do is lay your sword on the table."
			}
		}
	}
#endregion

#region Elise
	if (owner.object_index == objElise_npc) {
		if (dialogueID == 1) {
			if (++countingNo == dialogueNo) {			
				text = global.name+"! Dün olanlar inanılmazdı.\nGücünü daha da geliştirmelisin."
				+" Babama olanlardan\nve beni kurtardığından bahsettim. Sana çok\nşey borçluyum."
				text_eng = global.name+"! What happened yesterday\nwas incredible. You need to develop your"
				+"\nstrength further."

				ans[0] = "Ne olduğunu anlayacağım."
				ans_eng[0] = "I'll care of it."
			}
		}
	}
#endregion

#region Road Hunter
	if (owner.object_index == objEliseRoad_npc) {
		if (dialogueID == 1) {
			if (++countingNo == dialogueNo) {			
				text = global.name+", burada ne işin var?\nBenimle gel. Hiç iyi görünmüyorsun."
				+"\nSana "+loc_hawmgrad+"'e kadar eşlik edeyim."
				text_eng = global.name+", what are you doing here?\nCome with me. You don't look good."
				+"\nThis way goes to the castle."

				ans[0] = "İyi olur."
				ans_eng[0] = "Well."
			
				ans[1] = "Tek başıma gidebilirim."
				ans_eng[1] = "I can do it myself."
			}
		}
	}
#endregion

#region FIXED
	var qKey = get_dialogue_qKey(dialogueID, dialogueNo, countingNo)

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
