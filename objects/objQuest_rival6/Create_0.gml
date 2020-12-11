event_inherited()
name = eng() ? "See the Rival 6" : "Rakibini Tanı 6"
type = type_quest

maxScore = 1

money = 250
experience = ceil(calculate_level_exp(16)/3)
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

targetLocation = loc_spawn6
targetObject = leader_text+creature_5

teleport = get_location(targetLocation)

alarm[0] = 2