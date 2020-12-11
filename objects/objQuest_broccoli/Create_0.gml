event_inherited()
name = eng() ? "Vegetarian" : "Vejetaryen"
type = type_quest

maxScore = 3

money = 0
experience = calculate_level_exp(3)/3
rewardText = eng() ? ("\n[c="+string(c_gold)+"]+"+string(money)+" gold, [c="+string(c_aqua)+"]+"+string(experience)+" exp[/c]") : ("\n[c="+string(c_gold)+"]+"+string(money)+" altın, [c="+string(c_aqua)+"]+"+string(experience)+" tecrübe[/c]")
earlyDescription = eng() ? ("") : ("")

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

targetLocation = loc_spawn0
targetObject = pointer_null

teleport = get_location(targetLocation)

alarm[0] = 2