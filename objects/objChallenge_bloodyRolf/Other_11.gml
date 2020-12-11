#region FIXED
var questNumber = get_quest_number(object_index)
#endregion

// ! Only for this challenge, the right side is -questNumber, not questNumber
var qs = (questNumber == -1 or pureReading_mode) ? "" : string(-global.questScore[questNumber])

var questInstance = instance_create(-50, -50, conditionalQuest)
var questName = questInstance.name
instance_destroy(questInstance)

description = (eng() ? ("Finish [c="+string(c_fuchsia)+"]"+questName+"[/c] while you are [c="+string(c_red)+"]Unsafe[/c].\nYou can switch safety by "+(IS_MOBILE ? "tapping" : "clicking")+" the circular\nsymbol that is at left-top corner.\nYou will directly be Unsafe at "+loc_mineralcave+"\nbecause of this challenge.\n\n[c="+string(c_challenge)+"]REQUIREMENTS\nMinimum Level: "+string(minLevel_challenge)+"\nMaximum Level: "+string(maxLevel_challenge)+"[/c]")
: ("[c="+string(c_fuchsia)+"]"+questName+"[/c] görevini [c="+string(c_red)+"]Tehlikeli[/c] durumdayken bitir.\nDurumunu en sol üst köşedeki etkiye "+(IS_MOBILE ? "dokunarak" : "tıklayarak")+"\ndeğiştirebilirsin.\nBu sözleşme ile mağarada otomatik olarak tehlikeli\ndurumda olacaksın.\n\n[c="+string(c_challenge)+"]GEREKLİLİKLER\nMinimum Seviye: "+string(minLevel_challenge)+"\nMaksimum Seviye: "+string(maxLevel_challenge))+"[/c]")
//+string_return(rewardText, !isPrepQuest)

#region FIXED
if (questNumber != -1 and global.questScore[questNumber] == global.questMaxScore[questNumber])
	description += eng() ? ("[c="+string(c_lime)+"]\Challenge is completed."+string_return("\nFrom: "+givenBy_name+" at "+givenLocation+"[/c]", !autoFinish)) : ("[c="+string(c_lime)+"]\nSözleşme kazanıldı."+string_return("\n"+givenLocation+" bölgesindeki "+givenBy_name+" ile ilgili.[/c]", !autoFinish))
#endregion