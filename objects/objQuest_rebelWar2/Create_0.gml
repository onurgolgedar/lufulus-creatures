event_inherited()
name = eng() ? "The War Continues" : "Savaş Bitmedi"
type = type_quest

maxScore = 1

money = 0
experience = ceil(calculate_level_exp(17)/4)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = eng() ? ("The rebels have not yet given up.\nDefeat them once again.") : ("İsyancılar henüz pes etmedi. Onları bir kere\ndaha mağlup et.")

autoFinish = false
showWhenFinish = false
isDeletable = false
isSimpleQuest = false
isPrepQuest = false
hasChallenge = true
challenge = objChallenge_rebelWar2

// only if !autoFinish
finishText = "" 

givenBy = objGoore_npc
givenBy_name = npc_goore
givenLocation = loc_hawmgrad

targetLocation = loc_warzone2
targetObject = pointer_null

teleport = get_location(targetLocation)

alarm[0] = 2