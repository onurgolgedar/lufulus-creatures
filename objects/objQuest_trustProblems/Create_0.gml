event_inherited()
name = eng() ? "Trust Problems" : "Güven Problemleri"
type = type_quest

maxScore = 1

money = 0
experience = 0
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = ""

autoFinish = true
showWhenFinish = false
isDeletable = false
isSimpleQuest = false
isPrepQuest = true
hasChallenge = false

// only if !autoFinish
finishText = "" 

givenBy = objPlayer
givenBy_name = global.name
givenLocation = loc_hawmgrad

targetLocation = pointer_null
targetObject = pointer_null

teleport = get_location(targetLocation)

alarm[0] = 2