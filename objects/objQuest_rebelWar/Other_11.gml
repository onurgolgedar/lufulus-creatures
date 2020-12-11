#region FIXED
var questNumber = get_quest_number(object_index)
#endregion

description =
eng() ? (npc_lorddamph+" asked for the rebels to be\ndestroyed in order to fight "+npc_lordred+"'s accusation.\nFight against the rebels.")
: (npc_lorddamph+", "+npc_lordred+"'ın suçlamasıyla mücadele için\nilk olarak Asiler'in yok edilmesini mantıklı\nbuldu. Asiler ile savaş.")
//+string_return(rewardText, !isPrepQuest)

#region FIXED
if (questNumber != -1 and global.questScore[questNumber] == global.questMaxScore[questNumber])
	description += eng() ? ("\n[c="+string(c_lime)+"]Quest is finished."+string_return("\nFrom: "+givenBy_name+" at "+givenLocation+"[/c]", !autoFinish)) : ("\n[c="+string(c_lime)+"]Görev tamamlandı."+string_return("\n"+givenLocation+" bölgesindeki "+givenBy_name+" ile ilgili.[/c]", !autoFinish))
else if (hasChallenge and !quest_exists(challenge))
	description += eng() ? ("\n\n[c="+string(c_challenge)+"]This quest has a challenge, find\nthe Challenger to inspect the challenge.[/c]") : ("\n\n[c="+string(c_challenge)+"]Bu görevin bir sözleşmesi bulunuyor,\nbunu incelemek için Söz Muhafızı'nı bul.[/c]")
#endregion