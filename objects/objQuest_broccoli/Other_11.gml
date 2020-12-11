#region FIXED
var questNumber = get_quest_number(object_index)
#endregion

var qs = (questNumber == -1 or pureReading_mode) ? "" : (string(global.questScore[questNumber])+"/")

description = (eng() ? ("Eat "+qs+string(maxScore)+" broccolis. Gather your energy.\n\nBroccolis and other collectable bonuses can be\ncollected during fights. They can make you survive!\nBroccoli heals you and makes you resistant to\nstun and slow effects for a while.")
: (qs+string(maxScore)+" tane brokoli ye. Bitkin görünüyorsun.\n\nBrokoli ve diğer toplanabilir takviyeler\nçatışma sırasında ortaya çıkarlar.\nSağ kurtulmanızı sağlayabilirler!\nBrokoli yendiğinde canını doldurur ve\nbir süre boyunca sersemlemenizi engeller."))
//+string_return(rewardText, !isPrepQuest)

#region FIXED
if (questNumber != -1 and global.questScore[questNumber] == global.questMaxScore[questNumber])
	description += eng() ? ("\n[c="+string(c_lime)+"]Quest is finished."+string_return("\nFrom: "+givenBy_name+" at "+givenLocation+"[/c]", !autoFinish)) : ("\n[c="+string(c_lime)+"]Görev tamamlandı."+string_return("\n"+givenLocation+" bölgesindeki "+givenBy_name+" ile ilgili.[/c]", !autoFinish))
else if (hasChallenge and !quest_exists(challenge))
	description += eng() ? ("\n\n[c="+string(c_challenge)+"]This quest has a challenge, find\nthe Challenger to inspect the challenge.[/c]") : ("\n\n[c="+string(c_challenge)+"]Bu görevin bir sözleşmesi bulunuyor,\nbunu incelemek için Söz Muhafızı'nı bul.[/c]")
#endregion