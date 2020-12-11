event_inherited()
name = eng() ? "Secret Letter" : "Mektubu Ulaştır"
type = type_quest

maxScore = 1

money = 50
experience = ceil(calculate_level_exp(1)/10)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = eng() ? "Ahh!\nLet nobody read the letter.\nGive this to the lord." : "Ahh! Kimsenin mektubu okumasına izin\nvermemen gerek, sadece mektubu Lord'a götür."

autoFinish = true
showWhenFinish = true
isDeletable = false
isSimpleQuest = false
isPrepQuest = false
hasChallenge = false

// only if !autoFinish
finishText = "" 

givenBy = npc_scout
givenBy_name = ""
givenLocation = ""

targetLocation = loc_hawmgrad
targetObject = npc_lorddamph

teleport = -1