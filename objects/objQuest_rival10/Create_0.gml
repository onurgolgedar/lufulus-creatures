event_inherited()
name = eng() ? "See the Rival 10" : "Rakibini Tanı 10"
type = type_quest

maxScore = 50

money = 1000
experience = ceil(calculate_level_exp(17)/3)
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

targetLocation = loc_spawn8
targetObject = creature_g2

teleport = get_location(targetLocation)

alarm[0] = 2