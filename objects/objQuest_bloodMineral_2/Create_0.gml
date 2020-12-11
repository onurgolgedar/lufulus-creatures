event_inherited()
name = eng() ? "Ask the Letter" : "Mektubu Sor"
type = type_quest

maxScore = 1

money = 0
experience = ceil(calculate_level_exp(12)/2)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = eng() ? ("I am waiting for the news.") : ("Haberlerini bekliyorum.")

autoFinish = true
showWhenFinish = false
isDeletable = false
isSimpleQuest = false
isPrepQuest = false
hasChallenge = false

// only if !autoFinish
finishText = "" 

givenBy = objSenior_npc
givenBy_name = npc_senior
givenLocation = loc_hawmgrad

targetLocation = loc_hawmgrad
targetObject = npc_lorddamph

teleport = get_location(targetLocation)

alarm[0] = 2