event_inherited()
name = eng() ? "See the Lord" : "Lord'a Görün"
type = type_quest

maxScore = 1

money = 0
experience = ceil(calculate_level_exp(10)/5)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = eng() ? ("Make the lord see you when\nyou look stronger.") : ("Güçlü görünüyorken lorda görün.")

autoFinish = true
showWhenFinish = true
isDeletable = false
isSimpleQuest = false
isPrepQuest = false
hasChallenge = false

// only if !autoFinish
finishText = "" 

givenBy = objPlayer
givenBy_name = global.name
givenLocation = loc_hawmgrad

targetLocation = loc_hawmgrad
targetObject = npc_lorddamph

teleport = get_location(targetLocation)

alarm[0] = 2