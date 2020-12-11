#region FIXED
var questNumber = get_quest_number(object_index)
#endregion

var qs = (questNumber == -1 or pureReading_mode) ? "" : (string(global.questScore[questNumber])+"/")

var questInstance = instance_create(-50, -50, conditionalQuest)
var questName = questInstance.name
instance_destroy(questInstance)

description = (eng() ? ("Complete [c="+string(c_fuchsia)+"]"+questName+"[/c] quest with\nonly one soldier.\nIf this quest is taken, you will have only\none(not two) friend at the quest area.\n\n[c="+string(c_challenge)+"]REQUIREMENTS\nMinimum Level: "+string(minLevel_challenge)+"\nMaximum Level: "+string(maxLevel_challenge)+"[/c]")
: ("[c="+string(c_fuchsia)+"]"+questName+"[/c] görevini iki değil tek\nasker eşliğinde tamamla.\nBu görevi aldıktan sonra görev alanında\ntek dostun olur.\n\n[c="+string(c_challenge)+"]GEREKLİLİKLER\nMinimum Seviye: "+string(minLevel_challenge)+"\nMaksimum Seviye: "+string(maxLevel_challenge))+"[/c]")
//+string_return(rewardText, !isPrepQuest)

#region FIXED
if (questNumber != -1 and global.questScore[questNumber] == global.questMaxScore[questNumber])
	description += eng() ? ("[c="+string(c_lime)+"]\Challenge is completed."+string_return("\nFrom: "+givenBy_name+" at "+givenLocation+"[/c]", !autoFinish)) : ("[c="+string(c_lime)+"]\nSözleşme kazanıldı."+string_return("\n"+givenLocation+" bölgesindeki "+givenBy_name+" ile ilgili.[/c]", !autoFinish))
#endregion