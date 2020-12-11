event_inherited()
name = eng() ? ("Bring the Sword to "+npc_trogen) : ("Kılıcı "+npc_trogen+"'e Götür")
type = type_quest

maxScore = 1

money = 0
experience = ceil(calculate_level_exp(5)/5)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = eng() ? "Can you handle this?" : "Bunu halledebilir misin?"

autoFinish = false
showWhenFinish = true
isDeletable = false
isSimpleQuest = false
isPrepQuest = false
hasChallenge = false

// only if !autoFinish
finishText = "" 

givenBy = objGoore_npc
givenBy_name = npc_goore
givenLocation = loc_hawmgrad

targetLocation = loc_hawmgrad
targetObject = npc_trogen

teleport = get_location(targetLocation)

alarm[0] = 2