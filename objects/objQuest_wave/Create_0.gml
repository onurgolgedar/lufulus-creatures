event_inherited()
name = eng() ? "Aggressive Creatures" : "Agresif Yaratıklar"
type = type_quest

maxScore = 1

money = 0
experience = ceil(calculate_level_exp(9)/3)
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = ""

autoFinish = true
showWhenFinish = true
isDeletable = false
isSimpleQuest = true
isPrepQuest = false
hasChallenge = false

// only if !autoFinish
finishText = "" 

givenBy = objPlayer
givenBy_name = global.name
givenLocation = loc_hawmgrad

targetLocation = loc_wave1
targetObject = pointer_null

teleport = get_location(targetLocation)

alarm[0] = 2