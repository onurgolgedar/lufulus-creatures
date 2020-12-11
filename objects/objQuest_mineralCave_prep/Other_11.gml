#region FIXED
var questNumber = get_quest_number(object_index)
#endregion

var qs = (questNumber == -1 or pureReading_mode) ? "" : (string(global.questScore[questNumber])+"/")

var neededLevel = 7
if (global.level < neededLevel)
	description = (eng() ? ("You will be ready for the cave when you\nare level "+string(neededLevel)+".")
	: (string(neededLevel)+". seviye olduğunda mağara için hazır\nolacaksın."))
else
	description = (eng() ? ("You are level "+string(global.level)+". It is time to talk with "+npc_senior+".\n\nYou can see [c="+string(c_red)+"]red exclamation marks[/c] on the map(M),\nthese marks show quest offers.")
	: (string(neededLevel)+". seviye oldun, "+npc_senior+" ile konuşabilirsin.\n\nHaritadaki(M) [c="+string(c_red)+"]kırmızı ünlemler[/c] görev\ntekliflerini gösterir."))

#region FIXED
if (questNumber != -1 and global.questScore[questNumber] == global.questMaxScore[questNumber])
	description += eng() ? ("\n[c="+string(c_lime)+"]Quest is finished."+string_return("\nFrom: "+givenBy_name+" at "+givenLocation+"[/c]", !autoFinish)) : ("\n[c="+string(c_lime)+"]Görev tamamlandı."+string_return("\n"+givenLocation+" bölgesindeki "+givenBy_name+" ile ilgili.[/c]", !autoFinish))
else if (hasChallenge and !quest_exists(challenge))
	description += eng() ? ("\n\n[c="+string(c_challenge)+"]This quest has a challenge, find\nthe Challenger to inspect the challenge.[/c]") : ("\n\n[c="+string(c_challenge)+"]Bu görevin bir sözleşmesi bulunuyor,\nbunu incelemek için Söz Muhafızı'nı bul.[/c]")
#endregion